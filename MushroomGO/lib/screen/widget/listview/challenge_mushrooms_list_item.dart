import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mushroom_go/models/mushroom.dart';
import 'package:mushroom_go/screen/widget/image/loading_image.dart';
import 'package:mushroom_go/theme/challenge_mushrooms_list_theme.dart';

class ChallengeMushroomsListItem extends StatefulWidget {
  final int index;
  final bool isUnlocked;
  final Mushroom mushroom;
  final ChallengeMushroomsListTheme? theme;

  const ChallengeMushroomsListItem({
    super.key,
    required this.index,
    required this.isUnlocked,
    required this.mushroom,
    this.theme,
  });

  @override
  State<ChallengeMushroomsListItem> createState() => _ChallengeMushroomsListItemState();
}

class _ChallengeMushroomsListItemState extends State<ChallengeMushroomsListItem> {
  late ChallengeMushroomsListTheme theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = (widget.theme ?? Theme.of(context).extension<ChallengeMushroomsListTheme>())!;
  }
  @override
  void didUpdateWidget(ChallengeMushroomsListItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    theme = (widget.theme ?? Theme.of(context).extension<ChallengeMushroomsListTheme>())!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: theme.paddingBetweenItem),
      width: theme.widthItem,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(theme.radiusItem),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: theme.sizeImageItem,
                height: theme.sizeImageItem,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(theme.radiusItem),
                    topRight: Radius.circular(theme.radiusItem),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(theme.radiusItem),
                    topRight: Radius.circular(theme.radiusItem),
                  ),
                  child: Image.network(
                    widget.mushroom.imageUrl,
                    width: theme.sizeImageItem,
                    height:theme.sizeImageItem,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return LoadingImage(size: theme.sizeImageItem);
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return LoadingImage(size: theme.sizeImageItem);
                    },
                  ),
                ),
              ),
              Container(
                height: theme.heightTitleItem,
                width: theme.widthItem,
                decoration: BoxDecoration(
                  color: theme.backgroundColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(theme.radiusItem),
                    bottomRight: Radius.circular(theme.radiusItem),
                  ),
                ),
                child: Center(
                  child: Text(
                    widget.mushroom.name,
                    textAlign: TextAlign.center,
                    style: theme.titleItemStyle,
                  ),
                ),
              ),
            ],
          ),
          if (!widget.isUnlocked) ...[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(theme.radiusItem),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [
                    Colors.transparent,
                    Colors.grey.withValues(alpha: theme.alphaColor),
                  ],
                ),
              ),
              child: Center(
                child: Icon(
                  CupertinoIcons.lock_fill,
                  color: Theme.of(context).primaryColor,
                  size: theme.lockerSize,
                ),
              ),
            ),
          ]
        ],
      ),
    );
  }
}
