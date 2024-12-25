import 'package:flutter/material.dart';
import 'package:mushroom_go/theme/challenge_missions_list_theme.dart';

class ChallengeMissionItem extends StatefulWidget {
  final String title;
  final String description;
  final int currentProgress;
  final int goal;
  final ChallengeMissionListTheme? theme;

  const ChallengeMissionItem({
    Key? key,
    required this.title,
    required this.description,
    required this.currentProgress,
    required this.goal,
    this.theme,
  }) : super(key: key);

  @override
  State<ChallengeMissionItem> createState() => _ChallengeMissionItemState();
}

class _ChallengeMissionItemState extends State<ChallengeMissionItem> {
  late ChallengeMissionListTheme theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = (widget.theme ?? Theme.of(context).extension<ChallengeMissionListTheme>())!;
  }

  @override
  void didUpdateWidget(ChallengeMissionItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    theme = (widget.theme ?? Theme.of(context).extension<ChallengeMissionListTheme>())!;
  }

  @override
  Widget build(BuildContext context) {
    final double progress = (widget.currentProgress / widget.goal).clamp(theme.progressMin, theme.progressMax);
    return Card(
      margin: EdgeInsets.symmetric(vertical: theme.cardMargin),
      color: theme.cardBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(theme.radiusItem)),
      child: Padding(
        padding: EdgeInsets.all(theme.cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title, style: theme.titleStyle),
            SizedBox(height: theme.spacingBetweenTitleAndList),
            Text(widget.description, style: theme.descriptionStyle),
            SizedBox(height: theme.spacingBetweenTitleAndList),
            LinearProgressIndicator(
              value: progress,
              minHeight: theme.progressBarHeight,
              backgroundColor: theme.progressBarBackgroundColor,
              valueColor: AlwaysStoppedAnimation<Color>(theme.progressBarForegroundColor),
            ),
            SizedBox(height: theme.spacingBetweenTitleAndList),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '${widget.currentProgress} / ${widget.goal}',
                style: theme.progressTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
