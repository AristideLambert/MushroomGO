import 'package:flutter/material.dart';
import 'package:mushroom_go/theme/text_input_policy_theme.dart';
import 'package:mushroom_go/utils/font/mushroom_go_font_utils.dart';

class TextInputPolicy extends StatefulWidget {
  final String policy;
  final bool respect;
  final TextInputPolicyTheme? theme;
  
  const TextInputPolicy({super.key, required this.policy, required this.respect, this.theme});

  @override
  State<TextInputPolicy> createState() => _TextInputPolicyState();
}

class _TextInputPolicyState extends State<TextInputPolicy> {
  late TextInputPolicyTheme _theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _theme = widget.theme ?? Theme.of(context).extension<TextInputPolicyTheme>()!;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //TODO: Update icon
        Icon(
          widget.respect ? Icons.check_circle : MushroomGOFontUtils.clear,
          color: widget.respect ? _theme.respect : _theme.notRespect,
          size: _theme.sizeIcon
        ),
        SizedBox(width: _theme.space,),
        Text(
          widget.policy,
          style: _theme.policyStyle
        )
      ],
    );
  }
}
