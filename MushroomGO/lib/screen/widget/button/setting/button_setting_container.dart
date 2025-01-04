import 'package:flutter/material.dart';
import 'package:mushroom_go/screen/widget/button/setting/button_setting.dart';
import 'package:mushroom_go/theme/button_setting_container_theme.dart';

class ButtonSettingContainer extends StatefulWidget {
  final String? title;
  final List<ButtonSetting> buttons;
  final int? indexSelected;
  final ButtonSettingContainerTheme? theme;

  const ButtonSettingContainer({super.key, this.title, required this.buttons, this.indexSelected, this.theme});

  @override
  State<ButtonSettingContainer> createState() => _ButtonSettingContainerState();
}

class _ButtonSettingContainerState extends State<ButtonSettingContainer> {
  late int? indexSelected;
  late ButtonSettingContainerTheme theme;

  List<Widget> rebuild(List<ButtonSetting> buttons){
    List<Widget> widgets = [];
    if(widget.title != null){
      widgets.add(
          Container(
            margin: EdgeInsets.only(left: theme.indentTitle),
            child: Text(
              widget.title!,
              style: theme.titleStyle,
            ),
          )
      );
      widgets.add(
          SizedBox(height: theme.space,)
      );
    }
    for (int i = 0; i < buttons.length; i++) {
      final button = buttons[i];
      final bool initSelected = i == indexSelected;
      final bool radiusTop = i == 0;
      final bool radiusBottom = i == buttons.length - 1;
      widgets.add(ButtonSetting(
        type: indexSelected == null ? button.type : Type.selected,
        leftIcon: button.leftIcon,
        title: button.title,
        data: button.data,
        help: button.help,
        radiusTop: radiusTop,
        radiusBottom: radiusBottom,
        centerTitle: button.centerTitle,
        initSwitch: button.initSwitch,
        initSelected: indexSelected != null ? initSelected : button.initSelected,
        isDestructive: button.isDestructive,
        onTap: indexSelected != null ? (){
          if(indexSelected != null){
            setState(() {
              indexSelected = i;
            });
          }
          button.onTap?.call();
        } : button.onTap,
        onChanged: button.onChanged,
        theme: button.theme,
      ));
      if (i < buttons.length - 1) {
        widgets.add(Transform.scale(
          scaleY: 0.2,
          child: Divider(
            height: 0,
            indent: theme.indentDivider,
          ),
        ));
      }
    }
    return widgets;
  }

  @override
  void initState() {
    super.initState();
    indexSelected = widget.indexSelected;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = widget.theme ?? Theme.of(context).extension<ButtonSettingContainerTheme>()!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: rebuild(widget.buttons),
    );
  }
}
