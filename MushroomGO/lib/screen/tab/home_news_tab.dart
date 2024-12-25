import 'package:flutter/material.dart';
import 'package:mushroom_go/models/article.dart';
import 'package:mushroom_go/screen/widget/listview/home_news_list.dart';

class HomeNewsTab extends StatefulWidget {
  const HomeNewsTab({super.key});

  @override
  State<HomeNewsTab> createState() => _HomeNewsTabState();
}

class _HomeNewsTabState extends State<HomeNewsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeNewsList(articles: [
              Article(
                title: "Discover the Hidden Forests",
                imageUrl: "https://u4d2z7k9.rocketcdn.me/wp-content/uploads/2022/01/rsz_1rsz_screen_shot_2022-01-21_at_124538_pm.jpg",
              ),
              Article(
                title: "Mushroom Hunting Tips",
                imageUrl: "https://bokashiliving.com/wp-content/uploads/2023/01/pexels-egor-kamelev-757292-1024x676.jpg",
              ),
              Article(
                title: "New Species Found",
                imageUrl: "https://www.incrediblemushrooms.com/images/turkey-mush-800.jpg",
              ),
              Article(
                title: "New Species Found",
                imageUrl: "https://www.incrediblemushrooms.com/images/turkey-mush-800.jpg",
              )
            ],
            )
          ],
        ),
      ),
    );
  }
}
