import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/models/mushroom.dart';
import 'package:mushroom_go/screen/widget/listview/challenge/mushroom/challenge_mushrooms_list_item.dart';
import 'package:mushroom_go/theme/challenge_mushrooms_list_theme.dart';

class ChallengeMushroomsListTab extends StatefulWidget {
  final String category;
  final List<Mushroom> mushrooms;
  final int index;
  final int indexEnd;
  final BuildContext mainContext;
  final ChallengeMushroomsListTheme? theme;

  const ChallengeMushroomsListTab({
    super.key,
    required this.category,
    required this.mushrooms,
    required this.index,
    required this.indexEnd,
    required this.mainContext,
    this.theme,
  });

  @override
  State<ChallengeMushroomsListTab> createState() => _ChallengeMushroomsListTabState();
}

class _ChallengeMushroomsListTabState extends State<ChallengeMushroomsListTab> {
  late ChallengeMushroomsListTheme _theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _theme = (widget.theme ?? Theme.of(context).extension<ChallengeMushroomsListTheme>())!;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: DimensionConstant.defaultPadding,
        right: DimensionConstant.defaultPadding,
        top: widget.index == 0 ? DimensionConstant.defaultPadding : 0.0,
        bottom: widget.index >= widget.indexEnd ? DimensionConstant.defaultPadding : 0.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: _theme.identTitle),
            child: Text(
              widget.category,
              style: _theme.titleStyle,
            ),
          ),
          SizedBox(height: _theme.space),
          SizedBox(
            height: _theme.heightTitleItem + _theme.sizeImageItem,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.mushrooms.length,
              padding: EdgeInsets.zero,
              clipBehavior: Clip.none,
              itemBuilder: (context, index) {
                final mushroom = widget.mushrooms[index];
                final isUnlocked = mushroom.isUnlock;
                return SizedBox(
                  width: _theme.widthItem,
                  child: ChallengeMushroomsListItem(
                    mainContext: widget.mainContext,
                    index: index,
                    isUnlocked: isUnlocked??false,
                    theme: _theme,
                    mushroom: mushroom,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

