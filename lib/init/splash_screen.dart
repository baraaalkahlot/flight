import 'package:flight/constants/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_colors.dart';
import '../constants/app_dimen.dart';

class SplashScreens extends StatelessWidget {
  const SplashScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimen.spacePaddingLayout),
      color: AppColors.primaryColor,
      child: Center(
        child: SvgPicture.asset(Assets.appLogo, fit: BoxFit.contain),
      ),
    );
  }
}
