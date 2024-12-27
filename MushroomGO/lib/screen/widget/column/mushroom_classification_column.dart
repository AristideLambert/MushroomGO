import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/color_constant.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/theme/mushroom_detail_theme.dart';

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
      margin: EdgeInsets.symmetric(vertical: theme.detailMargin),
      padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
      decoration: BoxDecoration(
        color: theme.backgroundColor,
        borderRadius: BorderRadius.circular(theme.radiusItem),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(theme.boxShadowOpacity),
            blurRadius: theme.boxShadowBlurRadius,
            spreadRadius: theme.boxShadowSpreadRadius,
            offset: Offset(theme.boxShadowMinOffset, theme.boxShadowMaxOffset),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.science,
                color: ColorConstant.primaryColor,
                size: theme.sizeIcon,
              ),
              const SizedBox(width: 8),
              Text(
                "Scientific Classification",
                style: theme.titleStyle,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Table(
            columnWidths: const {
              0: IntrinsicColumnWidth(),
              1: FlexColumnWidth(),
            },
            border: const TableBorder(
              horizontalInside: BorderSide(
                color: ColorConstant.primaryColor,
                width: 1,
              ),
            ),
            children: widget.classification.entries.map((entry) {
              return TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      "${entry.key}:",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      entry.value,
                      style: Theme.of(context).textTheme.bodyLarge,
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
