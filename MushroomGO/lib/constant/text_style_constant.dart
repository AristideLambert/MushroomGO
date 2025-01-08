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

  // LoadingContainer
  static const TextStyle lightTitleLoadingContainer = TextStyle(
    fontSize: DimensionConstant.bodyText,
    fontWeight: FontWeight.normal,
    color: ColorConstant.lightTitleLoadingContainer,
    decoration: TextDecoration.none,
  );
  static const TextStyle darkTitleLoadingContainer = TextStyle(
    fontSize: DimensionConstant.bodyText,
    fontWeight: FontWeight.normal,
    color: ColorConstant.darkTitleLoadingContainer,
    decoration: TextDecoration.none,
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
  static const TextStyle destructibleTitleButtonButtonSetting = TextStyle(
    color: ColorConstant.destructibleTitleButtonButtonSetting,
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

  // HomeForYouList
  static const TextStyle lightTitleHomeForYouList = TextStyle(
    color: ColorConstant.lightTitleChallengeMushroomsList,
    fontSize: DimensionConstant.titleMedium,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle darkTitleHomeForYouList = TextStyle(
    color: ColorConstant.darkTitleChallengeMushroomsList,
    fontSize: DimensionConstant.titleMedium,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle lightTitleItemHomeForYouList = TextStyle(
    color: ColorConstant.lightTitleItemChallengeMushroomsList,
    fontSize: DimensionConstant.bodyText,
  );
  static const TextStyle darkTitleItemHomeForYouList = TextStyle(
    color: ColorConstant.darkTitleItemChallengeMushroomsList,
    fontSize: DimensionConstant.bodyText,
  );
  static const TextStyle lightItemStyleHomeNewsList = TextStyle(
    color: ColorConstant.lightItemHomeForYou,
    fontSize: DimensionConstant.titleSmall,
    fontWeight: FontWeight.bold,
  );
  // MushroomDetail
  static const TextStyle lightNameMushroomDetail = TextStyle(
    color: ColorConstant.lightNameMushroomDetail,
    fontSize: DimensionConstant.titleMedium,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle darkNameMushroomDetail = TextStyle(
    color: ColorConstant.darkNameMushroomDetail,
    fontSize: DimensionConstant.titleMedium,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle scientificNameTextMushroomDetail = TextStyle(
    color: ColorConstant.primaryColor,
    fontSize: DimensionConstant.bodyText
  );

  static const TextStyle lightScientificNameMushroomDetail = TextStyle(
      color: ColorConstant.lightNameMushroomDetail,
      fontSize: DimensionConstant.bodyText,
      fontStyle: FontStyle.italic
  );

  static const TextStyle darkScientificNameMushroomDetail = TextStyle(
      color: ColorConstant.darkNameMushroomDetail,
      fontSize: DimensionConstant.bodyText,
      fontStyle: FontStyle.italic
  );
  static const TextStyle lightTitleMushroomDetail = TextStyle(
    color: ColorConstant.lightNameMushroomDetail,
    fontSize: DimensionConstant.titleSmall,
    fontWeight: FontWeight.bold
  );
  static const TextStyle darkTitleMushroomDetail = TextStyle(
    color: ColorConstant.darkNameMushroomDetail,
    fontSize: DimensionConstant.titleSmall,
    fontWeight: FontWeight.bold
  );
  static const TextStyle lightTextMushroomDetail = TextStyle(
      color: ColorConstant.lightNameMushroomDetail,
      fontSize: DimensionConstant.bodyText,
  );
  static const TextStyle darkTextMushroomDetail = TextStyle(
    color: ColorConstant.darkNameMushroomDetail,
    fontSize: DimensionConstant.bodyText,
  );

  // BadgeTab
  static const TextStyle darkTextBadgeTab = TextStyle(
    color: ColorConstant.darkTextBadgeTab,
    fontSize: DimensionConstant.bodyText,
  );
  static const TextStyle lightTextBadgeTab = TextStyle(
    color: ColorConstant.lightTextBadgeTab,
    fontSize: DimensionConstant.bodyText,
  );
  static const TextStyle textDateBadgeTab = TextStyle(
    color: ColorConstant.primaryColor,
    fontSize: DimensionConstant.bodyText,
  );
  static const TextStyle darkTitleBadgeTab = TextStyle(
    color: ColorConstant.darkTextBadgeTab,
    fontSize: DimensionConstant.titleLarge,
    fontWeight: FontWeight.bold
  );
  static const TextStyle lightTitleBadgeTab = TextStyle(
    color: ColorConstant.lightTextBadgeTab,
    fontSize: DimensionConstant.titleLarge,
    fontWeight: FontWeight.bold
  );
  static const TextStyle darkDescriptionBadgeTab = TextStyle(
    color: ColorConstant.darkTextBadgeTab,
    fontSize: DimensionConstant.titleSmall,
  );
  static const TextStyle lightDescriptionBadgeTab = TextStyle(
    color: ColorConstant.lightTextBadgeTab,
    fontSize: DimensionConstant.titleSmall,
  );

// HistoryTab
  static const TextStyle darkTitleHistoryTab = TextStyle(
      color: ColorConstant.darkTextHistoryTab,
      fontSize: DimensionConstant.titleMedium,
      fontWeight: FontWeight.bold
  );
  static const TextStyle lightTitleHistoryTab = TextStyle(
      color: ColorConstant.lightTextHistoryTab,
      fontSize: DimensionConstant.titleMedium,
      fontWeight: FontWeight.bold
  );
  static const TextStyle textDateHistoryTab = TextStyle(
    color: ColorConstant.primaryColor,
    fontSize: DimensionConstant.bodyText,
  );
  static const TextStyle darkTextHistoryTab = TextStyle(
    color: ColorConstant.darkTextHistoryTab,
    fontSize: DimensionConstant.bodyText,
  );
  static const TextStyle lightTextHistoryTab = TextStyle(
    color: ColorConstant.lightTextHistoryTab,
    fontSize: DimensionConstant.bodyText,
    fontWeight: FontWeight.bold
  );
  // SearchResultPage
  static const TextStyle darkTitleSearchResultPage = TextStyle(
      color: ColorConstant.darkTextSearchResultPage,
      fontSize: DimensionConstant.titleSmall,
      fontWeight: FontWeight.bold
  );
  static const TextStyle lightTitleSearchResultPage = TextStyle(
      color: ColorConstant.lightTextSearchResultPage,
      fontSize: DimensionConstant.titleSmall,
      fontWeight: FontWeight.bold
  );
  static const TextStyle scientificNameSearchResultPage = TextStyle(
      color: ColorConstant.primaryColor,
      fontSize: DimensionConstant.bodyText,
      fontStyle: FontStyle.italic
  );

  // TextInput
  static const TextStyle lightTitleTextInput = TextStyle(
    color: ColorConstant.lightTitleTextInput,
    fontSize: DimensionConstant.bodyText,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle darkTitleTextInput = TextStyle(
    color: ColorConstant.darkTitleTextInput,
    fontSize: DimensionConstant.bodyText,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle lightPlaceHolderTextInput = TextStyle(
    color: ColorConstant.lightPlaceHolderTextInput,
    fontSize: DimensionConstant.bodyText,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle darkPlaceHolderTextInput = TextStyle(
    color: ColorConstant.darkPlaceHolderTextInput,
    fontSize: DimensionConstant.bodyText,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle lightInputTextInput = TextStyle(
    color: ColorConstant.lightInputTextInput,
    fontSize: DimensionConstant.bodyText,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle darkInputTextInput = TextStyle(
    color: ColorConstant.darkInputTextInput,
    fontSize: DimensionConstant.bodyText,
    fontWeight: FontWeight.normal,
  );

  // TextInputPolicy
  static const TextStyle lightPolicyTextInputPolicy = TextStyle(
    color: ColorConstant.lightPolicyTextInputPolicy,
    fontSize: DimensionConstant.captionText,
  );
  static const TextStyle darkPolicyTextInputPolicy = TextStyle(
    color: ColorConstant.darkPolicyTextInputPolicy,
    fontSize: DimensionConstant.captionText,
  );

  // TextOutput
  static const TextStyle lightCaptionTextOutput = TextStyle(
    color: ColorConstant.lightTextOutput,
    fontSize: DimensionConstant.captionText,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle darkCaptionTextOutput = TextStyle(
    color: ColorConstant.darkTextOutput,
    fontSize: DimensionConstant.captionText,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle lightBodyTextOutput = TextStyle(
    color: ColorConstant.lightTextOutput,
    fontSize: DimensionConstant.bodyText,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle darkBodyTextOutput = TextStyle(
    color: ColorConstant.darkTextOutput,
    fontSize: DimensionConstant.bodyText,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle lightSmallTitleTextOutput = TextStyle(
    color: ColorConstant.lightTextOutput,
    fontSize: DimensionConstant.titleSmall,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle darkSmallTitleTextOutput = TextStyle(
    color: ColorConstant.darkTextOutput,
    fontSize: DimensionConstant.titleSmall,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle lightMediumTitleTextOutput = TextStyle(
    color: ColorConstant.lightTextOutput,
    fontSize: DimensionConstant.titleMedium,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle darkMediumTitleTextOutput = TextStyle(
    color: ColorConstant.darkTextOutput,
    fontSize: DimensionConstant.titleMedium,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle lightLargeTitleTextOutput = TextStyle(
    color: ColorConstant.lightTextOutput,
    fontSize: DimensionConstant.titleLarge,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle darkLargeTitleTextOutput = TextStyle(
    color: ColorConstant.darkTextOutput,
    fontSize: DimensionConstant.titleLarge,
    fontWeight: FontWeight.bold,
  );
}