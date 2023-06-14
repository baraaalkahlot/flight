import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_dimen.dart';
import '../../constants/assets_path.dart';
import '../../widget/app_anim.dart';
import '../helper/app_helpers.dart';
import 'app_styles.dart';
import 'ui_utils.dart';

/// All the custom app dialogs UI will be present in this file.
///

abstract class AppDialog {
  AppDialog._();

  static void showAppAlertDialog({
    required context,
    dialogType = DialogType.error,
    String? content,
  }) {
    DialogModel dialogModel = _getDialogSpecByType(dialogType, context);
    content = content ?? 'Some thing went wrong';
    showGeneralDialog(
      context: context,
      transitionBuilder: (ctx, a1, a2, child) {
        var curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
          scale: curve,
          child: SafeArea(
            child: AlertDialog(
              actionsPadding: const EdgeInsets.fromLTRB(AppDimen.spacingLarge,
                  AppDimen.zero, AppDimen.spacingLarge, AppDimen.spacingLarge),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(AppDimen.sizeDialogCorner))),
              content: SingleChildScrollView(
                  child: Column(
                children: [
                  SvgPicture.asset(dialogModel.icon),
                  const SizedBox(height: AppDimen.spacingLarge),
                  Text(dialogModel.title,
                      style: TextStyleExtension.bigMedTextStyle
                          .copyWith(color: dialogModel.color)),
                  const SizedBox(height: AppDimen.spacingSmall),
                  Text(
                    content!,
                    style: TextStyleExtension.medPlusRegularTextStyle
                        .copyWith(color: AppColors.trout),
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
              actions: <Widget>[
                PrimaryButton(
                  ctx,
                  label: 'Ok',
                  backgroundColor: dialogModel.color,
                  borderColor: dialogModel.color,
                  labelColor: dialogModel.labelColor,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, _, __) => Container(),
    );
  }

  static void showAppListDialog({
    required context,
    required String title,
    required List<String> asset,
    required List<String> content,
    VoidCallback? positiveCallBack,
    bool barrierDismissible = false,
    String positiveLabel = 'Ok',
  }) {
    showGeneralDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierLabel: 'Dismiss dialog',
      pageBuilder: (ctx, _, __) => Container(),
      transitionBuilder: (ctx, a1, a2, child) {
        var curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
          scale: curve,
          child: SafeArea(
            child: AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(AppDimen.sizeDialogCorner))),
              title: Text(
                title,
                style: TextStyleExtension.largeRegularTextStyle,
              ),
              content: SizedBox(
                width: MediaQuery.of(context).size.width / 1.3,
                height: MediaQuery.of(context).size.height / 3,
                child: Scrollbar(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: content.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(bottom: AppDimen.spacingTiny),
                        child: Row(
                          children: [
                            Image.network(
                              asset[index],
                              fit: BoxFit.cover,
                              width: AppDimen.sizeSmallIcon,
                              height: AppDimen.sizeSmallIcon,
                            ),
                            const SizedBox(
                              width: AppDimen.spacingSmall,
                            ),
                            Expanded(
                              child: Text(
                                content[index],
                                overflow: TextOverflow.ellipsis,
                                style:
                                    TextStyleExtension.normalTextStyle.copyWith(
                                  color: AppColors.trout,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                  ),
                ),
              ),
              actionsPadding: EdgeInsets.zero,
              actions: <Widget>[
                MeltedButton(
                    onPressed: () {
                      Navigator.of(ctx, rootNavigator: true).pop();
                      positiveCallBack?.call();
                    },
                    label: positiveLabel),
              ],
            ),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  static void showLottieAnimDialog({
    required context,
    required String assetPath,
    required AnimationController lottieAnimationController,
    VoidCallback? positiveCallBack,
    String positiveLabel = 'Ok',
  }) {
    showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext ctx, _, __) {
        lottieAnimationController.addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            lottieAnimationController.reset();
          }
        });

        return Container();
      },
      transitionBuilder: (ctx, a1, a2, child) {
        var curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
          scale: curve,
          child: SafeArea(
            child: AlertDialog(
                actionsPadding: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(AppDimen.sizeDialogCorner))),
                alignment: Alignment.center,
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                        controller: lottieAnimationController,
                        assetPath,
                        fit: BoxFit.contain, onLoaded: (composition) {
                      lottieAnimationController.duration = composition.duration;
                      lottieAnimationController.repeat();
                    }),
                    const SizedBox(
                      height: AppDimen.spacingSmall,
                    ),
                    Text(
                      'Proceed successfully',
                      style: TextStyleExtension.bigMedTextStyle.copyWith(
                        color: AppColors.boulder,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                actions: [
                  MeltedButton(
                      onPressed: () {
                        Navigator.of(ctx, rootNavigator: true).pop();
                        positiveCallBack?.call();
                      },
                      label: positiveLabel),
                ]),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  static DialogModel _getDialogSpecByType(dialogType, context) {
    if (dialogType == DialogType.error) {
      return const DialogModel(
          icon: Assets.errorDialogIcon,
          color: AppColors.brinkPink,
          title: 'Error Message');
    } else if (dialogType == DialogType.success) {
      return const DialogModel(
          icon: Assets.successDialogIcon,
          color: AppColors.primaryColor,
          title: 'Success Message');
    } else if (dialogType == DialogType.alert) {
      return const DialogModel(
          icon: Assets.alertDialogIcon,
          color: AppColors.goldenYellow,
          labelColor: AppColors.tundora,
          title: 'Alert Message');
    } else if (dialogType == DialogType.alertDanger) {
      return const DialogModel(
          icon: Assets.dangerAlertDialogIcon,
          color: AppColors.brinkPink,
          title: 'Alert Message');
    } else {
      return const DialogModel(
          icon: Assets.successDialogIcon,
          color: AppColors.primaryColor,
          title: 'Info');
    }
  }
}

class DialogModel {
  final Color color;
  final Color labelColor;
  final String title;
  final String icon;

  const DialogModel({
    required this.color,
    this.labelColor = AppColors.romance,
    required this.title,
    required this.icon,
  });
}
