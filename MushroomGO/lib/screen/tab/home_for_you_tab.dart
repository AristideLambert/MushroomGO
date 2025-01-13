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
  final BuildContext buildContext;

  const HomeForYouTab({super.key, required this.buildContext});

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

  void _reloadData() {
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
    final appBarHeight = Scaffold
        .of(context)
        .appBarMaxHeight ?? kToolbarHeight;

    return Padding(
      padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
      child: FutureBuilder<Map<String, dynamic>>(
        future: _dataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Transform.translate(
              offset: Offset(0, -appBarHeight),
              child: LoadingContainer(
                message: AppLocalizations.of(context)!
                    .homeForYouLoadingData,
              ),
            );
          } else if (snapshot.hasError) {
            return LoadingErrorContainer(
              message: AppLocalizations.of(context)!
                  .homeForYouErrorLoadingData,
              onReload: _reloadData,
            );
          }

          final recipes = snapshot.data!["recipes"] as List<Recipe>;
          final mushrooms = snapshot.data!["mushrooms"] as List<Mushroom>;

          return SingleChildScrollView(
            child: Column(
              children: [
                HomeForYouList<Recipe>(
                  title: AppLocalizations.of(context)!
                      .homeForYouRecipes,
                  items: recipes,
                  itemBuilder: (context, Recipe recipe, index, theme) {
                    return HomeForYouItem<Recipe>(
                      item: recipe,
                      buildContext: widget.buildContext,
                      index: index,
                      getTitle: (Recipe item) => item.title,
                      getImageUrl: (Recipe item) => item.imageUrl,
                    );
                  },
                ),
                HomeForYouList<Mushroom>(
                  title: AppLocalizations.of(context)!
                      .homeForYouMonthMushrooms,
                  items: mushrooms,
                  itemBuilder: (context, Mushroom mushroom, index, theme) {
                    return HomeForYouItem<Mushroom>(
                      item: mushroom,
                      buildContext: widget.buildContext,
                      index: index,
                      getTitle: (Mushroom item) => item.name,
                      getImageUrl: (Mushroom item) => item.imageUrl,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
