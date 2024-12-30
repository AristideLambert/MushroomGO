import 'package:flutter/material.dart';

class AndroidPopup extends StatelessWidget {
  const AndroidPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Titre Android"),
      content: Text("Ceci est un dialogue Android."),
      actions: [
        TextButton(
          child: Text("ANNULER"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
