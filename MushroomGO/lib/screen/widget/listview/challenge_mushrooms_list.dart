import 'package:flutter/material.dart';
import 'package:mushroom_go/models/mushroom.dart';
import 'package:mushroom_go/screen/widget/listview/challenge_mushrooms_list_item.dart';
import 'package:mushroom_go/theme/challenge_mushrooms_list_theme.dart';

class ChallengeMushroomsListTab extends StatelessWidget {
  final String category;
  final List<Mushroom> mushrooms;
  final ChallengeMushroomsListTheme? theme;

  const ChallengeMushroomsListTab({
    super.key,
    required this.category,
    required this.mushrooms,
    this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final theme = this.theme ?? Theme.of(context).extension<ChallengeMushroomsListTheme>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: theme.identTitle),
          child: Text(
            category,
            style: theme.titleStyle,
          ),
        ),
        SizedBox(height: theme.space),
        SizedBox(
          height: theme.heightTitleItem + theme.sizeImageItem,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: mushrooms.length,
            padding: EdgeInsets.zero,
            clipBehavior: Clip.none,
            itemBuilder: (context, index) {
              final mushroom = mushrooms[index];
              final isUnlocked = mushroom.isUnlock;
              return SizedBox(
                width: theme.widthItem,
                child: ChallengeMushroomsListItem(
                  index: index,
                  isUnlocked: isUnlocked??false,
                  theme: theme,
                  mushroom: mushroom,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

