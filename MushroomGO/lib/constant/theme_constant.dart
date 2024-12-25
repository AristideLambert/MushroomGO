import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mushroom_go/constant/text_style_constant.dart';
import 'package:mushroom_go/theme/button_setting_container_theme.dart';
import 'package:mushroom_go/theme/button_setting_theme.dart';
import 'package:mushroom_go/theme/button_standard_theme.dart';
import 'package:mushroom_go/theme/challenge_mushrooms_list_theme.dart';
import 'package:mushroom_go/theme/navigation_tab_bottom_theme.dart';
import 'package:mushroom_go/theme/navigation_tab_top_theme.dart';
import 'package:mushroom_go/theme/profile_container_theme.dart';
import 'package:mushroom_go/theme/text_input_policy_theme.dart';
import 'package:mushroom_go/theme/text_input_theme.dart';
import 'package:mushroom_go/theme/text_output_theme.dart';
import 'color_constant.dart';

class ThemeConstant{
  // Default
  static ThemeData lightTheme = ThemeData(
    primaryColor: ColorConstant.primaryColor,
    scaffoldBackgroundColor: CupertinoColors.lightBackgroundGray,
    appBarTheme: const AppBarTheme(
        backgroundColor: CupertinoColors.systemBackground,
        foregroundColor: CupertinoColors.label
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
        color: CupertinoColors.systemBackground
    ),
    textSelectionTheme: TextSelectionThemeData(
        selectionHandleColor: ColorConstant.primaryColor,
        cursorColor: ColorConstant.primaryColor,
        selectionColor: ColorConstant.primaryColor.withOpacity(0.3)
    ),
  ).copyWith(
    extensions: [
      const ButtonStandardTheme(
          titleStyle: TextStyleConstant.lightTitleButtonStandard
      ),
      const ButtonSettingTheme(
        titleStyle: TextStyleConstant.lightTitleButtonSetting,
        dataStyle: TextStyleConstant.lightDataButtonSetting,
        backgroundColor: ColorConstant.lightBackgroundButtonSetting
      ),
      const ButtonSettingContainerTheme(
        titleStyle: TextStyleConstant.lightTitleButtonSettingContainer
      ),
      const NavigationTabBottomTheme(
        unselectedColor: ColorConstant.lightUnselectedNavigationTabBottom,
        titleSelectedStyle: TextStyleConstant.lightTitleSelectedNavigationTabBottom,
        titleUnselectedStyle: TextStyleConstant.lightTitleUnselectedNavigationTabBottom
      ),
      const NavigationTabTopTheme(
        titleSelectedStyle: TextStyleConstant.lightTitleSelectedNavigationTabTop,
        titleUnselectedStyle: TextStyleConstant.lightTitleUnselectedNavigationTabTop
      ),
      const ProfileContainerTheme(
        backgroundColor: ColorConstant.lightBackgroundProfileContainer,
        nameStyle: TextStyleConstant.lightNameProfileContainer,
        mailStyle: TextStyleConstant.lightMailProfileContainer
      ),
      const ChallengeMushroomsListTheme(
        backgroundColor: ColorConstant.lightBackgroundChallengeMushroomsList,
        titleStyle: TextStyleConstant.lightTitleChallengeMushroomsList,
        titleItemStyle: TextStyleConstant.lightTitleItemChallengeMushroomsList
      ),
      const TextInputTheme(
          titleStyle: TextStyleConstant.lightTitleTextInput,
          placeHolderStyle: TextStyleConstant.lightPlaceHolderTextInput,
          inputStyle: TextStyleConstant.lightInputTextInput
      ),
      const TextInputPolicyTheme(
        policyStyle: TextStyleConstant.lightPolicyTextInputPolicy
      ),
      const TextOutputTheme(
        bodyStyle: TextStyleConstant.lightBodyTextOutput,
        smallTitleStyle: TextStyleConstant.lightSmallTitleTextOutput,
        mediumTitleStyle: TextStyleConstant.lightMediumTitleTextOutput,
        largeTitleStyle: TextStyleConstant.lightLargeTitleTextOutput,
      )
    ]
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: ColorConstant.primaryColor,
    scaffoldBackgroundColor: CupertinoColors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: CupertinoColors.darkBackgroundGray,
      foregroundColor: Colors.white
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
        color: CupertinoColors.darkBackgroundGray
    ),
    textSelectionTheme: TextSelectionThemeData(
        selectionHandleColor: ColorConstant.primaryColor,
        cursorColor: ColorConstant.primaryColor,
        selectionColor: ColorConstant.primaryColor.withOpacity(0.3)
    ),
  ).copyWith(
      extensions: [
        const ButtonStandardTheme(
            titleStyle: TextStyleConstant.darkTitleButtonStandard
        ),
        const ButtonSettingTheme(
          titleStyle: TextStyleConstant.darkTitleButtonSetting,
          dataStyle: TextStyleConstant.darkDataButtonSetting,
          backgroundColor: ColorConstant.darkBackgroundButtonSetting
        ),
        const ButtonSettingContainerTheme(
            titleStyle: TextStyleConstant.darkTitleButtonSettingContainer
        ),
        const NavigationTabBottomTheme(
          unselectedColor: ColorConstant.darkUnselectedNavigationTabBottom,
          titleSelectedStyle: TextStyleConstant.darkTitleSelectedNavigationTabBottom,
          titleUnselectedStyle: TextStyleConstant.darkTitleUnselectedNavigationTabBottom
        ),
        const NavigationTabTopTheme(
          titleSelectedStyle: TextStyleConstant.darkTitleSelectedNavigationTabTop,
          titleUnselectedStyle: TextStyleConstant.darkTitleUnselectedNavigationTabTop
        ),
        const ProfileContainerTheme(
          backgroundColor: ColorConstant.darkBackgroundProfileContainer,
          nameStyle: TextStyleConstant.darkNameProfileContainer,
          mailStyle: TextStyleConstant.darkMailProfileContainer
        ),
        const ChallengeMushroomsListTheme(
          backgroundColor: ColorConstant.darkBackgroundChallengeMushroomsList,
          titleStyle: TextStyleConstant.darkTitleChallengeMushroomsList,
          titleItemStyle: TextStyleConstant.darkTitleItemChallengeMushroomsList
        ),
        const TextInputTheme(
          titleStyle: TextStyleConstant.darkTitleTextInput,
          placeHolderStyle: TextStyleConstant.darkPlaceHolderTextInput,
          inputStyle: TextStyleConstant.darkInputTextInput
        ),
        const TextInputPolicyTheme(
            policyStyle: TextStyleConstant.darkPolicyTextInputPolicy
        ),
        const TextOutputTheme(
          bodyStyle: TextStyleConstant.darkBodyTextOutput,
          smallTitleStyle: TextStyleConstant.darkSmallTitleTextOutput,
          mediumTitleStyle: TextStyleConstant.darkMediumTitleTextOutput,
          largeTitleStyle: TextStyleConstant.darkLargeTitleTextOutput,
        )
      ]
  );
}
