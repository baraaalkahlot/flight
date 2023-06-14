import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_dimen.dart';

extension TextStyleExtension on TextStyle {
  ///  Text Styles

  /// Small Size -- <10 , 12>
  static const TextStyle tinyRegularTextStyle = TextStyle(
      fontSize: AppDimen.fontTiny, fontWeight: AppDimen.weightRegular);

  static const TextStyle smallRegularTextStyle = TextStyle(
      fontSize: AppDimen.fontSmall, fontWeight: AppDimen.weightRegular);

  static const TextStyle smallBoldTextStyle =
      TextStyle(fontSize: AppDimen.fontSmall, fontWeight: AppDimen.weightBold);

  static const TextStyle smallMedTextStyle = TextStyle(
      fontSize: AppDimen.fontSmall, fontWeight: AppDimen.weightMedium);

  /// Medium Size -- <13 , 14>
  static const TextStyle medSmallRegularTextStyle = TextStyle(
      fontSize: AppDimen.fontMedSmall, fontWeight: AppDimen.weightRegular);

  static const TextStyle medSmallMediumTextStyle = TextStyle(
      fontSize: AppDimen.fontMedSmall, fontWeight: AppDimen.weightMedium);

  static const TextStyle medRegularTextStyle = TextStyle(
      fontSize: AppDimen.fontMedium, fontWeight: AppDimen.weightRegular);

  static const TextStyle medTextStyle = TextStyle(
      fontSize: AppDimen.fontMedium, fontWeight: AppDimen.weightMedium);

  static const TextStyle medSemiBoldTextStyle = TextStyle(
      fontSize: AppDimen.fontMedium, fontWeight: AppDimen.weightSemiBold);

  /// Medium Plus Size -- <15>
  static const TextStyle medPlusRegularTextStyle = TextStyle(
      fontSize: AppDimen.fontMediumPlus, fontWeight: AppDimen.weightRegular);
  static const TextStyle medPlusTextStyle = TextStyle(
      fontSize: AppDimen.fontMediumPlus, fontWeight: AppDimen.weightMedium);

  /// Normal Size -- <16>
  static const TextStyle normalTextStyle = TextStyle(
      fontSize: AppDimen.fontNormal, fontWeight: AppDimen.weightRegular);

  static const TextStyle normalMedTextStyle = TextStyle(
      fontSize: AppDimen.fontNormal, fontWeight: AppDimen.weightMedium);

  static const TextStyle normalSemiBoldTextStyle = TextStyle(
      fontSize: AppDimen.fontNormal, fontWeight: AppDimen.weightSemiBold);

  /// Big Size -- <18>
  static const TextStyle bigMedTextStyle =
      TextStyle(fontSize: AppDimen.fontBig, fontWeight: AppDimen.weightMedium);

  static const TextStyle bigSemiBoldTextStyle = TextStyle(
      fontSize: AppDimen.fontBig, fontWeight: AppDimen.weightSemiBold);

  /// Large Size -- <20>
  static const TextStyle largeRegularTextStyle = TextStyle(
      fontSize: AppDimen.fontLarge, fontWeight: AppDimen.weightRegular);

  static const TextStyle largeMedTextStyle = TextStyle(
      fontSize: AppDimen.fontLarge, fontWeight: AppDimen.weightMedium);

  static const TextStyle largeSemiBoldTextStyle = TextStyle(
      fontSize: AppDimen.fontLarge, fontWeight: AppDimen.weightSemiBold);

  /// Larger Size -- <24 , 30 , 32>
  static const TextStyle largerMedTextStyle = TextStyle(
      fontSize: AppDimen.fontLarger, fontWeight: AppDimen.weightMedium);

  static const TextStyle hugeSemiBoldTextStyle = TextStyle(
      fontSize: AppDimen.fontHuge, fontWeight: AppDimen.weightSemiBold);

  static const TextStyle jumboSemiBoldTextStyle = TextStyle(
      fontSize: AppDimen.fontJumbo, fontWeight: AppDimen.weightSemiBold);

  ///  Custom Text Styles
  ///
  static TextStyle titleLabelStyles =
      hugeSemiBoldTextStyle.copyWith(color: AppColors.mineShaft);

  static TextStyle subTitleLabelStyles =
      normalTextStyle.copyWith(color: AppColors.boulder);

  static TextStyle screenTitleLabelStyles =
      largerMedTextStyle.copyWith(color: AppColors.ebonyClay);

  static TextStyle screenSubTitleLabelStyles =
      normalTextStyle.copyWith(color: AppColors.santasGray);

  static TextStyle inputLabelStyles =
      medRegularTextStyle.copyWith(color: AppColors.mineShaft);

  static TextStyle hintLabelStyles =
      medRegularTextStyle.copyWith(color: AppColors.boulder);
}

extension WidgetStyleExtension on Widget {
  ///  Widget Styles
  ///

  // Choice Chip Date Picker
  static ChipThemeData dateChipTheme(BuildContext context) {
    return ChipTheme.of(context).copyWith(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: AppColors.selago),
        //the outline color
        borderRadius: BorderRadius.circular(AppDimen.sizeSmallCardCorner),
      ),
      backgroundColor: AppColors.romance,
      secondaryLabelStyle: TextStyleExtension.medRegularTextStyle
          .copyWith(color: AppColors.romance),
      selectedColor: AppColors.primaryColor,
      labelStyle: TextStyleExtension.medRegularTextStyle
          .copyWith(color: AppColors.ebonyClay),
    );
  }

  // Choice Chip Date Picker
  static ChipThemeData timeChipTheme(BuildContext context) {
    return ChipTheme.of(context).copyWith(
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.dawnPink),
          //the outline color
          borderRadius: BorderRadius.circular(AppDimen.sizeSmallCardCorner)),
      backgroundColor: AppColors.romance,
      labelStyle: TextStyleExtension.smallRegularTextStyle
          .copyWith(color: AppColors.santasGray),
      secondaryLabelStyle: TextStyleExtension.medRegularTextStyle
          .copyWith(color: AppColors.romance),
      selectedColor: AppColors.heliotrope,
    );
  }

  //  Outlined Input Field Decoration
  static InputDecoration outlinedInputDecoration = InputDecoration(
    floatingLabelBehavior: FloatingLabelBehavior.never,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(
        color: AppColors.dawnPink,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(
        color: AppColors.primaryColor,
      ),
    ),
  );

  //  Filled Input Field Decoration
  static InputDecoration filledInputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(
        color: AppColors.dawnPink,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(
        color: AppColors.dawnPink,
      ),
    ),
    filled: true,
    fillColor: AppColors.white,
  );

  // Check Input Field Decoration
  static InputDecoration checkInputDecoration({
    required BuildContext context,
    required VoidCallback onPressed,
    required bool isActivated,
    Color backgroundColor = AppColors.heliotrope,
    Color activatedColor = AppColors.pastelGreen,
  }) {
    return InputDecoration(
      suffixIcon: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isActivated ? activatedColor : backgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimen.sizeButtonCorner)),
        ),
        child: isActivated
            ? const Icon(
                Icons.check,
                color: AppColors.white,
              )
            : Text(
                "Check",
              ),
      ),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: AppDimen.spacingLarge),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          color: AppColors.dawnPink,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          color: AppColors.dawnPink,
        ),
      ),
      filled: true,
      fillColor: AppColors.white,
    );
  }
}
