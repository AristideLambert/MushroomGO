import 'package:flutter/cupertino.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/screen/widget/textfield/text_input_policy.dart';
import 'package:mushroom_go/utils/text/password_utils.dart';

class TextInput extends StatefulWidget {
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final String? title;
  final String placeHolder;
  final IconData? leftIcon;
  final bool password;
  final bool clearText;
  final bool passwordPolicy;

  const TextInput(
    {super.key,
      required this.textInputAction,
      required this.keyboardType,
      this.title,
      required this.placeHolder,
      this.leftIcon,
      this.password = false,
      this.clearText = false,
      this.passwordPolicy = false});

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  late bool _title;
  late bool _policy;
  bool _length = false;
  bool _upperCase = false;
  bool _lowerCase = false;
  bool _specialCharacter = false;

  @override
  void initState() {
    super.initState();
    _title = widget.title != null && widget.title!.isNotEmpty;
    _policy = widget.password && widget.passwordPolicy;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(_title)
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 5.0),
            child: Text(widget.title!, style: TextStyle(
              fontSize: DimensionConstant.bodyText,
              fontWeight: FontWeight.bold,
              color: CupertinoColors.white
            ),),
          ),
        SizedBox(
          height: 35,
          child: CupertinoTheme(
            data: CupertinoThemeData(

              primaryColor: CupertinoColors.systemRed, // Couleur du bouton clear
            ),
            child: CupertinoTextField(
              clearButtonMode: widget.clearText ? OverlayVisibilityMode.editing : OverlayVisibilityMode.never,
              obscureText: widget.password,
              placeholder: widget.placeHolder,
              keyboardType: widget.keyboardType,
              textInputAction: widget.textInputAction,
              style: TextStyle(fontSize: DimensionConstant.bodyText, color: CupertinoColors.white),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Color(0xFF2E2E2E), //F1F1F3
                borderRadius: BorderRadius.circular(10),
              ),
              prefix: widget.leftIcon != null ? Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Icon(
                  widget.leftIcon,
                  size: 20,
                ),
              ) : null,
              onChanged: _policy ?
                  (password){
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
        if(_policy)
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 5.0),
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