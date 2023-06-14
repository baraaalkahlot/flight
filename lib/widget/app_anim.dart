import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import '../constants/app_colors.dart';
import '../constants/app_dimen.dart';
import '../constants/assets_path.dart';
import '../utils/ui/app_styles.dart';

class AppProgressIndicator extends StatelessWidget {
  const AppProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5.0,
          sigmaY: 5.0,
        ),
        child: Container(
          padding:  const EdgeInsets.all(AppDimen.spacingHuge),
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width / 1.5,
            minHeight: AppDimen.sizeProgressBarHeight,
          ),
          decoration: BoxDecoration(
              color: AppColors.white.withOpacity(.9),
              borderRadius: const BorderRadius.all(
                  Radius.circular(AppDimen.sizeDialogCorner))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                Assets.animProgressBar,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: AppDimen.spacingSmall,
              ),
              Text(
                'Please Wait...',
                style: TextStyleExtension.medPlusRegularTextStyle.copyWith(
                  color: AppColors.trout,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
