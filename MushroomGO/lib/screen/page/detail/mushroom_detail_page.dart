import 'package:flutter/material.dart';
import 'package:mushroom_go/models/mushroom.dart';
import 'package:mushroom_go/screen/widget/column/mushroom_image_detail_column.dart';
import 'package:mushroom_go/screen/widget/column/mushroom_detail_column.dart';
import 'package:mushroom_go/screen/widget/column/mushroom_classification_column.dart';

class MushroomDetailPage extends StatefulWidget {
  final Mushroom mushroom;

  const MushroomDetailPage({super.key, required this.mushroom});

  @override
  State<MushroomDetailPage> createState() => _MushroomDetailPageState();
}

class _MushroomDetailPageState extends State<MushroomDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mushroom.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MushroomImageDetailColumn(
                imageUrl: widget.mushroom.imageUrl,
                name: widget.mushroom.name,
                scientificName: widget.mushroom.scientificName,
              ),
              MushroomDetailColumn(
                title: "Description",
                content: widget.mushroom.description,
              ),
              MushroomDetailColumn(
                title: "Habitat",
                content: widget.mushroom.habitat ?? "Non spécifié",
              ),
              MushroomClassificationColumn(
                classification: {
                  "Family": widget.mushroom.family ?? "Non spécifié",
                  "Order": widget.mushroom.order ?? "Non spécifié",
                  "Class": widget.mushroom.classification ?? "Non spécifié",
                  "Phylum": widget.mushroom.phylum ?? "Non spécifié",
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
