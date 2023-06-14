import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_dimen.dart';
import '../../constants/assets_path.dart';
import '../helper/app_helpers.dart';
import 'app_styles.dart';

///All the custom UI widgets like an input text box with search icon, autocomplete widgets,
///Error message banners, custom checkbox chips related utils can be present in this file
///and will be used thought the application.

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final double width;
  final Color backgroundColor;
  final Color borderColor;
  final String? iconPath;
  final Color labelColor;
  final TextStyle labelStyle;

  const PrimaryButton(
    BuildContext context, {
    Key? key,
    required this.label,
    required this.onPressed,
    this.width = double.infinity,
    this.iconPath,
    this.backgroundColor = AppColors.primaryColor,
    this.borderColor = AppColors.primaryColor,
    this.labelColor = AppColors.romance,
    this.labelStyle = TextStyleExtension.normalMedTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, AppDimen.buttonHeightNormal),
        backgroundColor: backgroundColor,
        side: BorderSide(width: AppDimen.sizeButtonBorder, color: borderColor),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimen.sizeButtonCorner)),
      ),
      onPressed: onPressed,
      child: Text(
        textAlign: TextAlign.center,
        label,
        style: labelStyle.copyWith(color: labelColor),
      ),
    );
  }
}

class IconPrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final String iconPath;
  final double width;
  final Color backgroundColor;
  final Color borderColor;
  final Color labelColor;
  final TextStyle labelStyle;
  final double? assetRadius;

  const IconPrimaryButton(
    BuildContext context, {
    Key? key,
    required this.label,
    required this.onPressed,
    required this.iconPath,
    this.width = double.infinity,
    this.backgroundColor = AppColors.primaryColor,
    this.borderColor = AppColors.primaryColor,
    this.labelColor = AppColors.romance,
    this.labelStyle = TextStyleExtension.normalMedTextStyle,
    this.assetRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: SvgPicture.asset(
        iconPath,
        fit: BoxFit.contain,
        width: assetRadius,
        height: assetRadius,
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, AppDimen.buttonHeightNormal),
        backgroundColor: backgroundColor,
        side: BorderSide(width: AppDimen.sizeButtonBorder, color: borderColor),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimen.sizeButtonCorner)),
      ),
      onPressed: onPressed,
      label: Text(
        textAlign: TextAlign.center,
        label,
        style: labelStyle.copyWith(color: labelColor),
      ),
    );
  }
}

class IconOutlineButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double width;
  final Color borderColor;
  final String iconPath;
  final TextStyle labelStyle;

  const IconOutlineButton(
    BuildContext context, {
    Key? key,
    required this.label,
    required this.onPressed,
    required this.iconPath,
    this.width = double.infinity,
    this.borderColor = AppColors.amaranth,
    this.labelStyle = TextStyleExtension.normalMedTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon: SvgPicture.asset(iconPath),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.amaranth,
        minimumSize: Size(width, AppDimen.buttonHeightNormal),
        backgroundColor: AppColors.athensGray.withOpacity(.7),
        side: BorderSide(width: AppDimen.sizeButtonBorder, color: borderColor),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimen.sizeButtonCorner)),
      ),
      onPressed: onPressed,
      label: Text(
        label,
        style: labelStyle.copyWith(color: borderColor),
      ),
    );
  }
}

class OutlineButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final double width;
  final Color borderColor;
  final TextStyle labelStyle;

  const OutlineButton(
    BuildContext context, {
    Key? key,
    required this.label,
    required this.onPressed,
    this.width = double.infinity,
    this.borderColor = AppColors.primaryColor,
    this.labelStyle = TextStyleExtension.smallRegularTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: Size(width, AppDimen.buttonHeightSmall),
        side: BorderSide(width: AppDimen.sizeButtonBorder, color: borderColor),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimen.sizeButtonCorner)),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: labelStyle.copyWith(color: borderColor),
      ),
    );
  }
}

class MeltedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;

  const MeltedButton({Key? key, required this.onPressed, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed?.call();
      },
      child: Container(
        alignment: Alignment.center,
        constraints: const BoxConstraints(
          minWidth: double.infinity,
          minHeight: AppDimen.buttonHeightNormal,
        ),
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(AppDimen.sizeDialogCorner),
              bottomRight: Radius.circular(AppDimen.sizeDialogCorner)),
        ),
        child: Text(
          label,
          style: TextStyleExtension.normalMedTextStyle
              .copyWith(color: AppColors.romance),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class AppSwitchBtn extends StatelessWidget {
  final String label;
  final String assetPath;
  final Color color;
  final ValueChanged<bool> onChanged;
  final bool defaultValue;

  const AppSwitchBtn({
    Key? key,
    required this.label,
    required this.assetPath,
    this.color = AppColors.romance,
    required this.onChanged,
    required this.defaultValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppDimen.zero,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimen.sizeSmallCardCorner),
      ),
      child: Container(
        constraints: const BoxConstraints(
          minWidth: double.infinity,
          minHeight: AppDimen.sizeSwitchBoxHeight,
        ),
        color: color,
        padding: const EdgeInsets.all(AppDimen.spacingMedPlus),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Text(
                label,
                softWrap: false,
                textAlign: TextAlign.start,
                style: TextStyleExtension.medRegularTextStyle
                    .copyWith(color: AppColors.ebonyClay),
              ),
            ),
            Switch(
              value: defaultValue,
              onChanged: onChanged,
              activeColor: AppColors.primaryColor,
            )
          ],
        ),
      ),
    );
  }
}

class AppDetailsSwitchBtn extends StatelessWidget {
  final String label;
  final String desc;
  final Color color;
  final ValueChanged<bool> onChanged;
  final bool defaultValue;

