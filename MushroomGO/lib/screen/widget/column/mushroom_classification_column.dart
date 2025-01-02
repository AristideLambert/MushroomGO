import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/color_constant.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/theme/mushroom_detail_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MushroomClassificationColumn extends StatefulWidget {
  final Map<String, String> classification;
  final MushroomDetailTheme? theme;

  const MushroomClassificationColumn({
    super.key,
    required this.classification, this.theme,
  });

  @override
  State<MushroomClassificationColumn> createState() =>
      _MushroomClassificationColumnState();
}

class _MushroomClassificationColumnState extends State<MushroomClassificationColumn> {
  late MushroomDetailTheme theme;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = (widget.theme ?? Theme.of(context).extension<MushroomDetailTheme>())!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: theme.detailMargin),
      padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
      decoration: BoxDecoration(
        color: theme.backgroundColor,
        borderRadius: BorderRadius.circular(theme.radiusItem)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                CupertinoIcons.lab_flask_solid,
                color: ColorConstant.primaryColor,
                size: theme.sizeIcon,
              ),
              SizedBox(width: theme.spaceBetweenText),
              Text(
                AppLocalizations.of(context)!.scientificClassification,
                style: theme.titleStyle,
              ),
            ],
          ),
          SizedBox(height: theme.spaceBetweenText),
          Table(
            columnWidths: const {
              0: IntrinsicColumnWidth(),
              1: FlexColumnWidth(),
            },
            border: TableBorder(
              horizontalInside: BorderSide(
                color: ColorConstant.primaryColor,
                width: theme.widthTableBorder,
              ),
            ),
            children: widget.classification.entries.map((entry) {
              return TableRow(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: theme.paddingClassification),
                    child: Text(
                      "${entry.key}: ",
                      style: theme.textStyle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: theme.paddingClassification),
                    child: Text(
                      entry.value,
                      style: theme.textStyle,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
