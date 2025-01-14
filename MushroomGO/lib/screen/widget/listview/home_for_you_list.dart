import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/theme/home_for_you_list_theme.dart';

class HomeForYouList<T> extends StatefulWidget {
  final List<T> items;
  final String title;
  final Widget Function(BuildContext, T, int, HomeForYouListTheme) itemBuilder;
  final HomeForYouListTheme? theme;

  const HomeForYouList({
    super.key,
    required this.items,
    required this.title,
    required this.itemBuilder,
    this.theme,
  });

  @override
  State<HomeForYouList<T>> createState() => _HomeForYouListState<T>();
}

class _HomeForYouListState<T> extends State<HomeForYouList<T>> {
  late HomeForYouListTheme _theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _theme = widget.theme ?? Theme.of(context).extension<HomeForYouListTheme>()!;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: DimensionConstant.defaultPadding,
        left: DimensionConstant.defaultPadding,
        right: DimensionConstant.defaultPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: _theme.identTitle),
            child: Text(widget.title, style: _theme.titleStyle),
          ),
          SizedBox(height: _theme.space),
          SizedBox(
            height: _theme.sizeImageItem,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.items.length,
              padding: EdgeInsets.zero,
              clipBehavior: Clip.none,
              itemBuilder: (context, index) {
                return widget.itemBuilder(context, widget.items[index], index, _theme);
              },
            ),
          ),
        ],
      ),
    );
  }
}
