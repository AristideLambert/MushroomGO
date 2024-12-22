import 'package:flutter/cupertino.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';

class TextInput extends StatefulWidget {
  const TextInput({Key? key}) : super(key: key);

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  late TextEditingController _controller;
  bool _hasText = false;

  @override
  void initState() {
    _controller = TextEditingController();
    _controller.addListener(() {
      setState(() {
        _hasText = _controller.text.isNotEmpty;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: CupertinoTextField(
        controller: _controller,
        placeholder: "Enter text",
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.search,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color(0xFFCCCCCC),
            width: 0.5,
          ),
        ),
        prefix: const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Icon(
            CupertinoIcons.search,
            size: 20,
          ),
        ),
        suffix: _hasText
            ? GestureDetector(
          onTap: _controller.clear,
          child: const Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(
              CupertinoIcons.clear_thick_circled,
              size: 20,
              color: Color(0xFF888888),
            ),
          ),
        )
            : null,
      ),
    );
  }
}