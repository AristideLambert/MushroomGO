import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/models/article.dart';
import 'package:mushroom_go/screen/widget/listview/home_news_list.dart';
import 'package:mushroom_go/screen/widget/popup/loading_container.dart';
import 'package:mushroom_go/screen/widget/popup/loading_error_container.dart';
import 'package:mushroom_go/utils/firebase/firestore_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeNewsTab extends StatefulWidget {
  final BuildContext buildContext;
  const HomeNewsTab({super.key, required this.buildContext});

  @override
  State<HomeNewsTab> createState() => _HomeNewsTabState();
}

class _HomeNewsTabState extends State<HomeNewsTab> {
  late Future<List<Article>> _articlesFuture;

  @override
  void initState() {
    super.initState();
    _reloadData();
  }

  void _reloadData() {
    setState(() {
      _articlesFuture = FirestoreUtils.fetchArticles(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBarHeight = Scaffold.of(context).appBarMaxHeight ?? kToolbarHeight;

    return Padding(
      padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
      child: FutureBuilder<List<Article>>(
        future: _articlesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Transform.translate(
              offset: Offset(0, -appBarHeight),
              child: LoadingContainer(
                message: AppLocalizations.of(context)!
                    .homeNewsLoadingData,
              ),
            );
          } else if (snapshot.hasError) {
            return LoadingErrorContainer(
              message: AppLocalizations.of(context)!
                  .homeNewsErrorLoadingData,
              onReload: _reloadData,
            );
          }
          final articles = snapshot.data ?? [];
          return SingleChildScrollView(
            child: Column(
              children: [
                HomeNewsList(
                  articles: articles,
                  buildContext: widget.buildContext,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
