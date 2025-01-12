import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/color_constant.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/navigation_constant.dart';
import 'package:mushroom_go/screen/widget/button/standard/button_standard.dart';
import 'package:mushroom_go/screen/widget/container/benefit_container.dart';
import 'package:mushroom_go/screen/widget/text/text_output.dart';
import 'package:mushroom_go/theme/button_standard_theme.dart';
import 'package:mushroom_go/utils/font/mushroom_go_font_utils.dart';

class BenefitAccountPage extends StatefulWidget {
  final BuildContext mainContext;
  const BenefitAccountPage({super.key, required this.mainContext});

  @override
  State<BenefitAccountPage> createState() => _BenefitAccountPageState();
}

class _BenefitAccountPageState extends State<BenefitAccountPage> {
  // TODO: check benefit
  late bool _isBack;
  late double _containerHeight = 0;
  final GlobalKey _containerKey = GlobalKey();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _isBack = ModalRoute.of(context)!.settings.arguments as bool? ?? false;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(FirebaseAuth.instance.currentUser != null){
        Navigator.of(context).pop();
      }
    });
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
            child: SafeArea(
                child: SizedBox(
                    width: double.infinity,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: DimensionConstant.spaceVerticalLogin,),
                          Icon(MushroomGOFontUtils.logo, color: ColorConstant.textPrimaryColor, size: MediaQuery.of(context).size.width * DimensionConstant.ratioLogoLogin,),
                          const SizedBox(height: DimensionConstant.spaceVerticalLogin,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: DimensionConstant.paddingLogin),
                            child: TextOutput(
                              text: "Avantages d'un compte",
                              type: Type.largeTitle,
                              fontColor: ColorConstant.textPrimaryColor,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
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
                        ]
                    )
                )
            )
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
            ButtonStandard(title: "Se connecter", onTap: () async {
              await Navigator.of(widget.mainContext).pushNamed(NavigationConstant.loginPage, arguments: true);
              if(!context.mounted) return;
              if(FirebaseAuth.instance.currentUser != null){
                Navigator.of(context).pop();
              }
            }, theme: Theme.of(context).extension<ButtonStandardTheme>()!.copyWith(
                backgroundColor: Colors.white,
                titleStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: DimensionConstant.titleSmall,
                  fontWeight: FontWeight.w700,
                )
            ),),
            SizedBox(height: _isBack ? 10.0 : 35,),
            if(_isBack) ... [
              TextOutput(text: "Passer", type: Type.smallTitle, fontColor: Colors.white, onTap: (){
                Navigator.of(context).pop();
              },)
            ]
          ],
        ),
      ),
    );
  }
}
