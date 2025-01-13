import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/models/mission.dart';
import 'package:mushroom_go/theme/profile_badge_grid_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BadgeDetailPage extends StatefulWidget {
  final Mission mission;
  final ProfileBadgeGridTheme? theme;

  const BadgeDetailPage({super.key, required this.mission, this.theme});

  @override
  State<BadgeDetailPage> createState() => _BadgeDetailPageState();
}

class _BadgeDetailPageState extends State<BadgeDetailPage> {
  late ProfileBadgeGridTheme theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = widget.theme ?? Theme.of(context).extension<ProfileBadgeGridTheme>()!;
  }
  @override
  Widget build(BuildContext context) {
    final appBarHeight = AppBar().preferredSize.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mission.title),
      ),
      body: SafeArea(
        child: Transform.translate(
          offset: Offset(0, -appBarHeight),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/${widget.mission.badgeFile}",
                    fit: BoxFit.contain,
                    height: theme.heightImageDetail,
                  ),
                  SizedBox(height: theme.spaceBetweenText),
                  Text(
                    widget.mission.title,
                    style: theme.titleStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: theme.spaceBetweenText),
                  Text(
                    widget.mission.description,
                    style: theme.descriptionStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: theme.spaceBetweenText),
                  Text(
                    "${AppLocalizations.of(context)!.earnedBadge} ${widget.mission.earnedDate!.day}/${widget.mission.earnedDate!.month}/${widget.mission.earnedDate!.year} "
                  "${widget.mission.earnedDate!.hour}:${widget.mission.earnedDate!.minute.toString().padLeft(2, '0')}.",
                    style: theme.textDateStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}