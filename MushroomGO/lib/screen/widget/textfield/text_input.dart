import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mushroom_go/screen/widget/textfield/text_input_policy.dart';
import 'package:mushroom_go/theme/text_input_theme.dart';
import 'package:mushroom_go/utils/font/mushroom_go_font_utils.dart';
import 'package:mushroom_go/utils/text/password_utils.dart';

class TextInput extends StatefulWidget {
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final String? title;
  final String placeHolder;
  final IconData? leftIcon;
  final bool password;
  final bool clearText;
  final bool passwordPolicy;
  final TextInputTheme? theme;

  const TextInput(
    {super.key,
      required this.controller,
      required this.textInputAction,
      required this.keyboardType,
      this.title,
      required this.placeHolder,
      this.leftIcon,
      this.password = false,
      this.clearText = false,
      this.passwordPolicy = false,
      this.theme
    });

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  late TextInputTheme _theme;
  late TextEditingController _controller;
  late bool _title;
  late bool _policy;
  late bool _leftIcon;
  bool _hasText = false;
  bool _clearText = false;
  bool _passwordVisible = false;
  bool _length = false;
  bool _upperCase = false;
  bool _lowerCase = false;
  bool _specialCharacter = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _controller.addListener((){
      setState(() {
        _hasText = _controller.text.isNotEmpty;
        _clearText = widget.clearText && _hasText && !widget.password;
      });
    });
    _passwordVisible = !widget.password;
    _title = widget.title != null && widget.title!.isNotEmpty;
    _policy = widget.password && widget.passwordPolicy;
    _leftIcon = widget.leftIcon != null;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _theme = widget.theme ?? Theme.of(context).extension<TextInputTheme>()!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(_title)
          Padding(
            padding: EdgeInsets.only(left: _theme.leftPaddingTitle, bottom: _theme.bottomPaddingTitle),
            child: Text(widget.title!, style: _theme.titleStyle),
          ),
        Stack(
          alignment: AlignmentDirectional.centerEnd,
          children: [
            Stack(
              alignment: AlignmentDirectional.centerStart,
              children:[
                SizedBox(
                  height: _theme.heightInput,
                  child: CupertinoTheme(
                    data: CupertinoThemeData(
                      primaryColor: _theme.selectionCursorColor
                    ),
                    child: CupertinoTextField(
                      controller: _controller,
                      obscureText: !_passwordVisible,
                      placeholder: widget.placeHolder,
                      placeholderStyle: _theme.placeHolderStyle,
                      keyboardType: widget.keyboardType,
                      textInputAction: widget.textInputAction,
                      style: _theme.inputStyle,
                      padding: EdgeInsets.only(left: _leftIcon ? _theme.leftPaddingInputIcon : _theme.leftPaddingInput, right: _clearText ? _theme.rightPaddingInputIcon : _theme.rightPaddingInput),
                      decoration: BoxDecoration(
                        border: Border.all(color: _theme.borderInputColor, width: _theme.borderInput),
                        borderRadius: BorderRadius.circular(_theme.radiusBorderInput),
                      ),
                      onChanged: _policy ? (password) {
                        setState(() {
                          _length = PasswordUtils.checkLength(password);
                          _upperCase = PasswordUtils.checkUpperCase(password);
                          _lowerCase = PasswordUtils.checkLowerCase(password);
                          _specialCharacter = PasswordUtils.checkSpecialCharacter(password);
                        });
                      } : null,
                    ),
                  ),
                ),
                if(_leftIcon)
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: _theme.marginLeftIcon),
                    child: Icon(
                      widget.leftIcon,
                      color: _theme.leftIconColor,
                      size: _theme.sizeLeftIcon,
                    )
                  ),
              ]
            ),
            if(_clearText)
              Container(
                margin: EdgeInsets.symmetric(horizontal: _theme.marginRightIcon),
                child: GestureDetector(
                    onTap: (){
                      _controller.clear();
                    },
                    child: Icon(
                      MushroomGOFontUtils.clear,
                      color: _theme.rightIconColor,
                      size: _theme.sizeRightIcon,
                    )
                )
              )
            else if(widget.password)
              Container(
                margin: EdgeInsets.symmetric(horizontal: _theme.marginRightIcon),
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      _passwordVisible = widget.password && !_passwordVisible;
                    });
                  },
                  child: Icon(
                    // TODO: Update icon
                    _passwordVisible ? MushroomGOFontUtils.history : MushroomGOFontUtils.mushroomScan,
                    color: _theme.rightIconColor,
                    size: _theme.sizeRightIcon,
                  )
                )
              )
          ]
        ),
        if(_policy)
          Padding(
            padding: EdgeInsets.only(left: _theme.leftPaddingPolicy, top: _theme.topPaddingPolicy),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextInputPolicy(policy: "_length", respect: _length),
                TextInputPolicy(policy: "_upperCase", respect: _upperCase),
                TextInputPolicy(policy: "_lowerCase", respect: _lowerCase),
                TextInputPolicy(policy: "_specialCharacter", respect: _specialCharacter),
              ],
            ),
          )
      ],
    );
  }
}