  const AppDetailsSwitchBtn({
    Key? key,
    required this.label,
    required this.desc,
    this.color = AppColors.romance,
    required this.onChanged,
    required this.defaultValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimen.sizeSmallCardCorner),
      ),
      child: Container(
        constraints: const BoxConstraints(
          minWidth: double.infinity,
          minHeight: AppDimen.sizeSwitchBoxHeight,
        ),
        color: color,
        padding: const EdgeInsets.all(AppDimen.spacingMedPlus),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    label,
                    softWrap: false,
                    textAlign: TextAlign.start,
                    style: TextStyleExtension.normalMedTextStyle
                        .copyWith(color: AppColors.primaryColor),
                  ),
                ),
                Switch(
                  value: defaultValue,
                  onChanged: onChanged,
                  activeColor: AppColors.primaryColor,
                )
              ],
            ),
            Text(
              desc,
              textAlign: TextAlign.start,
              style: TextStyleExtension.medRegularTextStyle
                  .copyWith(color: AppColors.trout),
            ),
          ],
        ),
      ),
    );
  }
}

class StandardLayout extends StatelessWidget {
  final String assetPath;
  final String title;
  final String subTitle;
  final double avatarRadius;
  final TextStyle titleStyle;
  final TextStyle subTitleStyle;
  final Color titleColor;
  final Color subTitleColor;
  final bool isNetwork;

  const StandardLayout({
    super.key,
    required this.assetPath,
    required this.title,
    required this.subTitle,
    this.titleStyle = TextStyleExtension.medTextStyle,
    this.subTitleStyle = TextStyleExtension.smallRegularTextStyle,
    this.avatarRadius = AppDimen.sizeMedSmallIcon,
    this.titleColor = AppColors.tundora,
    this.subTitleColor = AppColors.boulder,
    this.isNetwork = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: titleStyle.copyWith(color: titleColor),
            ),
            subtitle: Text(
              subTitle,
              overflow: TextOverflow.ellipsis,
              style: subTitleStyle.copyWith(color: subTitleColor),
            ),
          ),
        ),
      ],
    );
  }
}

class DateTimeChip extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final String label;
  final ChipThemeData theme;
  final ValueChanged<bool>? onSelect;

  const DateTimeChip({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.label,
    required this.onSelect,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 12.0),
      child: ChipTheme(
        data: theme,
        child: ChoiceChip(
          label: Text(label),
          selected: selectedIndex == index,
          onSelected: onSelect,
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String title;
  final String? subTitle;
  final String assetPath;
  final TextStyle? titleStyle;
  final bool isAssetNetwork;
  final bool enableSubTitle;
  final bool isChecked;
  final double assetRadius;

  const CustomListTile({
    super.key,
    required this.title,
    required this.assetPath,
    this.titleStyle,
    this.subTitle,
    this.isAssetNetwork = false,
    this.enableSubTitle = true,
    this.isChecked = false,
    this.assetRadius = AppDimen.sizeLargeIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        isAssetNetwork
            ? Image.network(
                assetPath,
                fit: BoxFit.cover,
                width: assetRadius,
                height: assetRadius,
              )
            : SvgPicture.asset(
                assetPath,
                fit: BoxFit.cover,
                width: AppDimen.sizeMedPlusIcon,
                height: AppDimen.sizeMedPlusIcon,
              ),
        const SizedBox(
          width: AppDimen.spacingSmall,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: titleStyle ??
                  TextStyleExtension.smallRegularTextStyle.copyWith(
                    color: AppColors.trout,
                  ),
            ),
            Visibility(
                visible: enableSubTitle,
                child: Column(
                  children: [
                    const SizedBox(
                      height: AppDimen.spacingTiny,
                    ),
                    Text(
                      subTitle ?? '',
                      style: TextStyleExtension.smallRegularTextStyle.copyWith(
                        color: AppColors.trout,
                      ),
                    )
                  ],
                ))
          ],
        ),
        Visibility(visible: isChecked, child: const Spacer()),
        Visibility(
            visible: isChecked,
            child: const Icon(
              Icons.check,
              color: AppColors.primaryColor,
            )),
      ],
    );
  }
}

class StandardListItem extends StatelessWidget {
  final String title;
  final String assetPath;
  final VoidCallback? onTap;
  final Color color;
  final EdgeInsetsGeometry padding;
  final MainAxisAlignment alignment;
  final double assetRadius;
  final bool isNetwork;

  const StandardListItem({
    super.key,
    required this.title,
    required this.assetPath,
    required this.onTap,
    this.color = AppColors.white,
    this.padding = const EdgeInsets.symmetric(
      vertical: AppDimen.spacingZero,
      horizontal: AppDimen.spacingZero,
    ),
    this.alignment = MainAxisAlignment.start,
    this.assetRadius = AppDimen.sizeMediumIcon,
    this.isNetwork = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(AppDimen.sizeMedCardCorner),
          ),
        ),
        constraints: const BoxConstraints(
          minWidth: double.infinity,
          minHeight: AppDimen.sizeLargerStandardListItemHeight,
        ),
        child: Row(
          mainAxisAlignment: alignment,
          mainAxisSize: MainAxisSize.max,
          children: [
            isNetwork
                ? Image.network(
                    assetPath,
                    width: assetRadius,
                    height: assetRadius,
                  )
                : SvgPicture.asset(
                    assetPath,
                  ),
            const SizedBox(
              width: AppDimen.spacingSmall,
            ),
            Flexible(
              child: Text(
                title,
                style: TextStyleExtension.medTextStyle.copyWith(
                  color: AppColors.ebonyClay,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}