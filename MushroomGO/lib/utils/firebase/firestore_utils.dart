import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mushroom_go/exception/loading_exception.dart';
import 'package:mushroom_go/models/article.dart';
import 'package:mushroom_go/models/firestore_pagination.dart';
import 'package:mushroom_go/models/mission.dart';
import 'package:mushroom_go/models/mushroom.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mushroom_go/models/mushroom_scan.dart';
import 'package:mushroom_go/models/mushroom_scan_image.dart';
import 'package:mushroom_go/models/recipe.dart';

class FirestoreUtils{
  FirestoreUtils._();

  static Future<FirestorePagination<Mushroom>> searchMushroom(BuildContext context, String mushroom, int limit, List<String>? lastResultName, List<String>? lastResultNameScientific) async {
    try {
      List<String>? lastName;
      List<String>? lastNameScientific;
      Query queryName = FirebaseFirestore.instance
        .collection("mushroom")
        .where("name", isGreaterThanOrEqualTo: mushroom.toLowerCase())
        .where("name", isLessThan: '${mushroom.toLowerCase()}\uf8ff')
        .orderBy("name")
        .limit(limit);
      if (lastResultName != null) {
        queryName = queryName.startAfter(lastResultName);
      }
      QuerySnapshot snapshotName = await queryName.get();
      Query queryNameScientific = FirebaseFirestore.instance
        .collection("mushroom")
        .where("name_scientific", isGreaterThanOrEqualTo: mushroom.toLowerCase())
        .where("name_scientific", isLessThan: '${mushroom.toLowerCase()}\uf8ff')
        .orderBy("name_scientific")
        .limit(limit);
      if (lastResultNameScientific != null) {
        queryNameScientific = queryNameScientific.startAfter(lastResultNameScientific);
      }
      QuerySnapshot snapshotNameScientific = await queryNameScientific.get();
      if (snapshotName.docs.isNotEmpty) {
        lastName = [Mushroom.fromMap(snapshotName.docs.last.data() as Map<String, Object?>).name.toLowerCase()];
      } else {
        lastName = lastResultName;
      }
      if (snapshotNameScientific.docs.isNotEmpty) {
        lastNameScientific = [Mushroom.fromMap(snapshotNameScientific.docs.last.data() as Map<String, Object?>).scientificName.toLowerCase()];
      } else {
        lastNameScientific = lastResultNameScientific;
      }
      final result = {
        for (var doc in snapshotName.docs + snapshotNameScientific.docs) doc.id: doc.data() as Map<String, Object?>,
      };
      List<Map<String, List<String>?>> lastResult = [
        {"lastResultName": lastName},
        {"lastResultNameScientific": lastNameScientific}
      ];
      return FirestorePagination<Mushroom>(limit: limit, result: result.values.map((data) => Mushroom.fromMap(data)).toList(), lastResult: lastResult);
    } catch (e) {
      if(context.mounted){
        throw LoadingException(AppLocalizations.of(context)!.firestoreUtilsSearchMushroomTitle, AppLocalizations.of(context)!.firestoreUtilsSearchMushroomError);
      }
    }
    return FirestorePagination<Mushroom>(limit: limit, result: [], lastResult: []);
  }

