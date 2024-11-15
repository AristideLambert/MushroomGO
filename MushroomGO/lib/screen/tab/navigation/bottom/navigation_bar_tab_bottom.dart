import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/screen/tab/navigation/bottom/navigation_item_tab_bottom.dart';
import 'package:mushroom_go/utils/font/mushroom_go_font_utils.dart';

class NavigationBarTabBottom extends StatefulWidget {
  final int tabIndex;
  final Function(int) onTap;

  const NavigationBarTabBottom({super.key, required this.tabIndex, required this.onTap});

  @override
  State<NavigationBarTabBottom> createState() => _NavigationBarTabBottomState();
}

class _NavigationBarTabBottomState extends State<NavigationBarTabBottom> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        height: DimensionConstant.heightNavigationTabBottom,
        padding: EdgeInsets.zero,
        elevation: 0.0,
        child: Row(
          children: [
            NavigationItemTabBottom(
              title: "Acceuil",
              icon: MushroomGOFontUtils.home,
              onTap: () => widget.onTap(0),
              isSelected: widget.tabIndex == 0
            ),
            NavigationItemTabBottom(
                title: "Carte",
                icon: MushroomGOFontUtils.map,
                onTap: () => widget.onTap(1),
                isSelected: widget.tabIndex == 1
            ),
            const SizedBox(
              width: DimensionConstant.buttonSizeNavigationTabBottom,
            ),
            NavigationItemTabBottom(
                title: "Défi",
                icon: MushroomGOFontUtils.trophy,
                onTap: () => widget.onTap(2),
                isSelected: widget.tabIndex == 2
            ),
            NavigationItemTabBottom(
                title: "Profil",
                icon: MushroomGOFontUtils.profile,
                onTap: () => widget.onTap(3),
                isSelected: widget.tabIndex == 3
            ),
          ],
        )
    );
  }
}
