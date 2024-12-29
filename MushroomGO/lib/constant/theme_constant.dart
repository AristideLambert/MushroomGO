import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mushroom_go/constant/text_style_constant.dart';
import 'package:mushroom_go/theme/badge_tab_theme.dart';
import 'package:mushroom_go/theme/challenge_missions_list_theme.dart';
import 'package:mushroom_go/theme/button_setting_container_theme.dart';
import 'package:mushroom_go/theme/button_setting_theme.dart';
import 'package:mushroom_go/theme/button_standard_theme.dart';
import 'package:mushroom_go/theme/challenge_mushrooms_list_theme.dart';
import 'package:mushroom_go/theme/home_for_you_list_theme.dart';
import 'package:mushroom_go/theme/home_news_list_theme.dart';
import 'package:mushroom_go/theme/mushroom_detail_theme.dart';
import 'package:mushroom_go/theme/navigation_tab_bottom_theme.dart';
import 'package:mushroom_go/theme/navigation_tab_top_theme.dart';
import 'package:mushroom_go/theme/profile_container_theme.dart';
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
        mailStyle: TextStyleConstant.lightMailProfileContainer,
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
        )
      ]
  );
}
