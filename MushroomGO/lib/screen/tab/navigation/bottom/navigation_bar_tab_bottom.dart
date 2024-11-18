import 'package:flutter/material.dart';
import 'package:mushroom_go/screen/tab/navigation/bottom/navigation_item_tab_bottom.dart';
import 'package:mushroom_go/theme/navigation_tab_bottom_theme.dart';
import 'package:mushroom_go/utils/font/mushroom_go_font_utils.dart';

class NavigationBarTabBottom extends StatefulWidget {
  final int tabIndex;
  final Function(int) onTap;
  final NavigationTabBottomTheme? theme;

  const NavigationBarTabBottom({super.key, required this.tabIndex, required this.onTap, this.theme});

  @override
  State<NavigationBarTabBottom> createState() => _NavigationBarTabBottomState();
}

class _NavigationBarTabBottomState extends State<NavigationBarTabBottom> {
  late NavigationTabBottomTheme _theme;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _theme = widget.theme ?? Theme.of(context).extension<NavigationTabBottomTheme>()!;
  }
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        height: _theme.height,
        padding: EdgeInsets.zero,
        elevation: 0.0,
        child: Row(
          children: [
            NavigationItemTabBottom(
              title: "Acceuil",
              icon: MushroomGOFontUtils.home,
              sizeIcon: _theme.sizeIcon,
              selectedColor: _theme.selectedColor,
              unselectedColor: _theme.unselectedColor,
              titleSelectedStyle: _theme.titleSelectedStyle,
              titleUnselectedStyle: _theme.titleUnselectedStyle,
              onTap: () => widget.onTap(0),
              isSelected: widget.tabIndex == 0
            ),
            NavigationItemTabBottom(
                title: "Carte",
                icon: MushroomGOFontUtils.map,
                sizeIcon: _theme.sizeIcon,
                selectedColor: _theme.selectedColor,
                unselectedColor: _theme.unselectedColor,
                titleSelectedStyle: _theme.titleSelectedStyle,
                titleUnselectedStyle: _theme.titleUnselectedStyle,
                onTap: () => widget.onTap(1),
                isSelected: widget.tabIndex == 1
            ),
            SizedBox(
              width: _theme.buttonSize,
            ),
            NavigationItemTabBottom(
                title: "Défi",
                icon: MushroomGOFontUtils.trophy,
                sizeIcon: _theme.sizeIcon,
                selectedColor: _theme.selectedColor,
                unselectedColor: _theme.unselectedColor,
                titleSelectedStyle: _theme.titleSelectedStyle,
                titleUnselectedStyle: _theme.titleUnselectedStyle,
                onTap: () => widget.onTap(2),
                isSelected: widget.tabIndex == 2
            ),
            NavigationItemTabBottom(
                title: "Profil",
                icon: MushroomGOFontUtils.profile,
                sizeIcon: _theme.sizeIcon,
                selectedColor: _theme.selectedColor,
                unselectedColor: _theme.unselectedColor,
                titleSelectedStyle: _theme.titleSelectedStyle,
                titleUnselectedStyle: _theme.titleUnselectedStyle,
                onTap: () => widget.onTap(3),
                isSelected: widget.tabIndex == 3
            ),
          ],
        )
    );
  }
}
