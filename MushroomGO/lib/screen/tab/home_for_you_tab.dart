import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/models/mushroom.dart';
import 'package:mushroom_go/models/recipe.dart';
import 'package:mushroom_go/screen/widget/listview/home_for_you_item.dart';
import 'package:mushroom_go/screen/widget/listview/home_for_you_list.dart';
import 'package:mushroom_go/screen/widget/popup/loading_container.dart';
import 'package:mushroom_go/screen/widget/popup/loading_error_container.dart';
import 'package:mushroom_go/utils/firebase/firestore_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeForYouTab extends StatefulWidget {
  final BuildContext mainContext;

  const HomeForYouTab({super.key, required this.mainContext});

  @override
  State<HomeForYouTab> createState() => _HomeForYouTabState();
}

class _HomeForYouTabState extends State<HomeForYouTab> {
  late Future<Map<String, dynamic>> _dataFuture;

  @override
  void initState() {
    super.initState();
    _reloadData();
  }

  Future<void> _reloadData() async {
    setState(() {
      _dataFuture = Future.wait([
        FirestoreUtils.fetchRecipes(context),
        FirestoreUtils.fetchMonthMushrooms(context),
      ]).then((values) =>
      {
        "recipes": values[0],
        "mushrooms": values[1],
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>>(
        future: _dataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingContainer(
              message: AppLocalizations.of(context)!.homeForYouLoadingData,
            );
          } else if (snapshot.hasError) {
            return LoadingErrorContainer(
              message: AppLocalizations.of(context)!.homeForYouErrorLoadingData,
              onReload: _reloadData,
            );
          }
          final recipes = snapshot.data!["recipes"] as List<Recipe>;
          final mushrooms = snapshot.data!["mushrooms"] as List<Mushroom>;
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
                    HomeForYouList<Recipe>(
                      title: AppLocalizations.of(context)!.homeForYouRecipes,
                      items: recipes,
                      itemBuilder: (context, Recipe recipe, index, theme) {
                        return HomeForYouItem<Recipe>(
                          item: recipe,
                          buildContext: widget.mainContext,
                          index: index,
                          getTitle: (Recipe item) => item.title,
                          getImageUrl: (Recipe item) => item.imageUrl,
                        );
                      },
                    ),
                    HomeForYouList<Mushroom>(
                      title: AppLocalizations.of(context)!.homeForYouMonthMushrooms,
                      items: mushrooms,
                      itemBuilder: (context, Mushroom mushroom, index, theme) {
                        return HomeForYouItem<Mushroom>(
                          item: mushroom,
                          buildContext: widget.mainContext,
                          index: index,
                          getTitle: (Mushroom item) => item.name,
                          getImageUrl: (Mushroom item) => item.imageUrl,
                        );
                      },
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