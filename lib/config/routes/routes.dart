import 'package:flutter/material.dart';

import '../../init/splash_screen.dart';
import '../../modules/home/home_screen.dart';


class Routes {
  static const splash = '/';
  static const home = '/home';
}

Map<String, WidgetBuilder> appRoutes = {
  Routes.splash: (context) => const SplashScreens(),
  Routes.home: (context) => const HomeScreen(),
};
