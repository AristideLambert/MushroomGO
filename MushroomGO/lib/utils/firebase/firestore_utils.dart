import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mushroom_go/exception/loading_exception.dart';
import 'package:mushroom_go/models/firestore_pagination.dart';
import 'package:mushroom_go/models/mushroom.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  static Future<Mushroom?> getMushroomNameScientific(BuildContext context, String mushroom) async {
    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
                                            .collection("mushroom")
                                            .where("name_scientific", isEqualTo: mushroom.toLowerCase())
                                            .get();
      if (querySnapshot.docs.isNotEmpty) {
        return Mushroom.fromMap(querySnapshot.docs.first.data() as Map<String, Object?>);
      } else {
        return null;
      }
    } catch (e) {
      if(context.mounted){
        throw LoadingException(AppLocalizations.of(context)!.firestoreUtilsSearchMushroomTitle, AppLocalizations.of(context)!.firestoreUtilsSearchMushroomError);
      }
    }
    return null;
  }
}