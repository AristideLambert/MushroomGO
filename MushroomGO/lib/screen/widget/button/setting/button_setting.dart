import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mushroom_go/theme/button_setting_theme.dart';
import 'package:mushroom_go/utils/font/mushroom_go_font_utils.dart';

enum Type { standard, information, toogle, selected, button }

class ButtonSetting extends StatefulWidget {
  final Type type;
  final IconData? leftIcon;
  final String title;
  final String? data;
  final bool help;
  final bool radiusTop;
  final bool radiusBottom;
  final bool centerTitle;
  final bool initSwitch;
  final bool initSelected;
  final bool isDestructive;
  final Function()? onTap;
  final bool Function(bool)? onChanged;
  final ButtonSettingTheme? theme;

  const ButtonSetting(
      {super.key,
        required this.type,
        this.leftIcon,
        required this.title,
        this.data,
        this.help = false,
        this.radiusTop = true,
        this.radiusBottom = true,
        this.centerTitle = false,
        this.initSwitch = false,
        this.initSelected = false,
        this.isDestructive = false,
        this.onTap,
        this.onChanged,
        this.theme});

  @override
  State<ButtonSetting> createState() => _ButtonSettingState();
}

class _ButtonSettingState extends State<ButtonSetting> {
  late bool isSwitch;
  late ButtonSettingTheme theme;

  @override
  void initState() {
    super.initState();
    isSwitch = widget.initSwitch;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = widget.theme ?? Theme.of(context).extension<ButtonSettingTheme>()!;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.only(
        topLeft: widget.radiusTop ? Radius.circular(theme.radius) : Radius.zero,
        topRight: widget.radiusTop ? Radius.circular(theme.radius) : Radius.zero,
        bottomLeft: widget.radiusBottom ? Radius.circular(theme.radius) : Radius.zero,
        bottomRight: widget.radiusBottom ? Radius.circular(theme.radius) : Radius.zero,
      ),
      color: theme.backgroundColor,
      child: InkWell(
          customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: widget.radiusTop ? Radius.circular(theme.radius) : Radius.zero,
                topRight: widget.radiusTop ? Radius.circular(theme.radius) : Radius.zero,
                bottomLeft: widget.radiusBottom ? Radius.circular(theme.radius) : Radius.zero,
                bottomRight: widget.radiusBottom ? Radius.circular(theme.radius) : Radius.zero,
              )
          ),
          splashColor: Colors.transparent,
          onTap: widget.onTap,
          child: Container(
              height: theme.height,
              padding: EdgeInsets.symmetric(horizontal: theme.padding),
              child: Row(
                children: [
                  if (widget.leftIcon != null)
                    Icon(
                        widget.leftIcon,
                        size: theme.sizeLeftIcon,
                        color: theme.leftIconColor,
                    ),
                  if (widget.leftIcon != null)
                    SizedBox(
                      width: theme.space,
                    ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: (widget.type == Type.button && widget.centerTitle) ? MainAxisAlignment.center : MainAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: widget.type == Type.button ? (!widget.isDestructive ? theme.titleButtonStyle : theme.titleButtonDestructibleStyle) : theme.titleStyle,
                        ),
                        if(widget.data != null && widget.type != Type.toogle && widget.type != Type.selected && widget.type != Type.button)
                          SizedBox(
                            width: theme.space,
                          ),
                        if(widget.data != null && widget.type != Type.toogle && widget.type != Type.selected && widget.type != Type.button)
                          Expanded(
                            child: Text(
                              widget.data!,
                              style: theme.dataStyle,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.end,
                            ),
                          ),
                      ],
                    ),
                  ),
                  if(widget.type == Type.standard)
                    SizedBox(
                      width: theme.space,
                    ),
                  if(widget.type == Type.standard)
                    Icon(
                      MushroomGOFontUtils.chevronRight,
                      color: theme.chevronColor,
                      size: theme.sizeChevron,
                    ),
                  if(widget.type == Type.toogle)
                    SizedBox(
                      width: theme.space,
                    ),
                  if(widget.type == Type.toogle)
                    Transform.translate(
                      offset: const Offset(5.0, 0.0),
                      child: CupertinoSwitch(
                        value: isSwitch,
                        onChanged: (bool isSwitch){
                          setState(() {
                            this.isSwitch = widget.onChanged!.call(isSwitch);
                          });
                        },
                      ),
                    ),
                  if(widget.type == Type.selected && widget.initSelected)
                    SizedBox(
                      width: theme.space,
                    ),
                  if(widget.type == Type.selected && widget.initSelected)
                    Icon(
                      CupertinoIcons.check_mark,
                      color: theme.checkColor,
                      size: theme.sizeCheck,
                    ),
                ],
              ))),
    );
  }
}