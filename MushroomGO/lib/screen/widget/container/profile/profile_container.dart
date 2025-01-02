import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/navigation_constant.dart';
import 'package:mushroom_go/screen/widget/button/standard/button_standard.dart';
import 'package:mushroom_go/theme/profile_container_theme.dart';
import 'package:mushroom_go/utils/font/mushroom_go_font_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileContainer extends StatefulWidget {
  final ImageProvider<Object>? image;
  final String name;
  final String mail;
  final Function()? onTap;
  final ProfileContainerTheme? theme;

  const ProfileContainer({super.key, required this.image, required this.name, required this.mail, this.onTap, this.theme});

  @override
  State<ProfileContainer> createState() => _ProfileContainerState();
}

class _ProfileContainerState extends State<ProfileContainer> {
  late ProfileContainerTheme theme;
  late double _materialHeight = 0;
  final GlobalKey _materialKey = GlobalKey();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = widget.theme ?? Theme.of(context).extension<ProfileContainerTheme>()!;
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderBox = _materialKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null && mounted) {
        setState(() {
          _materialHeight = renderBox.size.height;
        });
      }
    });
    return Stack(
      children: [
        Material(
          key: _materialKey,
          borderRadius: BorderRadius.all(Radius.circular(theme.radius)),
          color: theme.backgroundColor,
          child: InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(theme.radius))
            ),
            splashColor: Colors.transparent,
            onTap: widget.onTap,
            child: Container(
              padding: EdgeInsets.all(theme.padding),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: theme.radiusCircleAvatar,
                    backgroundImage: widget.image,
                  ),
                  SizedBox(width: theme.space,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: theme.nameStyle
                        ),
                        Text(
                          widget.mail,
                          style: theme.mailStyle
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    MushroomGOFontUtils.chevronRight,
                    color: theme.chevronColor,
                    size: theme.sizeChevron,
                  ),
                ],
              )
            ),
          ),
        ),
        if(FirebaseAuth.instance.currentUser == null)
          Stack(
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(theme.radius),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: theme.blur, sigmaY: theme.blur),
                    child: Container(
                      height: _materialHeight,
                      decoration: BoxDecoration(
                        color: theme.backgroundColor.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(theme.radius),
                      ),
                      alignment: Alignment.center,
                      child: ButtonStandard(title: AppLocalizations.of(context)!.settingProfileLogin, icon: MushroomGOFontUtils.profile, widthContent: true, onTap: (){
                        Navigator.of(context).pushNamed(NavigationConstant.loginPage);
                      })
                    ),
                  ),
                ),
              ),
            ],
          ),
      ]
    );
  }
}