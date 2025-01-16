import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/theme/mushroom_detail_theme.dart';
import 'package:mushroom_go/utils/font/mushroom_go_font_utils.dart';

enum SectionType {description, culinaryInfo, habitat, warning, other}

class MushroomDetailColumn extends StatefulWidget {
  final SectionType sectionType;
  final String title;
  final String content;
  final MushroomDetailTheme? theme;

  const MushroomDetailColumn({
    super.key,
    required this.sectionType,
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

  Icon _getIcon(SectionType sectionType) {
    switch (sectionType) {
      case SectionType.description:
        return Icon(MushroomGOFontUtils.document, color: Theme.of(context).primaryColor, size: theme.sizeIcon);
      case SectionType.culinaryInfo:
        return Icon(MushroomGOFontUtils.food, color: Theme.of(context).primaryColor, size: theme.sizeIcon);
      case SectionType.habitat:
        return Icon(MushroomGOFontUtils.tree, color: Theme.of(context).primaryColor, size: theme.sizeIcon);
      case SectionType.warning:
        return Icon(MushroomGOFontUtils.warning, color: Theme.of(context).primaryColor, size: theme.sizeIcon);
      default:
        return Icon(MushroomGOFontUtils.info, color: Theme.of(context).primaryColor, size: theme.sizeIcon);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: DimensionConstant.defaultPadding),
      padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
        borderRadius: BorderRadius.circular(theme.radiusItem),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getIcon(widget.sectionType),
          SizedBox(width: theme.spaceBetweenText),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: theme.titleStyle,
                ),
                SizedBox(height: theme.spaceBetweenText),
                Text(
                  widget.content,
                  style: theme.textStyle,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}