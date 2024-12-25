import 'package:flutter/material.dart';
import 'package:mushroom_go/theme/text_output_theme.dart';

enum Type { largeTitle, mediumTitle, smallTitle, body }

class TextOutput extends StatefulWidget {
  final String text;
  final Type type;
  final double? fontSize;
  final Color? fontColor;
  final FontWeight? fontWeight;
  final Function()? onTap;
  final TextOutputTheme? theme;

  const TextOutput({
    super.key,
    required this.text,
    this.type = Type.body,
    this.fontSize,
    this.fontColor,
    this.fontWeight,
    this.onTap,
    this.theme
  });

  @override
  State<TextOutput> createState() => _TextOutputState();
}

class _TextOutputState extends State<TextOutput> {
  late TextOutputTheme _theme;
  late double _fontSize;
  late Color _fontColor;
  late FontWeight _fontWeight;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _theme = widget.theme ?? Theme.of(context).extension<TextOutputTheme>()!;
    _updateTextStyleData();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Text(
        widget.text,
        style: TextStyle(
          fontSize: _fontSize,
          color: _fontColor,
          fontWeight: _fontWeight,
          decoration: TextDecoration.none
        ),
      ),
    );
  }

  void _updateTextStyleData(){
    _fontSize = (widget.fontSize ?? _getTextStyleTheme().fontSize)!;
    _fontColor = (widget.fontColor ?? _getTextStyleTheme().color)!;
    _fontWeight = (widget.fontWeight ?? _getTextStyleTheme().fontWeight)!;
  }

  TextStyle _getTextStyleTheme(){
    switch(widget.type){
      case Type.body: return _theme.bodyStyle;
      case Type.smallTitle: return _theme.smallTitleStyle;
      case Type.mediumTitle: return _theme.mediumTitleStyle;
      case Type.largeTitle: return _theme.largeTitleStyle;
      default: return _theme.bodyStyle;
    }
  }
}
