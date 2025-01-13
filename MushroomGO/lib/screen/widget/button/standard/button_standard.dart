import 'package:flutter/material.dart';
import 'package:mushroom_go/theme/button_standard_theme.dart';

class ButtonStandard extends StatefulWidget {
  final String title;
  final IconData? icon;
  final bool centerTitle;
  final bool enabled;
  final bool widthContent;
  final Function()? onTap;
  final ButtonStandardTheme? theme;

  const ButtonStandard({super.key, required this.title, this.icon, this.centerTitle = true, this.enabled = true, required this.onTap, this.theme, this.widthContent = false});

  @override
  State<ButtonStandard> createState() => _ButtonStandardState();
}

class _ButtonStandardState extends State<ButtonStandard> {
  late ButtonStandardTheme _theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _theme = widget.theme ?? Theme.of(context).extension<ButtonStandardTheme>()!;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Material(
          borderRadius: BorderRadius.all(Radius.circular(_theme.radius)),
          color: _theme.backgroundColor,
          child: InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(_theme.radius))
            ),
            splashColor: _theme.splashColor,
            onTap: widget.onTap,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: _theme.padding),
              height: _theme.height,
              child: Row(
                mainAxisSize: widget.widthContent ? MainAxisSize.min : MainAxisSize.max,
                mainAxisAlignment: widget.centerTitle ? MainAxisAlignment.center : MainAxisAlignment.start,
                children: [
                  if(widget.icon != null)
                    Icon(
                      widget.icon,
                      size: _theme.sizeIcon,
                      color: _theme.iconColor,
                    ),
                  if(widget.icon != null)
                    SizedBox(
                      width: _theme.space,
                    ),
                  Text(
                    widget.title,
                    style: _theme.titleStyle
                  )
                ],
              ),
            ),
          )
        ),
        if(!widget.enabled)
          Container(
            height: _theme.height,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(_theme.radius),
            ),
          ),
      ]
    );
  }
}
