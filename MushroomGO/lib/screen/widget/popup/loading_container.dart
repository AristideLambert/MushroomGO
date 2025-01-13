import 'package:flutter/material.dart';
import 'package:mushroom_go/screen/widget/image/loading_image.dart';
import 'package:mushroom_go/screen/widget/text/text_output.dart';
import 'package:mushroom_go/theme/loading_container_theme.dart';

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
          color: Theme.of(context).appBarTheme.backgroundColor,
          borderRadius: BorderRadius.circular(theme.radius),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LoadingImage(size: theme.iconSize),
            SizedBox(height: theme.space),
            TextOutput(text: widget.message)
          ],
        ),
      ),
    );
  }
}