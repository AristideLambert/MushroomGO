import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mushroom_go/utils/firebase/firestore_utils.dart';

class MissionUtils {
  static Future<void> checkMission(String scientificName, BuildContext context) async {
    try {
      final missions = await FirestoreUtils.fetchMissionsWithUserProgress(context);
      if(!context.mounted) return;
      final mushroom = await FirestoreUtils.getMushroomNameScientific(context, scientificName);

      if (mushroom == null || mushroom.id == null) {
        return;
      }
      final userId = FirebaseAuth.instance.currentUser!.uid;

      for (final mission in missions) {
        if (mission.isEarned ?? false) continue;

        bool matchesCondition = false;

        if (mission.type == 'rarity') {
          if(!context.mounted) return;
          final rarity = await FirestoreUtils.getRarityForMushroom(context, mushroom.id!);
          if (rarity == mission.condition) {
            matchesCondition = true;
          }
        } else if (mission.type == 'family' && mushroom.family == mission.condition) {
          matchesCondition = true;
        }

        if (matchesCondition) {
          final newProgress = (mission.currentProgress ?? 0) + 1;

          final missionUserData = {
            'user_id': userId,
            'mission_id': mission.id,
            'progress': newProgress,
          };

          if (newProgress >= mission.goal) {
            missionUserData['earned_date'] = Timestamp.now();
          }

          await FirebaseFirestore.instance
              .collection('mission_user')
              .doc('${userId}_${mission.id}')
              .set(missionUserData, SetOptions(merge: true));
        }
      }
    } catch (e) {
      debugPrint('Error in checkMission: $e');
      rethrow;
    }
  }
}


