import 'package:flutter/material.dart';
import 'package:mushroom_go/theme/loading_container_theme.dart';
import 'package:mushroom_go/utils/font/mushroom_go_font_utils.dart';

class LoadingContainer extends StatefulWidget {
  final String message;
  final LoadingContainerTheme? theme;

  const LoadingContainer({super.key, required this.message, this.theme});

  @override
  State<LoadingContainer> createState() => _LoadingContainerState();
}

class _LoadingContainerState extends State<LoadingContainer> {
  late LoadingContainerTheme theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = widget.theme ?? Theme.of(context).extension<LoadingContainerTheme>()!;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(theme.padding),
        decoration: BoxDecoration(
          color: theme.backgroundColor,
          borderRadius: BorderRadius.circular(theme.radius),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(MushroomGOFontUtils.logo, color: theme.iconColor, size: theme.iconSize,),
            SizedBox(height: theme.space),
            Text(
              widget.message,
              style: theme.titleStyle
            )
          ],
        ),
      ),
    );
  }
}