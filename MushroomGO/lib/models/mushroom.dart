class Mushroom {
  final String name;
  final String scientificName;
  final String description;
  final String imageUrl;
  final String? habitat;
  final String? family;
  final String? order;
  final String? classification;
  final String? phylum;

  Mushroom({
    required this.name,
    required this.scientificName,
    required this.description,
    required this.imageUrl,
    this.habitat,
    this.family,
    this.order,
    this.classification,
    this.phylum,
  });
}
