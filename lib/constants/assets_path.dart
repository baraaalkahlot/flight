abstract class Assets {
  Assets._();

  /// Lottie Animations
  static const String lottiePath = "assets/lottie";

  // static const String animProgressBar = "$lottiePath/lottie_bouncing_circles.json";
  static const String animProgressBar = "$lottiePath/lottie_progress_bar.json";
  static const String animEmptyList = "$lottiePath/lottie_empty_list.json";
  static const String animGift = "$lottiePath/lottie_gift.json";

  /// Images
  static const String imagePath = "assets/images";
  static const String example = "$imagePath/first_board.svg";

  /// Icons
  static const String iconPath = "assets/icons";
  static const String appBarLogo = "$iconPath/app_bar_logo.svg";
  static const String appLogo = "$iconPath/app_logo.svg";
  static const String backIcon = "$iconPath/ic_back.svg";
  static const String nextIcon = "$iconPath/ic_next.svg";
  static const String reversedBackIcon = "$iconPath/ic_reversed_back.svg";


  /// Dialogs Icon
  static const String dialogIconsPath = "assets/icons/dialog_icons";
  static const String alertDialogIcon = "$dialogIconsPath/ic_alert_dialog.svg";
  static const String dangerAlertDialogIcon = "$dialogIconsPath/ic_danger_alert_dialog.svg";
  static const String successDialogIcon = "$dialogIconsPath/ic_circle_check.svg";
  static const String errorDialogIcon = "$dialogIconsPath/ic_server_error.svg";
}
