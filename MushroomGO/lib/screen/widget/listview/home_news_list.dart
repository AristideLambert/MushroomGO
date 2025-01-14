import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/models/article.dart';
import 'package:mushroom_go/screen/widget/listview/home_news_list_item.dart';
import 'package:mushroom_go/theme/home_news_list_theme.dart';

class HomeNewsList extends StatefulWidget {
  final List<Article> articles;
  final HomeNewsListTheme? theme;
  final BuildContext mainContext;

  const HomeNewsList({super.key, required this.articles, this.theme, required this.mainContext});

  @override
  State<HomeNewsList> createState() => _HomeNewsListState();
}

class _HomeNewsListState extends State<HomeNewsList> {
  late HomeNewsListTheme _theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _theme = (widget.theme ?? Theme.of(context).extension<HomeNewsListTheme>())!;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
            itemCount: widget.articles.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final article = widget.articles[index];
              return HomeNewsListItem(
                index: index,
                title: article.title,
                imageUrl: article.imageUrl,
                url: article.url,
                theme: _theme,
                mainContext: widget.mainContext,
              );
            },
          ),
        ],
      ),
    );
  }
}
