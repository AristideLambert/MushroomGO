import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/navigation_constant.dart';
import 'package:mushroom_go/models/mushroom.dart';
import 'package:mushroom_go/models/recipe.dart';
import 'package:mushroom_go/screen/widget/image/loading_image.dart';
import 'package:mushroom_go/theme/home_for_you_list_theme.dart';

class HomeForYouItem<T> extends StatefulWidget {
  const HomeForYouItem({
    super.key,
    required this.buildContext,
    required this.item,
    required this.index,
    required this.getTitle,
    required this.getImageUrl,
    this.theme
  });

  final BuildContext buildContext;
  final T item;
  final int index;
  final String Function(T) getTitle;
  final String Function(T) getImageUrl;
  final HomeForYouListTheme? theme;

  @override
  State<HomeForYouItem<T>> createState() => _HomeForYouItemState<T>();
}

class _HomeForYouItemState<T> extends State<HomeForYouItem<T>> {
  late HomeForYouListTheme theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = (widget.theme ?? Theme.of(context).extension<HomeForYouListTheme>())!;
  }

  @override
  void didUpdateWidget(HomeForYouItem<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    theme = (widget.theme ?? Theme.of(context).extension<HomeForYouListTheme>())!;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.item is Mushroom) {
          Navigator.pushNamed(
            widget.buildContext,
            NavigationConstant.mushroomDetailPage,
            arguments: widget.item as Mushroom,
          );
        }
        else{
          if (widget.item is Recipe) {
            final recipe = widget.item as Recipe;
            Navigator.pushNamed(
              widget.buildContext,
              NavigationConstant.webViewPage,
              arguments: {
                'url': recipe.url,
                'title': widget.getTitle(widget.item),
              },
            );
          }
        }
      },
      child: Container(
        padding: widget.index == 0 ? EdgeInsets.zero : EdgeInsets.only(left: theme.paddingBetweenItem),
        width: theme.widthItem,
        height: theme.sizeImageItem,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(theme.radiusItem),
        ),
        child: Stack(
          children: [
            Container(
              width: theme.widthItem,
              height: theme.sizeImageItem,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(theme.radiusItem),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(theme.radiusItem),
                child: Image.network(
                  widget.getImageUrl(widget.item),
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
              width: theme.widthItem,
              height: theme.sizeImageItem + 0.5,
              alignment: Alignment.bottomLeft,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(theme.radiusItem),
                    bottomRight: Radius.circular(theme.radiusItem),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: theme.textOpacity),
                    ],
                  ),
                ),
                width: theme.widthItem,
                padding: EdgeInsets.all(theme.textPadding),
                child: Text(
                  widget.getTitle(widget.item),
                  style: theme.itemStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}