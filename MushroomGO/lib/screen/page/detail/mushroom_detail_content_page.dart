import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/enum/section_type.dart';
import 'package:mushroom_go/models/mushroom.dart';
import 'package:mushroom_go/models/recipe.dart';
import 'package:mushroom_go/screen/widget/column/mushroom_classification_column.dart';
import 'package:mushroom_go/screen/widget/column/mushroom_detail_column.dart';
import 'package:mushroom_go/screen/widget/column/mushroom_image_detail_column.dart';
import 'package:mushroom_go/screen/widget/listview/home_for_you_item.dart';
import 'package:mushroom_go/screen/widget/listview/home_for_you_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MushroomDetailContentPage extends StatelessWidget {
  final Mushroom mushroom;
  final Future<void> Function() onRefresh;

  const MushroomDetailContentPage({super.key, required this.mushroom, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Theme.of(context).primaryColor,
      elevation: 0.0,
      onRefresh: onRefresh,
      child: Padding(
          padding: const EdgeInsets.only(
            left: DimensionConstant.defaultPadding,
            right: DimensionConstant.defaultPadding,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MushroomImageDetailColumn(
                  imageUrl: mushroom.imageUrl,
                  name: mushroom.name,
                  scientificName: mushroom.scientificName,
                ),
                MushroomDetailColumn(
                  sectionType: SectionType.description,
                  title: AppLocalizations.of(context)!.mushroomDescription,
                  content: mushroom.description,
                ),
                MushroomDetailColumn(
                  sectionType: SectionType.habitat,
                  title: AppLocalizations.of(context)!.mushroomHabitat,
                  content: mushroom.location ?? AppLocalizations.of(context)!.notSpecified,
                ),
                MushroomClassificationColumn(
                  classification: {
                    AppLocalizations.of(context)!.mushroomFamily: mushroom.family,
                    AppLocalizations.of(context)!.mushroomOrder: mushroom.order ?? AppLocalizations.of(context)!.notSpecified,
                    AppLocalizations.of(context)!.mushroomClass: mushroom.classification ?? AppLocalizations.of(context)!.notSpecified,
                    AppLocalizations.of(context)!.mushroomPhylum: mushroom.phylum ?? AppLocalizations.of(context)!.notSpecified,
                  },
                ),
                MushroomDetailColumn(
                  sectionType: SectionType.culinaryInfo,
                  title: AppLocalizations.of(context)!.culinaryInformation,
                  content: mushroom.culinaryInformation ?? AppLocalizations.of(context)!.notSpecified,
                ),
                const SizedBox(height: DimensionConstant.defaultPadding),
                if (mushroom.recipes != null && mushroom.recipes!.isNotEmpty)
                  HomeForYouList<Recipe>(
                    title: AppLocalizations.of(context)!.recipes,
                    items: mushroom.recipes!,
                    itemBuilder: (context, Recipe recipe, index, theme) {
                      return HomeForYouItem<Recipe>(
                        item: recipe,
                        buildContext: context,
                        index: index,
                        getTitle: (Recipe item) => item.title,
                        getImageUrl: (Recipe item) => item.imageUrl,
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
    );
  }
}
