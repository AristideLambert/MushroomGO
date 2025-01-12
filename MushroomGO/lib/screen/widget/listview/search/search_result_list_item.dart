import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/navigation_constant.dart';
import 'package:mushroom_go/models/mushroom.dart';
import 'package:mushroom_go/screen/widget/image/loading_image.dart';
import 'package:mushroom_go/theme/search_result_list_theme.dart';
import 'package:mushroom_go/utils/search/history/search_history_utils.dart';

class SearchResultListItem extends StatelessWidget {
  final int index;
  final Mushroom mushroom;
  final SearchResultListTheme theme;

  const SearchResultListItem({super.key, required this.index, required this.mushroom, required this.theme});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        SearchHistoryUtils.addToHistory(mushroom.name);
        Navigator.pushNamed(
          context,
          NavigationConstant.mushroomDetailPage,
          arguments: mushroom,
        );
      },
      child: Container(
        padding:EdgeInsets.only(
            top: index == 0 ? 0 : theme.defaultPadding,
            bottom: theme.defaultPadding),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(theme.radiusItem),
              child: Image.network(
                mushroom.imageUrl,
                width: theme.imageWidthHeight,
                height: theme.imageWidthHeight,
                fit: BoxFit.cover,
                loadingBuilder: ((context, image, event){
                  if (event == null) {
                    return image;
                  }
                  return LoadingImage(size: theme.imageWidthHeight);
                }),
                errorBuilder: (context, error, stackTrace) {
                  return LoadingImage(size: theme.imageWidthHeight);
                },
              ),
            ),
            SizedBox(width: theme.spaceBetweenItem),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mushroom.name,
                    style:theme.titleStyle,
                  ),
                  SizedBox(height: theme.heightBetweenNameScientificName),
                  Text(
                    mushroom.scientificName,
                    style: theme.scientificNameStyle,
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: theme.rightIconColor),
          ],
        ),
      ),
    );
  }
}