  static Future<Mushroom?> getMushroomNameScientific(BuildContext context, String mushroom, {bool isThrow = true}) async {
    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
                                            .collection("mushroom")
                                            .where("name_scientific", isEqualTo: mushroom.toLowerCase())
                                            .get();
      if (querySnapshot.docs.isNotEmpty) {
        return Mushroom.fromMap(querySnapshot.docs.first.data() as Map<String, Object?>, id: querySnapshot.docs.first.id);
      } else {
        return null;
      }
    } catch (e) {
      if(context.mounted && isThrow){
        throw LoadingException(AppLocalizations.of(context)!.firestoreUtilsSearchMushroomTitle, AppLocalizations.of(context)!.firestoreUtilsSearchMushroomError);
      }
    }
    return null;
  }

  static Future<Mushroom?> getMushroomId(BuildContext context, String? id, {bool isThrow = true}) async {
    try {
      if(id == null || id.isEmpty) return null;
      final querySnapshot = await FirebaseFirestore.instance
          .collection("mushroom")
          .doc(id)
          .get();
      return Mushroom.fromMap(querySnapshot.data() as Map<String, Object?>, id: querySnapshot.id);
    } catch (e) {
      if(context.mounted && isThrow){
        // TODO: change string (LoadingException)
        throw LoadingException(AppLocalizations.of(context)!.firestoreUtilsSearchMushroomTitle, AppLocalizations.of(context)!.firestoreUtilsSearchMushroomError);
      }
    }
    return null;
  }

  static Future<MushroomScan?> addMushroomHistory(BuildContext context, String mushroom, MushroomScanImage mushroomScanImage) async {
    try {
      final MushroomScan mushroomScan = MushroomScan(scientificName: mushroom.toLowerCase(), mushroom: await getMushroomNameScientific(context, mushroom, isThrow: false), position: mushroomScanImage.position, dateTime: mushroomScanImage.dateTime);
      await FirebaseFirestore.instance
        .collection("scan_mushroom")
        .doc()
        .set(mushroomScan.toMap());
      return mushroomScan;
    } catch (e) {
      // TODO: change string (LoadingException)
      if(context.mounted){
        throw LoadingException(AppLocalizations.of(context)!.firestoreUtilsSearchMushroomTitle, AppLocalizations.of(context)!.firestoreUtilsSearchMushroomError);
      }
    }
    return null;
  }

  static Future<FirestorePagination<MushroomScan>> getMushroomHistory(BuildContext context, int limit, List<DateTime>? lastResultDateTime) async {
    try {
      List<DateTime>? lastDateTime;
      List<MushroomScan> result = [];
      final user = FirebaseAuth.instance.currentUser;
      Query queryHistory = FirebaseFirestore.instance
          .collection("scan_mushroom")
          .where("user", isEqualTo: user!.uid)
          .orderBy("date", descending: true)
          .limit(limit);
      if (lastResultDateTime != null) {
        queryHistory = queryHistory.startAfter(lastResultDateTime);
      }
      QuerySnapshot snapshotHistory = await queryHistory.get();
      if (snapshotHistory.docs.isNotEmpty) {
        if(context.mounted){
          for(var doc in snapshotHistory.docs){
            Map<String, Object?> data = doc.data() as Map<String, Object?>;
            result.add(MushroomScan.fromMap(data, await getMushroomId(context, data["mushroom_id"] as String?)));
          }
          lastDateTime = [result.last.dateTime.toUtc()];
        }
      } else {
        lastDateTime = lastResultDateTime;
      }
      List<Map<String, List<DateTime>?>> lastResult = [
        {"lastDateTime": lastDateTime}
      ];
      return FirestorePagination<MushroomScan>(limit: limit, result: result, lastResultDateTime: lastResult);
    } catch (e) {
      // TODO: change string (LoadingException)
      if(context.mounted){
        throw LoadingException(AppLocalizations.of(context)!.firestoreUtilsSearchMushroomTitle, AppLocalizations.of(context)!.firestoreUtilsSearchMushroomError);
      }
    }
    return FirestorePagination<MushroomScan>(limit: limit, result: [], lastResult: []);
  }

  static Future<List<Mushroom>> fetchChallengeMushrooms(BuildContext context) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance.collection("challenge_mushroom").get();

      List<Mushroom> challengeMushrooms = [];
      for (var doc in querySnapshot.docs) {
        final challengeData = doc.data();
        final mushroomId = challengeData["mushroom_id"];
        if (mushroomId != null) {
          final mushroomSnapshot = await FirebaseFirestore.instance
              .collection("mushroom")
              .doc(mushroomId)
              .get();

          if (mushroomSnapshot.exists) {
            final String rarityString = challengeData["rarity"];
            final Rarity rarity;
            switch (rarityString) {
              case "rare":
                rarity = Rarity.rare;
                break;
              case "common":
                rarity = Rarity.common;
                break;
              case "epic":
                rarity = Rarity.epic;
                break;
              default:
                rarity = Rarity.common;
            }

            final Mushroom mushroom = Mushroom.fromMap(mushroomSnapshot.data() as Map<String, Object?>, id: mushroomId, rarity: rarity);
            challengeMushrooms.add(mushroom);
          }
        }
      }
      return challengeMushrooms;
    } catch (e) {
      if (context.mounted) {
        // TODO: change string (LoadingException)
        throw LoadingException(
          AppLocalizations.of(context)!.firestoreUtilsSearchMushroomTitle,
          AppLocalizations.of(context)!.firestoreUtilsSearchMushroomError,
        );
      }
      return [];
    }
  }
  static Future<List<Mushroom>> fetchChallengeMushroomsWithUnlockState(BuildContext context) async {
    try {
      final List<Mushroom> challengeMushrooms = await fetchChallengeMushrooms(context);

      final userId = FirebaseAuth.instance.currentUser!.uid;
      final scanMushroomsSnapshot = await FirebaseFirestore.instance
          .collection("scan_mushroom")
          .where("user", isEqualTo: userId)
          .get();

      final scannedMushroomIds = scanMushroomsSnapshot.docs
          .map((doc) => doc.data()["mushroom_id"] as String?)
          .toSet();
      final List<Mushroom> challengeMushroomsUnlockState = [];
      Mushroom mushroom;
      for (mushroom in challengeMushrooms) {
        mushroom.isUnlock = scannedMushroomIds.contains(mushroom.id);
        challengeMushroomsUnlockState.add(mushroom);
      }

      return challengeMushroomsUnlockState;
    } catch (e) {
      if (context.mounted) {
        // TODO: change string (LoadingException)
        throw LoadingException(
          AppLocalizations.of(context)!.firestoreUtilsSearchMushroomTitle,
          AppLocalizations.of(context)!.firestoreUtilsSearchMushroomError,
        );
      }
      return [];
    }
  }
  static Future<List<Mission>> fetchMissionsWithUserProgress(BuildContext context) async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      final missionSnapshot = await FirebaseFirestore.instance.collection("mission").get();

      final userMissionSnapshot = await FirebaseFirestore.instance
          .collection("mission_user")
          .where("user_id", isEqualTo: userId)
          .get();

      final userMissionMap = {
        for (var doc in userMissionSnapshot.docs)
          doc.data()["mission_id"]: doc.data()
      };

      final missions = <Mission>[];
      for (var missionDoc in missionSnapshot.docs) {
        final missionData = missionDoc.data();
        final missionId = missionDoc.id;

        final mission = Mission.fromMap(missionData, id: missionId);

        final userMissionData = userMissionMap[missionId];

        final enrichedMission = mission.copyWith(
          currentProgress: userMissionData?['progress'] as int? ?? 0,
          isEarned: userMissionData?['earned_date'] != null,
          earnedDate: userMissionData?['earned_date'] != null
              ? (userMissionData!['earned_date'] as Timestamp).toDate()
              : null,
        );
        missions.add(enrichedMission);
      }
      return missions;
    } catch (e) {
      // TODO: change string (LoadingException)
      if (context.mounted) {
        throw LoadingException(
          AppLocalizations.of(context)!.firestoreUtilsSearchMushroomTitle,
          AppLocalizations.of(context)!.firestoreUtilsSearchMushroomError,
        );
      }
      return [];
    }
  }
  static Future<String?> getRarityForMushroom(BuildContext context, String mushroomId) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection("challenge_mushroom")
          .where("mushroom_id", isEqualTo: mushroomId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first.data()["rarity"] as String?;
      }
      return null;
    } catch (e) {
      // TODO: change string (LoadingException)
      debugPrint('Error fetching rarity for mushroom: $e');
      return null;
    }
  }

  static Future<List<Recipe>> fetchRecipes(BuildContext context) async {
    try {
      final recipeSnapshot = await FirebaseFirestore.instance.collection("recipe").get();
      final recipes = recipeSnapshot.docs
          .map((doc) => Recipe.fromMap(doc.data() as Map<String, Object?>))
          .toList();
      return recipes;
    } catch (e) {
      if (context.mounted) {
        // TODO: change string (LoadingException)
        throw LoadingException(
          AppLocalizations.of(context)!.firestoreUtilsSearchMushroomTitle,
          AppLocalizations.of(context)!.firestoreUtilsSearchMushroomError,
        );
      }
      return [];
    }
  }

  static Future<List<Article>> fetchArticles(BuildContext context) async {
    try {
      final recipeSnapshot = await FirebaseFirestore.instance.collection("article").get();
      final articles = recipeSnapshot.docs
          .map((doc) => Article.fromMap(doc.data() as Map<String, Object?>))
          .toList();
      return articles;
    } catch (e) {
      if (context.mounted) {
        // TODO: change string (LoadingException)
        throw LoadingException(
          AppLocalizations.of(context)!.firestoreUtilsSearchMushroomTitle,
          AppLocalizations.of(context)!.firestoreUtilsSearchMushroomError,
        );
      }
      return [];
    }
  }

  static Future<List<Mushroom>> fetchMonthMushrooms(BuildContext context) async {
    try {
      final monthMushroomSnapshot = await FirebaseFirestore.instance.collection("month_mushroom").get();

      final List<Mushroom> monthMushrooms = [];

      for (var doc in monthMushroomSnapshot.docs) {
        final data = doc.data();
        final mushroomId = data['mushroom_id'] as String;

        final mushroomSnapshot = await FirebaseFirestore.instance.collection("mushroom").doc(mushroomId).get();

        if (mushroomSnapshot.exists) {
          final mushroom = Mushroom.fromMap(mushroomSnapshot.data() as Map<String, Object?>, id: mushroomSnapshot.id);
          monthMushrooms.add(mushroom);
        }
      }

      return monthMushrooms;
    } catch (e) {
      if (context.mounted) {
        // TODO: change string (LoadingException)
        throw LoadingException(
          AppLocalizations.of(context)!.firestoreUtilsSearchMushroomTitle,
          AppLocalizations.of(context)!.firestoreUtilsSearchMushroomError,
        );
      }
      return [];
    }
  }


}