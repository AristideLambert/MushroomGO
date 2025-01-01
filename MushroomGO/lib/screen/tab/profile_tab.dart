import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/navigation_constant.dart';
import 'package:mushroom_go/utils/dialog/dialog_utils.dart';

class ProfileTab extends StatefulWidget {
  final BuildContext mainContext;

  const ProfileTab({super.key, required this.mainContext});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.of(widget.mainContext).pushNamed(
              NavigationConstant.settingPage
            );
          },
          child: Text("Settings")
        ),
      ),
    );
  }
}
