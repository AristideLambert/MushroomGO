import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/color_constant.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/navigation_constant.dart';
import 'package:mushroom_go/models/mushroom.dart';
import 'package:mushroom_go/theme/search_result_theme.dart';

class SearchResultPage extends StatefulWidget {
  final SearchResultTheme? theme;
  const SearchResultPage({super.key, this.theme});

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  late SearchResultTheme theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = (widget.theme ?? Theme.of(context).extension<SearchResultTheme>())!;
  }

  final List<Mushroom> mushrooms = [
    Mushroom(
      name: "Jelly baby",
      scientificName: "Leotia lubrica",
      description: "A small, bright yellow mushroom found in woods and grasslands.",
      imageUrl: "https://media.istockphoto.com/id/1442686543/fr/photo/closup-de-deux-champignons-jelly-ear.jpg?s=612x612&w=0&k=20&c=1PznxDXWfSH0m_iT8XScYnDjHqLgJfifzKKsrx45l6E=",
    ),
    Mushroom(
      name: "Jelly drops",
      scientificName: "Ascocoryne sarcoides",
      description: "Pink or purple jelly-like fungus growing on dead wood.",
      imageUrl: "https://media.istockphoto.com/id/1442686543/fr/photo/closup-de-deux-champignons-jelly-ear.jpg?s=612x612&w=0&k=20&c=1PznxDXWfSH0m_iT8XScYnDjHqLgJfifzKKsrx45l6E=",
    ),
    Mushroom(
      name: "Jelly ear",
      scientificName: "Auricularia delicata",
      description: "Ear-shaped brown fungus found on decaying wood.",
      imageUrl: "https://media.istockphoto.com/id/1442686543/fr/photo/closup-de-deux-champignons-jelly-ear.jpg?s=612x612&w=0&k=20&c=1PznxDXWfSH0m_iT8XScYnDjHqLgJfifzKKsrx45l6E=",
    ),
    Mushroom(
      name: "Jelly ear (Jew's ear)",
      scientificName: "Auricularia auricula-judae",
      description: "A gelatinous brown fungus often found on elder trees.",
      imageUrl: "https://media.istockphoto.com/id/1442686543/fr/photo/closup-de-deux-champignons-jelly-ear.jpg?s=612x612&w=0&k=20&c=1PznxDXWfSH0m_iT8XScYnDjHqLgJfifzKKsrx45l6E=",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
        child: ListView.builder(
          itemCount: mushrooms.length,
          itemBuilder: (BuildContext context, int index) {
            final mushroom = mushrooms[index];
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  NavigationConstant.mushroomDetailPage,
                  arguments: mushroom,
                );
              },
              child: Container(
                padding:EdgeInsets.symmetric(vertical: theme.defaultPadding),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(theme.radiusItem),
                      child: Image.network(
                        mushroom.imageUrl,
                        width: theme.imageWidthHeight,
                        height: theme.imageWidthHeight,
                        fit: BoxFit.cover,
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
                    const Icon(Icons.chevron_right, color: ColorConstant.primaryColor),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
