import 'package:mushroom_go/models/mushroom.dart';

class ModelsUtils{
  ModelsUtils._();

  // Mushroom
  static List<Mushroom> removeDuplicate(List<Mushroom> mushrooms) {
    final seenNames = <String>{};
    return mushrooms.where((mushroom) {
      final isNew = !seenNames.contains(mushroom.name);
      if (isNew) {
        seenNames.add(mushroom.name);
      }
      return isNew;
    }).toList();
  }
}