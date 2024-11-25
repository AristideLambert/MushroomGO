import 'package:flutter/material.dart';
import 'package:mushroom_go/screen/widget/listview/challenge_mushrooms_list_item.dart';
import 'package:mushroom_go/theme/challenge_mushrooms_list_theme.dart';

class ChallengeMushroomsListTab extends StatefulWidget {

  final String category;
  final int itemCount;
  final ChallengeMushroomsListTheme? theme;

  const ChallengeMushroomsListTab({super.key, required this.category, required this.itemCount, this.theme});

  @override
  State<ChallengeMushroomsListTab> createState() => _ChallengeMushroomsListTabState();
}

class _ChallengeMushroomsListTabState extends State<ChallengeMushroomsListTab> {
  late ChallengeMushroomsListTheme theme;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = (widget.theme ?? Theme.of(context).extension<ChallengeMushroomsListTheme>())!;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: theme.identTitle),
          child: Text(
            widget.category,
            style: theme.titleStyle
          ),
        ),
        SizedBox(height: theme.space),
        SizedBox(
          height: theme.heightTitleItem + theme.sizeImageItem,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.itemCount,
            padding: EdgeInsets.zero,
            clipBehavior: Clip.none,
            itemBuilder: (context, index) {
              return ChallengeMushroomsListItem(index: index, theme: theme);
            },
          ),
        ),
      ],
    );
  }
}
