import 'package:flutter/material.dart';
import 'color_constant.dart';
import 'dimension_constant.dart';

class TextStyleConstant {
  // Default

  // Home
  static const TextStyle tabBarLabelStyleHome = TextStyle(
    fontSize: DimensionConstant.titleSmall,
    fontWeight: FontWeight.w800,
  );
  static const TextStyle tabBarUnselectedLabelStyleHome = TextStyle(
    fontSize: DimensionConstant.titleSmall,
    fontWeight: FontWeight.normal,
    color: Colors.white
  );

  // NavigationTabBottom
  static const TextStyle lightTitleSelectedNavigationTabBottom = TextStyle(
    fontSize: DimensionConstant.menuText,
    color: ColorConstant.primaryColor,
  );
  static const TextStyle darkTitleSelectedNavigationTabBottom = TextStyle(
    fontSize: DimensionConstant.menuText,
    color: ColorConstant.primaryColor,
  );
  static const TextStyle lightTitleUnselectedNavigationTabBottom = TextStyle(
    fontSize: DimensionConstant.menuText,
    color: ColorConstant.lightUnselectedNavigationTabBottom,
  );
  static const TextStyle darkTitleUnselectedNavigationTabBottom = TextStyle(
    fontSize: DimensionConstant.menuText,
    color: ColorConstant.darkUnselectedNavigationTabBottom,
  );

  // NavigationTabTop
  static const TextStyle lightTitleSelectedNavigationTabTop = TextStyle(
    fontSize: DimensionConstant.titleSmall,
    fontWeight: FontWeight.w800,
    color: ColorConstant.primaryColor,
  );
  static const TextStyle darkTitleSelectedNavigationTabTop = TextStyle(
    fontSize: DimensionConstant.titleSmall,
    fontWeight: FontWeight.w800,
    color: ColorConstant.primaryColor,
  );
  static const TextStyle lightTitleUnselectedNavigationTabTop = TextStyle(
    fontSize: DimensionConstant.titleSmall,
    fontWeight: FontWeight.normal,
    color: ColorConstant.lightUnselectedNavigationTabTop,
  );
  static const TextStyle darkTitleUnselectedNavigationTabTop = TextStyle(
    fontSize: DimensionConstant.titleSmall,
    fontWeight: FontWeight.normal,
    color: ColorConstant.darkUnselectedNavigationTabTop,
  );

  // ButtonStandard
  static const TextStyle lightTitleButtonStandard = TextStyle(
    color: ColorConstant.lightTitleButtonStandard,
    fontSize: DimensionConstant.titleSmall,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle darkTitleButtonStandard = TextStyle(
    color: ColorConstant.darkTitleButtonStandard,
    fontSize: DimensionConstant.titleSmall,
    fontWeight: FontWeight.w700,
  );

  // ButtonSetting
  static const TextStyle lightTitleButtonSetting = TextStyle(
    color: ColorConstant.lightTitleButtonSetting,
    fontSize: DimensionConstant.titleSmall,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle darkTitleButtonSetting = TextStyle(
    color: ColorConstant.darkTitleButtonSetting,
    fontSize: DimensionConstant.titleSmall,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle lightTitleButtonButtonSetting = TextStyle(
    color: ColorConstant.lightTitleButtonButtonSetting,
    fontSize: DimensionConstant.titleSmall,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle darkTitleButtonButtonSetting = TextStyle(
    color: ColorConstant.darkTitleButtonButtonSetting,
    fontSize: DimensionConstant.titleSmall,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle lightDataButtonSetting = TextStyle(
    fontSize: DimensionConstant.titleSmall,
    color: ColorConstant.lightDataButtonSetting,
  );
  static const TextStyle darkDataButtonSetting = TextStyle(
    fontSize: DimensionConstant.titleSmall,
    color: ColorConstant.darkDataButtonSetting,
  );
  // ButtonSetting - AccountSettingPage
  static const TextStyle titleButtonButtonSettingAccountSettingPage = TextStyle(
    color: ColorConstant.warningColor,
    fontSize: DimensionConstant.titleSmall,
    fontWeight: FontWeight.w500,
  );

  // ButtonSettingContainer
  static const TextStyle lightTitleButtonSettingContainer = TextStyle(
    color: ColorConstant.lightTitleButtonSettingContainer,
    fontSize: DimensionConstant.titleMedium,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle darkTitleButtonSettingContainer = TextStyle(
    color: ColorConstant.darkTitleButtonSettingContainer,
    fontSize: DimensionConstant.titleMedium,
    fontWeight: FontWeight.bold,
  );

  // ProfileContainer
  static const TextStyle lightNameProfileContainer = TextStyle(
    color: ColorConstant.lightNameProfileContainer,
    fontSize: DimensionConstant.titleLarge,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle darkNameProfileContainer = TextStyle(
    color: ColorConstant.darkNameProfileContainer,
    fontSize: DimensionConstant.titleLarge,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle lightMailProfileContainer = TextStyle(
    color: ColorConstant.lightMailProfileContainer,
    fontSize: DimensionConstant.titleSmall,
  );
  static const TextStyle darkMailProfileContainer = TextStyle(
    color: ColorConstant.darkMailProfileContainer,
    fontSize: DimensionConstant.titleSmall,
  );

  // ChallengeMushroomsList
  static const TextStyle lightTitleChallengeMushroomsList = TextStyle(
    color: ColorConstant.lightTitleChallengeMushroomsList,
    fontSize: DimensionConstant.titleMedium,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle darkTitleChallengeMushroomsList = TextStyle(
    color: ColorConstant.darkTitleChallengeMushroomsList,
    fontSize: DimensionConstant.titleMedium,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle lightTitleItemChallengeMushroomsList = TextStyle(
    color: ColorConstant.lightTitleItemChallengeMushroomsList,
    fontSize: DimensionConstant.bodyText,
  );
  static const TextStyle darkTitleItemChallengeMushroomsList = TextStyle(
    color: ColorConstant.darkTitleItemChallengeMushroomsList,
    fontSize: DimensionConstant.bodyText,
  );

  // ChallengeMissionsList
  static const TextStyle lightTitleChallengeMissionsList = TextStyle(
    color: ColorConstant.lightTitleChallengeMissionsList,
    fontSize: DimensionConstant.titleMedium,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle darkTitleChallengeMissionsList = TextStyle(
    color: ColorConstant.darkTitleChallengeMissionsList,
    fontSize: DimensionConstant.titleMedium,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle lightProgressTextChallengeMissionsList = TextStyle(
    fontSize: DimensionConstant.captionText,
    color: ColorConstant.lightProgressTextChallengeMissionsList,
  );
  static const TextStyle darkProgressTextChallengeMissionsList = TextStyle(
    fontSize: DimensionConstant.captionText,
    color: ColorConstant.darkProgressTextChallengeMissionsList,
  );
  static const TextStyle lightDescriptionChallengeMissionsList = TextStyle(
    fontSize: DimensionConstant.bodyText,
    color: ColorConstant.lightItemChallengeMissionsList,
  );
  static const TextStyle darkDescriptionChallengeMissionsList = TextStyle(
    fontSize: DimensionConstant.bodyText,
    color: ColorConstant.darkItemChallengeMissionsList,
  );

  // HomeNewsList
  static const TextStyle lightTitleHomeNewsList = TextStyle(
    color: ColorConstant.lightTitleHomeNewsList,
    fontSize: DimensionConstant.titleSmall,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle darkTitleHomeNewsList = TextStyle(
    color: ColorConstant.darkTitleHomeNewsList,
    fontSize: DimensionConstant.titleSmall,
    fontWeight: FontWeight.bold,
  );


}