import 'package:mushroom_go/utils/text/string_utils.dart';
import 'recipe.dart';

enum Rarity {rare, common, epic}

class Mushroom {
  final String? id;
  final String name;
  final String scientificName;
  final String description;
  final String imageUrl;
  final String location;
  final String family;
  final String? order;
  final String? classification;
  final String? phylum;
  final String? culinaryInformation;
  final String? edible;
  final Rarity? rarity;
  final List<Recipe>? recipes;

  Mushroom({
    this.id,
    required this.name,
    required this.scientificName,
    required this.description,
    required this.imageUrl,
    required this.location,
    required this.family,
    this.order,
    this.classification,
    this.phylum,
    this.culinaryInformation,
    this.edible,
    this.rarity,
    this.recipes,
  });

  factory Mushroom.fromMap(Map<String, Object?> data, {String? id, Rarity? rarity}) {
    return Mushroom(
        id: id,
        name: StringUtils.capitalizeEachWord(data['name'].toString()),
        scientificName: StringUtils.capitalizeEachWord(data['name_scientific'].toString()),
        description: data['description'].toString(),
        imageUrl: data['image_url'].toString(),
        location: data['location'].toString(),
        family: data['family'].toString(),
        order: data['order'].toString(),
        classification: data['class'].toString(),
        phylum: data['phylum'].toString(),
        culinaryInformation: data['culinary_information'].toString(),
        edible: data['edible'].toString(),
        rarity: rarity
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'name_scientific': scientificName,
      'description': description,
      'image_url': imageUrl,
      'location': location,
      'family': family,
      'order': order,
      'class': classification,
      'phylum': phylum,
      'culinary_information': culinaryInformation,
      'edible': edible
    };
  }
}