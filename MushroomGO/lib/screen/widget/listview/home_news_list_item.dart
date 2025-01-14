import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/navigation_constant.dart';
import 'package:mushroom_go/screen/widget/image/loading_image.dart';
import 'package:mushroom_go/theme/home_news_list_theme.dart';

class HomeNewsListItem extends StatefulWidget {
  final int index;
  final String title;
  final String imageUrl;
  final String url;
  final HomeNewsListTheme? theme;
  final BuildContext mainContext;

  const HomeNewsListItem({
    super.key,
    required this.index,
    required this.title,
    required this.imageUrl,
    required this.url,
    this.theme,
    required this.mainContext,
  });

  @override
  State<HomeNewsListItem> createState() => _HomeNewsListItemState();
}

class _HomeNewsListItemState extends State<HomeNewsListItem> {
  late HomeNewsListTheme _theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _theme = (widget.theme ?? Theme.of(context).extension<HomeNewsListTheme>())!;
  }

  @override
  void didUpdateWidget(HomeNewsListItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    _theme = (widget.theme ?? Theme.of(context).extension<HomeNewsListTheme>())!;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          widget.mainContext,
          NavigationConstant.webViewPage,
          arguments: {
            'url': widget.url,
            'title': widget.title,
          },
        );
      },
      child: Card(
        margin: EdgeInsets.only(
          top: widget.index == 0 ? 0 : _theme.cardMargin,
          bottom: _theme.cardMargin,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_theme.radiusItem),
        ),
        color: _theme.cardBackgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(_theme.radiusItem)),
              child: Image.network(
                widget.imageUrl,
                height: _theme.imageHeight,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return SizedBox(height: _theme.imageHeight, width: double.infinity, child: Center(child: LoadingImage(size: _theme.loadingImage)));
                },
                errorBuilder: (context, error, stackTrace) {
                  return SizedBox(height: _theme.imageHeight, width: double.infinity, child: Center(child: LoadingImage(size: _theme.loadingImage)));
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(_theme.cardPadding),
              child: Text(
                widget.title,
                style: _theme.titleStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
