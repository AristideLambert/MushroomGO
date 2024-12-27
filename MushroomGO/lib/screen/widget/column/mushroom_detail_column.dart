import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/color_constant.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/theme/mushroom_detail_theme.dart';

class MushroomDetailColumn extends StatefulWidget {
  final String title;
  final String content;
  final MushroomDetailTheme? theme;

  const MushroomDetailColumn({
    super.key,
    required this.title,
    required this.content,
    this.theme,
  });

  @override
  State<MushroomDetailColumn> createState() => _MushroomDetailColumnState();
}

class _MushroomDetailColumnState extends State<MushroomDetailColumn> {
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            widget.title == "Description" ? Icons.description : Icons.nature,
            color: ColorConstant.primaryColor,
            size: theme.sizeIcon,
          ),
          SizedBox(width: theme.spaceBetweenText),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: theme.titleStyle,
              ),
              SizedBox(height: theme.spaceBetweenText),
              Text(
                widget.content,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
