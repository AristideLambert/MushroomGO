import 'package:mushroom_go/utils/text/string_utils.dart';

import 'recipe.dart';

class Mushroom {
  final String name;
  final String scientificName;
  final String description;
  final String imageUrl;
  final String location;
  final String family;
  final String? habitat;
  final String? order;
  final String? classification;
  final String? phylum;
  final String? culinaryInformation;
  final String? edible;
  final List<Recipe>? recipes;

  Mushroom({
    required this.name,
    required this.scientificName,
    required this.description,
    required this.imageUrl,
    required this.location,
    required this.family,
    this.habitat,
    this.order,
    this.classification,
    this.phylum,
    this.culinaryInformation,
    this.edible,
    this.recipes,
  });

  factory Mushroom.fromMap(Map<String, Object?> data) {
    return Mushroom(
      name: StringUtils.capitalizeEachWord(data['name'].toString() ?? 'Name'),
      scientificName: StringUtils.capitalizeEachWord(data['name_scientific'].toString() ?? 'Scientific name'),
      description: data['description'].toString() ?? 'Description',
      imageUrl: data['image_url'].toString() ?? 'Image url',
      location: data['location'].toString() ?? 'Location',
      family: data['family'].toString() ?? 'Family',
      order: data['order'].toString() ?? 'Order',
      classification: data['class'].toString() ?? 'Classification',
      phylum: data['phylum'].toString() ?? 'Phylum',
      culinaryInformation: data['culinary_information'].toString()?? 'Culinary information',
      edible: data['edible'].toString() ?? 'Edible'
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
