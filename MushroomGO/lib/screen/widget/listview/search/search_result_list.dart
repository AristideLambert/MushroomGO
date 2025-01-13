import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/models/mushroom.dart';
import 'package:mushroom_go/screen/widget/image/loading_image.dart';
import 'package:mushroom_go/screen/widget/listview/search/search_result_list_item.dart';
import 'package:mushroom_go/theme/search_result_list_theme.dart';

class SearchResultList extends StatefulWidget {
  final List<Mushroom> mushrooms;
  final bool loadIcon;
  final SearchResultListTheme? theme;

  const SearchResultList({super.key, required this.mushrooms, required this.loadIcon, this.theme});

  @override
  State<SearchResultList> createState() => _SearchResultListState();
}

class _SearchResultListState extends State<SearchResultList> {
  late SearchResultListTheme _theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _theme = widget.theme ?? Theme.of(context).extension<SearchResultListTheme>()!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: DimensionConstant.defaultPadding),
      child: ListView.builder(
        itemCount: widget.mushrooms.length + (widget.loadIcon ? 1 : 0),
        itemBuilder: (BuildContext context, int index) {
          return index < widget.mushrooms.length ?
            SearchResultListItem(
              index: index,
              indexEnd: widget.mushrooms.length - 1,
              mushroom: widget.mushrooms[index],
              theme: _theme
            ) : Center(child: LoadingImage(size: _theme.sizeLoadingImage));
        },
      ),
    );
  }
}
