import 'package:flutter/material.dart';
import 'package:mushroom_go/theme/home_for_you_list_theme.dart';

class HomeForYouList<T> extends StatefulWidget {
  const HomeForYouList({
    super.key,
    required this.items,
    required this.title,
    required this.itemBuilder,
    this.theme,
  });

  final List<T> items;
  final String title;
  final Widget Function(BuildContext, T, int, HomeForYouListTheme) itemBuilder;
  final HomeForYouListTheme? theme;

  @override
  State<HomeForYouList<T>> createState() => _HomeForYouListState<T>();
}

class _HomeForYouListState<T> extends State<HomeForYouList<T>> {
  late HomeForYouListTheme theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = widget.theme ?? Theme.of(context).extension<HomeForYouListTheme>()!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: theme.identTitle),
          child: Text(widget.title, style: theme.titleStyle),
        ),
        SizedBox(height: theme.space),
        SizedBox(
          height: theme.heightTitleItem + theme.sizeImageItem,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.items.length,
            padding: EdgeInsets.zero,
            clipBehavior: Clip.none,
            itemBuilder: (context, index) {
              return widget.itemBuilder(context, widget.items[index], index, theme);
            },
          ),
        ),
      ],
    );
  }
}
