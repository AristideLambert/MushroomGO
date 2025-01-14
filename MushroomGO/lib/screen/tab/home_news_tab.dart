import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/models/article.dart';
import 'package:mushroom_go/screen/widget/listview/home_news_list.dart';
import 'package:mushroom_go/screen/widget/popup/loading_container.dart';
import 'package:mushroom_go/screen/widget/popup/loading_error_container.dart';
import 'package:mushroom_go/utils/firebase/firestore_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeNewsTab extends StatefulWidget {
  final BuildContext mainContext;
  const HomeNewsTab({super.key, required this.mainContext});

  @override
  State<HomeNewsTab> createState() => _HomeNewsTabState();
}

class _HomeNewsTabState extends State<HomeNewsTab> {
  late Future<List<Article>> _articlesFuture;

  Future<void> _reloadData() async {
    setState(() {
      _articlesFuture = FirestoreUtils.fetchArticles(context);
    });
  }

  @override
  void initState() {
    super.initState();
    _reloadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Article>>(
        future: _articlesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingContainer(
              message: AppLocalizations.of(context)!.homeNewsLoadingData,
            );
          } else if (snapshot.hasError) {
            return LoadingErrorContainer(
              message: AppLocalizations.of(context)!.homeNewsErrorLoadingData,
              onReload: _reloadData,
            );
          }
          final articles = snapshot.data ?? [];
          return RefreshIndicator(
            color: Theme.of(context).primaryColor,
            elevation: DimensionConstant.defaultElevation,
            onRefresh: _reloadData,
            child: SizedBox(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    HomeNewsList(
                      articles: articles,
                      mainContext: widget.mainContext,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
