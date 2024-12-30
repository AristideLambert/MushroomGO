import 'package:flutter/cupertino.dart';

class IosPopup extends StatelessWidget {
  const IosPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
          title: Text("Titre iOS"),
          content: Text("Ceci est un dialogue iOS."),
          actions: [
            CupertinoDialogAction(
              child: Text("Annuler"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
}
