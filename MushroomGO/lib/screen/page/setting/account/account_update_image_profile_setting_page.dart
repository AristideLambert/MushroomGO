import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/screen/widget/button/standard/button_standard.dart';
import 'package:mushroom_go/screen/widget/container/profile/image/profile_image_selection.dart';
import 'package:mushroom_go/screen/widget/container/profile/image/profile_image_selection_container.dart';
import 'package:mushroom_go/utils/firebase/firebase_auth_utils.dart';
import 'package:mushroom_go/utils/setting/setting_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountUpdateImageProfileSettingPage extends StatefulWidget {
  const AccountUpdateImageProfileSettingPage({super.key});

  @override
  State<AccountUpdateImageProfileSettingPage> createState() => _AccountUpdateImageProfileSettingPageState();
}

class _AccountUpdateImageProfileSettingPageState extends State<AccountUpdateImageProfileSettingPage> {
  late String _pathImageProfile;
  late String _pathSelectedImage;
  late bool _isValid;

  @override
  void initState() {
    super.initState();
    _pathImageProfile = FirebaseAuth.instance.currentUser?.photoURL ?? "assets/images/profile/default.jpg";
    _pathSelectedImage = _pathImageProfile;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _isValid = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.accountUpdateImageProfileSettingTitle)
      ),
      body: Container(
        padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
        child: Container(
          padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
          decoration: BoxDecoration(
            color: Theme.of(context).appBarTheme.backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(DimensionConstant.radiusAccountSetting))
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: DimensionConstant.sizeImageAccountUpdateImageProfile,
                backgroundImage: AssetImage(_pathSelectedImage),
              ),
              const SizedBox(height: DimensionConstant.spaceAccountSetting,),
              ProfileImageSelectionContainer(
                profileImageSelections: const [
                  ProfileImageSelection(path: "assets/images/profile/default.jpg", selected: false, width: 100),
                  ProfileImageSelection(path: "assets/images/profile/profile1.jpg", selected: false, width: 100),
                  ProfileImageSelection(path: "assets/images/profile/profile2.jpg", selected: false, width: 100),
                ],
                onChange: (newPath){
                  setState(() {
                    _pathSelectedImage = newPath;
                    _isValid = _pathImageProfile != _pathSelectedImage;
                  });
                },
                selectedIndex: SettingUtils.getIndexImageProfile(_pathSelectedImage),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
        child: ButtonStandard(
          title: AppLocalizations.of(context)!.accountUpdateImageProfileSettingButton,
          enabled: _isValid,
          onTap: () async {
            await FirebaseAuthUtils.updateImageProfileAccount(context, _pathSelectedImage);
            _pathImageProfile = _pathSelectedImage;
          }
        ),
      )
    );
  }
}