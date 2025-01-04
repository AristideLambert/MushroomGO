import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/color_constant.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';

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
            borderRadius: BorderRadius.circular(selected ? DimensionConstant.radiusProfileImageSelection : 0),
            child: Image.asset(path, width: width, height: width,)
          ),
        ),
        if(selected) ... [
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: DimensionConstant.borderProfileImageSelection, color: ColorConstant.selectionProfileImageSelection),
              borderRadius: BorderRadius.circular(DimensionConstant.radiusProfileImageSelection),
            ),
            width: width,
            height: width,
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                decoration: const BoxDecoration(
                  color: ColorConstant.selectionProfileImageSelection,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(DimensionConstant.radiusProfileImageSelection / 2),
                    bottomLeft: Radius.circular(DimensionConstant.radiusProfileImageSelection / 2)
                  ), // Rayon des coins
                ),
                width: DimensionConstant.selectionWidthProfileImageSelection,
                height: DimensionConstant.selectionHeightProfileImageSelection,
                // TODO: Update icon
                child: const Icon(Icons.check, color: ColorConstant.textPrimaryColor, size: DimensionConstant.iconSizeProfileImageSelection,),
              ),
            ),
          )
        ]
      ],
    );
  }
}
