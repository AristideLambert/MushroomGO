import 'package:flutter/material.dart';
import 'package:mushroom_go/screen/tab/challenge_mushrooms_list_tab.dart';

class ChallengeMushroomsTab extends StatefulWidget {
  const ChallengeMushroomsTab({super.key});

  @override
  State<ChallengeMushroomsTab> createState() => _ChallengeMushroomsTabState();
}

class _ChallengeMushroomsTabState extends State<ChallengeMushroomsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ChallengeMushroomsListTab(
                category: 'Commun',
                itemCount: 10
              ),
              ChallengeMushroomsListTab(
                category: 'Rare',
                itemCount: 10
              ),
              ChallengeMushroomsListTab(
                category: 'Epic',
                itemCount: 10
              ),
            ],
          ),
        ),
      ),
    );
  }
}