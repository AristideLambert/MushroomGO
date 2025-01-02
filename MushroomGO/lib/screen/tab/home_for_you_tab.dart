import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/models/mushroom.dart';
import 'package:mushroom_go/models/recipe.dart';
import 'package:mushroom_go/screen/widget/listview/home_for_you_item.dart';
import 'package:mushroom_go/screen/widget/listview/home_for_you_list.dart';

class HomeForYouTab extends StatefulWidget {
  final BuildContext buildContext;
  const HomeForYouTab({super.key, required this.buildContext });

  @override
  State<HomeForYouTab> createState() => _HomeForYouTabState();
}

class _HomeForYouTabState extends State<HomeForYouTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              HomeForYouList<Recipe>(
                title: "Recettes",
                items: [
                  Recipe(
                    title: "Sautéed Mushroom Recipe",
                    imageUrl:
                    "https://weekendatthecottage.com/wp-content/uploads/2024/05/SauteedMushroomRecipe6.jpeg",
                    url: "https://www.allrecipes.com/recipe/222795/superb-sauteed-mushrooms/"
                  ),
                  Recipe(
                    title: "Mushroom Hunting Tips",
                    imageUrl:
                    "https://realfood.tesco.com/media/images/Mushroom-Stewl-6fda57ea-e430-4a58-a92b-08639bda60b3-0-1400x919.jpg",
                    url: "https://www.allrecipes.com/recipe/222795/superb-sauteed-mushrooms/"
                  ),
                  Recipe(
                    title: "Mushroom Stew",
                    imageUrl:
                    "https://holycowvegan.net/wp-content/uploads/2017/10/mushroom-stew-recipe-1.jpg",
                    url: "https://www.allrecipes.com/recipe/222795/superb-sauteed-mushrooms/"
                  ),
                ],
                itemBuilder: (context, Recipe recipe, index, theme) {
                  return HomeForYouItem<Recipe>(
                    item: recipe,
                    buildContext: widget.buildContext,
                    index: index,
                    getTitle: (Recipe item) => item.title,
                    getImageUrl: (Recipe item) => item.imageUrl,
                  );
                },
              ),
              HomeForYouList<Mushroom>(
                title: "Champignons de décembre",
                items: [
                  Mushroom(
                    name: "Shiitake",
                    description: "A popular edible mushroom.",
                    scientificName: "Lentinula edodes",
                    imageUrl: "https://freestylefarm.ca/wp-content/uploads/2012/03/Mushroomshitake-1674.jpg",
                    culinaryInfo: "Comestible et savoureux, utilisé dans la cuisine asiatique.",
                    recipes: [
                      Recipe(
                        title: "Shiitake Stir Fry",
                        imageUrl: "https://weekendatthecottage.com/wp-content/uploads/2024/05/SauteedMushroomRecipe6.jpeg",
                        url: "https://www.allrecipes.com/recipe/222795/superb-sauteed-mushrooms/",
                      ),
                      Recipe(
                        title: "Shiitake Soup",
                        imageUrl: "https://holycowvegan.net/wp-content/uploads/2017/10/mushroom-stew-recipe-1.jpg",
                        url: "https://www.allrecipes.com/recipe/222795/superb-sauteed-mushrooms/",
                      ),
                    ],
                  ),
                  Mushroom(
                    name: "Oyster Mushroom",
                    description: "An easy-to-cultivate mushroom.",
                    scientificName: "Pleurotus ostreatus",
                    imageUrl:
                    "https://images.squarespace-cdn.com/content/v1/5e4ecb5e9b47827d217b203c/bedb7bbe-24d8-4148-9f6f-81f77037b41d/mycoremediation+of+mushrooms.jpg",
                    culinaryInfo: "Toxique mortel, à éviter absolument."
                  ),
                  Mushroom(
                    name: "Porcini",
                    description: "Known for its earthy and nutty flavor.",
                    scientificName: "Boletus edulis",
                    imageUrl:
                    "https://www.thespruceeats.com/thmb/Oe-EfLAp_AkCYN7ZSwq25n800i8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-475150545-1a11dccd4c804c859d1f1a2d3f525070.jpg",
                    culinaryInfo: "Toxique, contient des substances dangereuses pour le système nerveux."
                  ),
                  Mushroom(
                    name: "Morel",
                    description: "A prized mushroom with a honeycomb appearance.",
                    scientificName: "Morchella esculenta",
                    imageUrl:
                    "https://media.istockphoto.com/id/505505411/photo/common-morel-fungus.jpg?s=612x612&w=0&k=20&c=tgu9fIMGu5J7fRO5Wh4kryJHZqOc_EXKeVF0Jz9Zuxo=",
                    culinaryInfo: "Comestible et apprécié pour son goût unique."
                  ),
                ],
                itemBuilder: (context, Mushroom mushroom, index, theme) {
                  return HomeForYouItem<Mushroom>(
                    item: mushroom,
                    buildContext: widget.buildContext,
                    index: index,
                    getTitle: (Mushroom item) => item.name,
                    getImageUrl: (Mushroom item) => item.imageUrl,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}