import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_colors.dart';
import '../constants/app_dimen.dart';
import '../constants/assets_path.dart';
import '../utils/ui/app_styles.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const PrimaryAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimen.zero),
      child: AppBar(
        backgroundColor: AppColors.white,
        leadingWidth: AppDimen.sizeAppBarLogoWidth,
        actions: [],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            Assets.appBarLogo,
          ),
        ),
        title: Text(
          title,
          style: TextStyleExtension.normalMedTextStyle
              .copyWith(color: AppColors.ebonyClay),
        ),
        centerTitle: true,
        elevation: AppDimen.zero,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class LogoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool enableBack;
  final Color backgroundColor;
  final VoidCallback? onPressed;

  const LogoAppBar({
    Key? key,
    this.enableBack = true,
    this.backgroundColor = AppColors.white,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimen.spacingLarge),
      child: AppBar(
        leadingWidth: AppDimen.sizeAppBarLogoWidth,
        backgroundColor: backgroundColor,
        leading: SvgPicture.asset(
          Assets.appBarLogo,
        ),
        actions: [
          Visibility(
            visible: enableBack,
            child: IconButton(
              icon: SvgPicture.asset(Assets.backIcon, matchTextDirection: true),
              onPressed: onPressed ?? () => Navigator.of(context).pop(),
            ),
          )
        ],
        elevation: AppDimen.zero,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class TitledAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool enableBack;
  final bool isCenter;
  final String title;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final double? toolbarHeight;
  final VoidCallback? onPressed;

  const TitledAppBar({
    Key? key,
    this.enableBack = true,
    this.isCenter = false,
    required this.title,
    this.actions,
    this.bottom,
    this.toolbarHeight,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimen.spacingLarge),
      child: AppBar(
        leading: enableBack
            ? IconButton(
                icon: SvgPicture.asset(Assets.reversedBackIcon),
                onPressed: onPressed ?? () => Navigator.of(context).pop(),
              )
            : null,
        title: Text(
          title,
          style: TextStyleExtension.normalMedTextStyle
              .copyWith(color: AppColors.ebonyClay),
        ),
        toolbarHeight: toolbarHeight,
        bottom: bottom,
        centerTitle: isCenter,
        actions: actions,
        elevation: AppDimen.zero,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
