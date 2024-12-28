import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/navigation_constant.dart';
import 'package:mushroom_go/theme/home_news_list_theme.dart';

class HomeNewsListItem extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String url;
  final HomeNewsListTheme? theme;
  final BuildContext buildContext;

  const HomeNewsListItem({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.url,
    this.theme,
    required this.buildContext,
  });

  @override
  State<HomeNewsListItem> createState() => _HomeNewsListItemState();
}

class _HomeNewsListItemState extends State<HomeNewsListItem> {
  late HomeNewsListTheme theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = (widget.theme ?? Theme.of(context).extension<HomeNewsListTheme>())!;
  }
  @override
  void didUpdateWidget(HomeNewsListItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    theme = (widget.theme ?? Theme.of(context).extension<HomeNewsListTheme>())!;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          widget.buildContext,
          NavigationConstant.webViewPage,
          arguments: {
            'url': widget.url,
            'title': widget.title,
          },
        );
      },

      child: Card(
        margin: EdgeInsets.symmetric(vertical: theme.cardMargin),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(theme.radiusItem),
        ),
        color: theme.cardBackgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(theme.radiusItem)),
              child: Image.network(
                widget.imageUrl,
                height: theme.imageHeight,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(theme.cardPadding),
              child: Text(
                widget.title,
                style: theme.titleStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}