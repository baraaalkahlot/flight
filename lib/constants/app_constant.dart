import 'package:flutter/material.dart';

abstract class AppConstants {
  AppConstants._();

  static const String arLocale = 'ar';
}

enum RequestStatus { initial, inProgress, success, failure }
