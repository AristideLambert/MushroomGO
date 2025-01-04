import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/navigation_constant.dart';
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
  // TODO: check benefit
  late Function()? _nextAction;
  late double _containerHeight = 0;
  final GlobalKey _containerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _nextAction = ModalRoute.of(context)!.settings.arguments as Function()?;
  }

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
          padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
          child: Padding(
            padding: EdgeInsets.only(bottom: _containerHeight),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // TODO: update benefit
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
        padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ButtonStandard(title: "Se connecter", onTap: (){
              Navigator.of(context).pushNamed(NavigationConstant.loginPage, arguments: _nextAction);
            }, theme: Theme.of(context).extension<ButtonStandardTheme>()!.copyWith(
                backgroundColor: Colors.white,
                titleStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: DimensionConstant.titleSmall,
                  fontWeight: FontWeight.w700,
                )
            ),),
            const SizedBox(height: 10.0,),
            TextOutput(text: "Passer", type: Type.smallTitle, fontColor: Colors.white, onTap: (){
              _nextAction?.call();
            },)
          ],
        ),
      ),
    );
  }
}
