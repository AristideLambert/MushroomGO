import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/models/mission.dart';
import 'package:mushroom_go/theme/badge_tab_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BadgeDetailPage extends StatefulWidget {
  final Mission mission;
  final BadgeTabTheme? theme;

  const BadgeDetailPage({super.key, required this.mission, this.theme});

  @override
  State<BadgeDetailPage> createState() => _BadgeDetailPageState();
}

class _BadgeDetailPageState extends State<BadgeDetailPage> {
  late BadgeTabTheme theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = widget.theme ?? Theme.of(context).extension<BadgeTabTheme>()!;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mission.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                widget.mission.badge,
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
                  "${AppLocalizations.of(context)!.earnedBadge} ${DateFormat('dd MMM yyyy').format(widget.mission.earnedDate!)}.",
                  style: theme.textDateStyle,
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
      ),
    );
  }
}