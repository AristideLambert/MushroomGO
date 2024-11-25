import 'package:flutter/material.dart';
import 'package:mushroom_go/theme/profile_container_theme.dart';
import 'package:mushroom_go/utils/font/mushroom_go_font_utils.dart';

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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = widget.theme ?? Theme.of(context).extension<ProfileContainerTheme>()!;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(theme.radius),
        topRight: Radius.circular(theme.radius),
        bottomLeft: Radius.circular(theme.radius),
        bottomRight: Radius.circular(theme.radius),
      ),
      color: theme.backgroundColor,
      child: InkWell(
        customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(theme.radius),
              topRight: Radius.circular(theme.radius),
              bottomLeft: Radius.circular(theme.radius),
              bottomRight: Radius.circular(theme.radius),
            )
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
    );
  }
}