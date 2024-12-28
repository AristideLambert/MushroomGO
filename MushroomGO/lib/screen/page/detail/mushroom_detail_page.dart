import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/models/mushroom.dart';
import 'package:mushroom_go/screen/widget/column/mushroom_image_detail_column.dart';
import 'package:mushroom_go/screen/widget/column/mushroom_detail_column.dart';
import 'package:mushroom_go/screen/widget/column/mushroom_classification_column.dart';

class MushroomDetailPage extends StatefulWidget {
  final Mushroom mushroom;

  const MushroomDetailPage({super.key, required this.mushroom});

  @override
  State<MushroomDetailPage> createState() => _MushroomDetailPageState();
}

class _MushroomDetailPageState extends State<MushroomDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mushroom.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
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
                title: AppLocalizations.of(context)!.mushroomDescription,
                content: widget.mushroom.description,
              ),
              MushroomDetailColumn(
                title: AppLocalizations.of(context)!.mushroomHabitat,
                content: widget.mushroom.habitat ?? AppLocalizations.of(context)!.notSpecified,
              ),
              MushroomClassificationColumn(
                classification: {
                  AppLocalizations.of(context)!.mushroomFamily: widget.mushroom.family ?? AppLocalizations.of(context)!.notSpecified,
                  AppLocalizations.of(context)!.mushroomOrder: widget.mushroom.order ?? AppLocalizations.of(context)!.notSpecified,
                  AppLocalizations.of(context)!.mushroomClass: widget.mushroom.classification ?? AppLocalizations.of(context)!.notSpecified,
                  AppLocalizations.of(context)!.mushroomPhylum: widget.mushroom.phylum ?? AppLocalizations.of(context)!.notSpecified,
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
