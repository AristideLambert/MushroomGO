import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/screen/widget/button/standard/button_standard.dart';
import 'package:mushroom_go/screen/widget/container/profile/image/profile_image_selection.dart';
import 'package:mushroom_go/screen/widget/container/profile/image/profile_image_selection_container.dart';

class AccountUpdateImageProfileSettingPage extends StatefulWidget {
  const AccountUpdateImageProfileSettingPage({super.key});

  @override
  State<AccountUpdateImageProfileSettingPage> createState() => _AccountUpdateImageProfileSettingPageState();
}

class _AccountUpdateImageProfileSettingPageState extends State<AccountUpdateImageProfileSettingPage> {
  late String _pathSelectedImage;

  @override
  void initState() {
    super.initState();
    _pathSelectedImage = "assets/images/profile/default.jpg";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Update image")
      ),
      body: Container(
        padding: EdgeInsets.all(DimensionConstant.defaultPadding),
        child: Container(
          padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
          decoration: BoxDecoration(
              color: Theme.of(context).appBarTheme.backgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(DimensionConstant.radiusBorderInputTextInput))
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage(_pathSelectedImage),
              ),
              SizedBox(height: DimensionConstant.defaultPadding,),
              ProfileImageSelectionContainer(profileImageSelections: const [
                ProfileImageSelection(path: "assets/images/profile/default.jpg", selected: false, width: 100),
                ProfileImageSelection(path: "assets/images/profile/profile1.jpg", selected: false, width: 100),
                ProfileImageSelection(path: "assets/images/profile/profile2.jpg", selected: false, width: 100)
              ],
              onChange: (newPath){
                setState(() {
                  _pathSelectedImage = newPath;
                });
              },)
            ],
          ),
        ),
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
          child: ButtonStandard(title: "Choose image", onTap: () async {

          }),
        )
    );
  }
}
