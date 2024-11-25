import 'package:flutter/material.dart';

import '../widget/container/profile_container.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SafeArea(
        child: Column(
          children: [
            ProfileContainer(
              image: const NetworkImage(
                'https://picsum.photos/seed/904/600',
              ),
              name: "Aristide LAMBERT",
              mail: "aristidelambert@yahoo.fr",
              onTap: () {
                /*Navigator.of(widget.mainPageContext).push(
                    MaterialPageRoute(
                        builder: (context) => const AccountSettingPage()
                    )
                );*/
              },
            ),
          ],
        ),
      ),
    );
  }
}
