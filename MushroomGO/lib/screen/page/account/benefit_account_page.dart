import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/color_constant.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/navigation_constant.dart';
import 'package:mushroom_go/constant/text_style_constant.dart';
import 'package:mushroom_go/screen/widget/button/standard/button_standard.dart';
import 'package:mushroom_go/screen/widget/container/benefit_container.dart';
import 'package:mushroom_go/screen/widget/text/text_output.dart';
import 'package:mushroom_go/theme/button_standard_theme.dart';
import 'package:mushroom_go/utils/font/mushroom_go_font_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BenefitAccountPage extends StatefulWidget {
  final BuildContext mainContext;
  const BenefitAccountPage({super.key, required this.mainContext});

  @override
  State<BenefitAccountPage> createState() => _BenefitAccountPageState();
}

class _BenefitAccountPageState extends State<BenefitAccountPage> {
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
                    const SizedBox(height: DimensionConstant.spaceVerticalBenefitAccount,),
                    Icon(MushroomGOFontUtils.logo, color: ColorConstant.textPrimaryColor, size: MediaQuery.of(context).size.width * DimensionConstant.ratioLogoBenefitAccount,),
                    const SizedBox(height: DimensionConstant.spaceVerticalBenefitAccount,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: DimensionConstant.paddingBenefitAccount),
                      child: TextOutput(
                        text: AppLocalizations.of(context)!.benefitAccountTitle,
                        type: Type.largeTitle,
                        fontColor: ColorConstant.textPrimaryColor,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BenefitContainer(icon: MushroomGOFontUtils.map, title: AppLocalizations.of(context)!.benefitAccountMapTitle, description: AppLocalizations.of(context)!.benefitAccountMapDescription,),
                            BenefitContainer(icon: MushroomGOFontUtils.history, title: AppLocalizations.of(context)!.benefitAccountHistoryTitle, description: AppLocalizations.of(context)!.benefitAccountHistoryDescription,),
                            BenefitContainer(icon: MushroomGOFontUtils.trophy, title: AppLocalizations.of(context)!.benefitAccountChallengeTitle, description: AppLocalizations.of(context)!.benefitAccountChallengeDescription,)
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
            ButtonStandard(
              title: AppLocalizations.of(context)!.benefitAccountChallengeButtonLogin,
              onTap: () async {
                await Navigator.of(widget.mainContext).pushNamed(NavigationConstant.loginPage, arguments: true);
                if(!context.mounted) return;
                if(FirebaseAuth.instance.currentUser != null){
                  if(_isBack) {
                    Navigator.of(context).pop();
                  }
                }
              },
              theme: Theme.of(context).extension<ButtonStandardTheme>()!.copyWith(
                backgroundColor: ColorConstant.buttonBackgroundBenefitAccount,
                titleStyle: TextStyleConstant.buttonTitleBenefitAccount
              ),
            ),
            SizedBox(height: _isBack ? DimensionConstant.spaceSmallVerticalBenefitAccount : DimensionConstant.spaceLargeVerticalBenefitAccount,),
            if(_isBack) ... [
              TextOutput(
                text: AppLocalizations.of(context)!.benefitAccountChallengeButtonSkip,
                type: Type.smallTitle,
                fontColor: ColorConstant.textPrimaryColor,
                onTap: (){
                  Navigator.of(context).pop();
                },
              )
            ]
          ],
        ),
      ),
    );
  }
}