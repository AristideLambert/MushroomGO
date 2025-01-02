import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/color_constant.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/screen/widget/button/standard/button_standard.dart';
import 'package:mushroom_go/screen/widget/container/benefit_container.dart';
import 'package:mushroom_go/screen/widget/text/text_output.dart';
import 'package:mushroom_go/theme/button_standard_theme.dart';
import 'package:mushroom_go/utils/font/mushroom_go_font_utils.dart';

class BenefitAccountPage extends StatefulWidget {
  const BenefitAccountPage({super.key});

  @override
  State<BenefitAccountPage> createState() => _BenefitAccountPageState();
}

class _BenefitAccountPageState extends State<BenefitAccountPage> {
  late double _containerHeight = 0;
  final GlobalKey _containerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderBox = _containerKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null && mounted) {
        setState(() {
          _containerHeight = renderBox.size.height;
        });
      }
    });
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(DimensionConstant.defaultPadding),
          child: Padding(
            padding: EdgeInsets.only(bottom: _containerHeight),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BenefitContainer(icon: MushroomGOFontUtils.history, title:  "Historique", description:  "Accès à une carte complète",),
                  BenefitContainer(icon: MushroomGOFontUtils.map, title:  "Carte", description:  "Accès à une carte complète",),
                  BenefitContainer(icon: MushroomGOFontUtils.trophy, title:  "Défis", description:  "Accès à une carte complète",)
                ],
              ),
            ),
          )
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        key: _containerKey,
        padding: EdgeInsets.all(DimensionConstant.defaultPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ButtonStandard(title: "Se connecter", onTap: null, theme: Theme.of(context).extension<ButtonStandardTheme>()!.copyWith(
                backgroundColor: Colors.white,
                titleStyle: TextStyle(
                  color: Colors.black,
                  fontSize: DimensionConstant.titleSmall,
                  fontWeight: FontWeight.w700,
                )
            ),),
            SizedBox(height: 10.0,),
            TextOutput(text: "Passer", type: Type.smallTitle, fontColor: Colors.white,)
          ],
        ),
      ),
    );
  }
}
