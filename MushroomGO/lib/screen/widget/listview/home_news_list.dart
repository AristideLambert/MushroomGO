import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/models/article.dart';
import 'package:mushroom_go/screen/widget/listview/home_news_list_item.dart';
import 'package:mushroom_go/theme/home_news_list_theme.dart';

class HomeNewsList extends StatefulWidget {
  const HomeNewsList({super.key, required this.articles, this.theme});
  final List<Article> articles;
  final HomeNewsListTheme? theme;

  @override
  State<HomeNewsList> createState() => _HomeNewsListState();
}

class _HomeNewsListState extends State<HomeNewsList> {
  late HomeNewsListTheme theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = (widget.theme ?? Theme.of(context).extension<HomeNewsListTheme>())!;
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
                title: article.title,
                imageUrl: article.imageUrl,
                theme: theme,
              );
            },
          ),
        ],
      ),
    );
  }
}
