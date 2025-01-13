import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/screen/widget/image/loading_image.dart';
import 'package:mushroom_go/theme/mushroom_detail_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MushroomImageDetailColumn extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String scientificName;
  final MushroomDetailTheme? theme;

  const MushroomImageDetailColumn({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.scientificName,
    this.theme,
  });

  @override
  State<MushroomImageDetailColumn> createState() =>
      _MushroomImageDetailColumnState();
}

class _MushroomImageDetailColumnState extends State<MushroomImageDetailColumn> {
  late MushroomDetailTheme theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = (widget.theme ?? Theme.of(context).extension<MushroomDetailTheme>())!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: DimensionConstant.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(theme.radiusItem),
            child: Image.network(
              widget.imageUrl,
              fit: BoxFit.cover,
              height: theme.imageHeight,
              width: double.infinity,
              loadingBuilder: ((context, image, event){
                if (event == null) {
                  return image;
                }
                return Container(
                  height: theme.imageHeight,
                  width: double.infinity,
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  child: Center(
                    child: LoadingImage(size: theme.sizeLoadImage),
                  ),
                );
              }),
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: theme.imageHeight,
                  width: double.infinity,
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  child: Center(
                    child: LoadingImage(size: theme.sizeLoadImage),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: DimensionConstant.defaultPadding),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
            decoration: BoxDecoration(
              color: Theme.of(context).appBarTheme.backgroundColor,
              borderRadius: BorderRadius.circular(theme.radiusItem)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: theme.nameStyle,
                ),
                SizedBox(height: theme.heightBetweenNameScientificName),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "${AppLocalizations.of(context)!.scientificName}:",
                      style: theme.scientificNameText
                    ),
                    SizedBox(width: theme.widthBetweenNameScientificName),
                    Text(
                      widget.scientificName,
                      style: theme.scientificName
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
