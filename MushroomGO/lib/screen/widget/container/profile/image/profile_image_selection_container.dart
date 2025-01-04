import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'profile_image_selection.dart';

class ProfileImageSelectionContainer extends StatefulWidget {
  final List<ProfileImageSelection> profileImageSelections;
  final int selectedIndex;
  final Function(String) onChange;

  const ProfileImageSelectionContainer({super.key, required this.profileImageSelections, this.selectedIndex = 0, required this.onChange});

  @override
  State<ProfileImageSelectionContainer> createState() => _ProfileImageSelectionContainerState();
}

class _ProfileImageSelectionContainerState extends State<ProfileImageSelectionContainer> {
  late double _imageSize;
  late int _selectedIndex;

  List<Widget> _rebuild(List<ProfileImageSelection> profileImages){
    List<Widget> widgets = [];
    for(int i = 0; i < profileImages.length; i++){
      widgets.add(
        ProfileImageSelection(
          path: profileImages[i].path,
          selected: i == _selectedIndex,
          width: _imageSize,
          onTap: (){
            setState(() {
              _selectedIndex = i;
              widget.onChange(profileImages[i].path)?.call();
            });
          },
        )
      );
      if(i != profileImages.length - 1){
        widgets.add(const SizedBox(width: DimensionConstant.defaultPadding,));
      }
    }
    return widgets;
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _imageSize = (MediaQuery.of(context).size.width - (DimensionConstant.defaultPadding * (4 + widget.profileImageSelections.length - 1))) /  widget.profileImageSelections.length;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _rebuild(widget.profileImageSelections)
    );
  }
}
