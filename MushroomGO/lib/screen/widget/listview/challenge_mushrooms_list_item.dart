import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mushroom_go/theme/challenge_mushrooms_list_theme.dart';

class ChallengeMushroomsListItem extends StatefulWidget {
  final int index;
  final bool isUnlocked;
  final ChallengeMushroomsListTheme? theme;

  const ChallengeMushroomsListItem({
    super.key,
    required this.index,
    required this.isUnlocked,
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
      padding: widget.index == 0 ? EdgeInsets.zero : EdgeInsets.only(left: theme.paddingBetweenItem),
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
                  image: const DecorationImage(
                    image: NetworkImage('https://www.shutterstock.com/image-photo/boletus-mushrooms-growing-green-moss-600nw-2488892297.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(theme.radiusItem),
                    topRight: Radius.circular(theme.radiusItem),
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
                    'Champignon ${widget.index + 1}',
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
