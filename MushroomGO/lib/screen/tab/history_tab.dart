import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/color_constant.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/models/mushroom_scan.dart';
import 'package:mushroom_go/theme/history_tab_theme.dart';

class HistoryTab extends StatefulWidget {
  final HistoryTabTheme? theme;
  const HistoryTab({super.key, this.theme});

  @override
  State<HistoryTab> createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {
  late HistoryTabTheme theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = (widget.theme ?? Theme.of(context).extension<HistoryTabTheme>())!;
  }

  final List<MushroomScan> scans = [
    MushroomScan(
      imageUrl: "assets/images/mushroom_test.png",
      name: "Amanita phalloides",
      dateTime: DateTime(2024, 10, 23, 9, 10),
      location: "Forêt des Ardennes",
      distance: 25.0,
    ),
    MushroomScan(
      imageUrl: "assets/images/mushroom_test.png",
      name: "Boletus edulis",
      dateTime: DateTime(2024, 10, 22, 9, 20),
      location: "Bois de Compiègne",
      distance: 25.0,
    ),
    MushroomScan(
      imageUrl: "assets/images/mushroom_test.png",
      name: "Cantharellus cibarius",
      dateTime: DateTime(2024, 10, 21, 9, 50),
      location: "Jura",
      distance: 13.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
      itemCount: scans.length,
      itemBuilder: (context, index) {
        final scan = scans[index];
        return GestureDetector(
          onTap: () {
            // TODO: Naviguer vers la page de détail pour ce scan
          },
          child: Card(
            color: theme.cardBackgroundColor,
            margin: EdgeInsets.symmetric(vertical: theme.defaultPaddingMargin),
            child: Padding(
              padding: EdgeInsets.all(theme.defaultPaddingMargin),
              child: Row(
                children: [
                  // Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(theme.itemRadius),
                    child: Image.asset(
                      scan.imageUrl,
                      width: theme.imageWidthHeight,
                      height: theme.imageWidthHeight,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: theme.spaceBetweenImageText),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          scan.name,
                          style: theme.titleStyle,
                        ),
                        SizedBox(height: theme.spaceBetweenText),
                        Text(
                          "${scan.dateTime.day}/${scan.dateTime.month}/${scan.dateTime.year} "
                              "${scan.dateTime.hour}:${scan.dateTime.minute.toString().padLeft(2, '0')}",
                          style: theme.textDateStyle
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Icon(Icons.location_pin, color: ColorConstant.primaryColor),
                      SizedBox(height: theme.spaceBetweenText),
                      Text(
                        "${scan.distance.toStringAsFixed(0)} KM",
                        style: theme.textStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
