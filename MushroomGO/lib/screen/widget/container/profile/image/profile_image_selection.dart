import 'package:flutter/material.dart';

class ProfileImageSelection extends StatelessWidget {
  final String path;
  final double width;
  final bool selected;
  final Function()? onTap;

  const ProfileImageSelection({super.key, required this.path, required this.width, this.selected = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(selected ? 10 : 0),
              child: Image.asset(path, width: width, height: width,)),
        ),
        if(selected) ... [
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: Colors.red),
              borderRadius: BorderRadius.circular(10), // Rayon des coins
            ),
            width: width,
            height: width,
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(5), bottomLeft: Radius.circular(5)), // Rayon des coins
                ),
                width: 35,
                height: 20,
                child: Icon(Icons.check, color: Colors.white, size: 15,),
              ),
            ),
          )
        ]
      ],
    );
  }
}
