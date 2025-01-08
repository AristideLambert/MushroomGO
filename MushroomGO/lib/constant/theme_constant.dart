import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mushroom_go/constant/text_style_constant.dart';
import 'package:mushroom_go/theme/badge_tab_theme.dart';
import 'package:mushroom_go/theme/challenge_missions_list_theme.dart';
import 'package:mushroom_go/theme/button_setting_container_theme.dart';
import 'package:mushroom_go/theme/button_setting_theme.dart';
import 'package:mushroom_go/theme/button_standard_theme.dart';
import 'package:mushroom_go/theme/challenge_mushrooms_list_theme.dart';
import 'package:mushroom_go/theme/history_tab_theme.dart';
import 'package:mushroom_go/theme/home_for_you_list_theme.dart';
import 'package:mushroom_go/theme/home_news_list_theme.dart';
import 'package:mushroom_go/theme/mushroom_detail_theme.dart';
import 'package:mushroom_go/theme/navigation_tab_bottom_theme.dart';
import 'package:mushroom_go/theme/navigation_tab_top_theme.dart';
import 'package:mushroom_go/theme/profile_container_theme.dart';
import 'package:mushroom_go/theme/search_result_theme.dart';
import 'package:mushroom_go/theme/loading_container_theme.dart';
import 'package:mushroom_go/theme/text_input_policy_theme.dart';
import 'package:mushroom_go/theme/text_input_theme.dart';
import 'package:mushroom_go/theme/text_output_theme.dart';
import 'color_constant.dart';

