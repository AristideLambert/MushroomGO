import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/models/mushroom.dart';
import 'package:mushroom_go/models/mushroom_scan.dart';
import 'package:mushroom_go/models/recipe.dart';
import 'package:mushroom_go/screen/widget/column/mushroom_classification_column.dart';
import 'package:mushroom_go/screen/widget/column/mushroom_detail_column.dart';
import 'package:mushroom_go/screen/widget/column/mushroom_image_detail_column.dart';
import 'package:mushroom_go/screen/widget/column/mushroom_scan_column.dart';
import 'package:mushroom_go/screen/widget/listview/home_for_you_item.dart';
import 'package:mushroom_go/screen/widget/listview/home_for_you_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MushroomDetailContentPage extends StatefulWidget {
  final Mushroom mushroom;
  final MushroomScan? mushroomScan;
  final Future<void> Function() onRefresh;

  const MushroomDetailContentPage({super.key, required this.mushroom, required this.onRefresh, this.mushroomScan});

  @override
  State<MushroomDetailContentPage> createState() => _MushroomDetailContentPageState();
}

class _MushroomDetailContentPageState extends State<MushroomDetailContentPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Theme.of(context).primaryColor,
      elevation: DimensionConstant.defaultElevation,
      onRefresh: widget.onRefresh,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: DimensionConstant.defaultPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MushroomImageDetailColumn(
                imageUrl: widget.mushroom.imageUrl,
                name: widget.mushroom.name,
                scientificName: widget.mushroom.scientificName,
              ),
              MushroomDetailColumn(
                sectionType: SectionType.description,
                title: AppLocalizations.of(context)!.mushroomDescription,
                content: widget.mushroom.description,
              ),
              MushroomDetailColumn(
                sectionType: SectionType.habitat,
                title: AppLocalizations.of(context)!.mushroomHabitat,
                content: widget.mushroom.location,
              ),
              MushroomClassificationColumn(
                classification: {
                  AppLocalizations.of(context)!.mushroomFamily: widget.mushroom.family,
                  AppLocalizations.of(context)!.mushroomOrder: widget.mushroom.order ?? AppLocalizations.of(context)!.notSpecified,
                  AppLocalizations.of(context)!.mushroomClass: widget.mushroom.classification ?? AppLocalizations.of(context)!.notSpecified,
                  AppLocalizations.of(context)!.mushroomPhylum: widget.mushroom.phylum ?? AppLocalizations.of(context)!.notSpecified,
                },
              ),
              MushroomDetailColumn(
                sectionType: SectionType.culinaryInfo,
                title: AppLocalizations.of(context)!.culinaryInformation,
                content: widget.mushroom.culinaryInformation ?? AppLocalizations.of(context)!.notSpecified,
              ),
              if(widget.mushroom.edible == "Edible") ... [
                MushroomDetailColumn(
                  sectionType: SectionType.warning,
                  title: AppLocalizations.of(context)!.warningInformationTitle,
                  content: AppLocalizations.of(context)!.warningInformationDescription,
                ),
              ],
              const SizedBox(height: DimensionConstant.defaultPadding),
              if(widget.mushroomScan != null) ... [
                MushroomScanColumn(mushroomScan: widget.mushroomScan!),
                const SizedBox(height: DimensionConstant.defaultPadding),
              ],
              if (widget.mushroom.recipes != null && widget.mushroom.recipes!.isNotEmpty) ... [
                HomeForYouList<Recipe>(
                  title: AppLocalizations.of(context)!.recipes,
                  items: widget.mushroom.recipes!,
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
              ]
            ],
          ),
        ),
      ),
    );
  }
}