class ThemeConstant{
  // Default
  static ThemeData lightTheme = ThemeData(
    primaryColor: ColorConstant.primaryColor,
    scaffoldBackgroundColor: CupertinoColors.lightBackgroundGray,
    brightness: Brightness.light,
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
      selectionColor: ColorConstant.primaryColor.withValues(alpha: 0.3)
    ),
    cupertinoOverrideTheme: const CupertinoThemeData(
      brightness: Brightness.light,
      primaryColor: ColorConstant.primaryColor
    )
  ).copyWith(
    extensions: [
      const LoadingContainerTheme(
        backgroundColor: ColorConstant.lightBackgroundLoadingContainer,
        iconColor: ColorConstant.lightIconLoadingContainer,
        titleStyle: TextStyleConstant.lightTitleLoadingContainer
      ),
      const ButtonStandardTheme(
        titleStyle: TextStyleConstant.lightTitleButtonStandard
      ),
      const ButtonSettingTheme(
        leftIconColor: ColorConstant.lightLeftIconButtonSetting,
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
      const ChallengeMissionListTheme(
        cardBackgroundColor: ColorConstant.lightBackgroundChallengeMissionsList,
        progressBarBackgroundColor: ColorConstant.lightProgressBarBackgroundChallengeMissionsList,
        progressBarForegroundColor: ColorConstant.lightProgressBarForegroundChallengeMissionsList,
        titleStyle: TextStyleConstant.lightTitleChallengeMissionsList,
        descriptionStyle: TextStyleConstant.lightDescriptionChallengeMissionsList,
        progressTextStyle: TextStyleConstant.lightProgressTextChallengeMissionsList,
      ),
      const HomeNewsListTheme(
        titleStyle: TextStyleConstant.lightTitleHomeNewsList,
        cardBackgroundColor: ColorConstant.lightBackgroundHomeNewsList
      ),
      const HomeForYouListTheme(
        backgroundColor: ColorConstant.lightBackgroundHomeForYou,
        titleStyle: TextStyleConstant.lightTitleHomeForYouList,
        titleItemStyle: TextStyleConstant.lightTitleItemHomeForYouList
      ),
      const MushroomDetailTheme(
        backgroundColor: ColorConstant.lightBackgroundMushroomDetail,
        titleStyle: TextStyleConstant.lightTitleMushroomDetail,
        textStyle: TextStyleConstant.lightTextMushroomDetail,
        nameStyle: TextStyleConstant.lightNameMushroomDetail,
        scientificName: TextStyleConstant.lightScientificNameMushroomDetail
      ),
      const BadgeTabTheme(
        textStyle: TextStyleConstant.lightTextBadgeTab,
        titleStyle: TextStyleConstant.lightTitleBadgeTab,
        descriptionStyle: TextStyleConstant.lightDescriptionBadgeTab,
      ),
      const HistoryTabTheme(
        textStyle: TextStyleConstant.lightTextHistoryTab,
        titleStyle: TextStyleConstant.lightTitleHistoryTab,
        cardBackgroundColor: ColorConstant.lightBackgroundHistoryTab
      ),
      const SearchResultTheme(
        titleStyle: TextStyleConstant.lightTitleSearchResultPage
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
        captionStyle: TextStyleConstant.lightCaptionTextOutput,
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
    brightness: Brightness.dark,
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
      selectionColor: ColorConstant.primaryColor.withValues(alpha: 0.3)
    ),
    cupertinoOverrideTheme: const CupertinoThemeData(
      brightness: Brightness.dark,
      primaryColor: ColorConstant.primaryColor
    )
  ).copyWith(
    extensions: [
      const LoadingContainerTheme(
        backgroundColor: ColorConstant.darkBackgroundLoadingContainer,
        iconColor: ColorConstant.darkIconLoadingContainer,
        titleStyle: TextStyleConstant.darkTitleLoadingContainer
      ),
      const ButtonStandardTheme(
        titleStyle: TextStyleConstant.darkTitleButtonStandard
      ),
      const ButtonSettingTheme(
        leftIconColor: ColorConstant.darkLeftIconButtonSetting,
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
        mailStyle: TextStyleConstant.darkMailProfileContainer,
      ),
      const ChallengeMushroomsListTheme(
        backgroundColor: ColorConstant.darkBackgroundChallengeMushroomsList,
        titleStyle: TextStyleConstant.darkTitleChallengeMushroomsList,
        titleItemStyle: TextStyleConstant.darkTitleItemChallengeMushroomsList
      ),
      const ChallengeMissionListTheme(
        cardBackgroundColor: ColorConstant.darkBackgroundChallengeMissionsList,
        progressBarBackgroundColor: ColorConstant.darkProgressBarBackgroundChallengeMissionsList,
        progressBarForegroundColor: ColorConstant.darkProgressBarForegroundChallengeMissionsList,
        titleStyle: TextStyleConstant.darkTitleChallengeMissionsList,
        descriptionStyle: TextStyleConstant.darkDescriptionChallengeMissionsList,
        progressTextStyle: TextStyleConstant.darkProgressTextChallengeMissionsList,
      ),
      const HomeNewsListTheme(
        titleStyle: TextStyleConstant.darkTitleHomeNewsList,
        cardBackgroundColor: ColorConstant.darkBackgroundHomeNewsList
      ),
      const HomeForYouListTheme(
        backgroundColor: ColorConstant.darkBackgroundHomeForYou,
        titleStyle: TextStyleConstant.darkTitleHomeForYouList,
        titleItemStyle: TextStyleConstant.darkTitleItemHomeForYouList
      ),
      const MushroomDetailTheme(
        backgroundColor: ColorConstant.darkBackgroundMushroomDetail,
        titleStyle: TextStyleConstant.darkTitleMushroomDetail,
        textStyle: TextStyleConstant.darkTextMushroomDetail,
        nameStyle: TextStyleConstant.darkNameMushroomDetail,
        scientificName: TextStyleConstant.darkScientificNameMushroomDetail
      ),
      const BadgeTabTheme(
        textStyle: TextStyleConstant.darkTextBadgeTab,
        titleStyle: TextStyleConstant.darkTitleBadgeTab,
        descriptionStyle: TextStyleConstant.darkDescriptionBadgeTab,
      ),
      const HistoryTabTheme(
        textStyle: TextStyleConstant.darkTextHistoryTab,
        titleStyle: TextStyleConstant.darkTitleHistoryTab,
        cardBackgroundColor: ColorConstant.darkBackgroundHistoryTab
      ),
      const SearchResultTheme(
        titleStyle: TextStyleConstant.darkTitleSearchResultPage
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
        captionStyle: TextStyleConstant.darkCaptionTextOutput,
        bodyStyle: TextStyleConstant.darkBodyTextOutput,
        smallTitleStyle: TextStyleConstant.darkSmallTitleTextOutput,
        mediumTitleStyle: TextStyleConstant.darkMediumTitleTextOutput,
        largeTitleStyle: TextStyleConstant.darkLargeTitleTextOutput,
      )
    ]
  );
}
