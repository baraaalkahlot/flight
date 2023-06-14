import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/routes/routes.dart';
import '../constants/app_colors.dart';
import '../constants/app_constant.dart';
import '../constants/app_dimen.dart';
import '../modules/home/home_repository.dart';
import '../modules/home/search/search_flight_bloc.dart';
import '../utils/ui/app_styles.dart';
import 'navigation_service.dart';

class AppComponent extends StatelessWidget {
  const AppComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SearchFlightBloc(),
        ),
      ],
      child: const AppComponentStateful(),
    );
  }
}

class AppComponentStateful extends StatefulWidget {
  const AppComponentStateful({super.key});

  @override
  State<StatefulWidget> createState() => _AppComponentState();
}

class _AppComponentState extends State<AppComponentStateful>
    with WidgetsBindingObserver {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  void initState() {
    super.initState();

    /// Register with the widget layer binding
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    /// Remove the register with the widget layer binding
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleApplicationOnTapScreen(context),
      child: MaterialApp(
        navigatorKey: NavigationService.instance.navigationKey,
        navigatorObservers: <NavigatorObserver>[
          NavigationService.instance.routeObserver
        ],
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: AppColors.athensGray,
            fontFamily: 'Poppins',
            primarySwatch:
                MaterialColor(AppColors.primaryColor.value, const <int, Color>{
              50: Color(0xFFE8EAF6),
              100: Color(0xFFC5CBE9),
              200: Color(0xFF9FA8DA),
              300: Color(0xFF7985CB),
              400: Color(0xFF5C6BC0),
              500: AppColors.primaryColor,
              600: Color(0xFF394AAE),
              700: Color(0xFF3140A5),
              800: Color(0xFF29379D),
              900: Color(0xFF1B278D),
            }),
            tabBarTheme: TabBarTheme(
                labelColor: AppColors.athensGray,
                unselectedLabelColor: AppColors.santasGray,
                indicator: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(AppDimen.sizeTabBarCorner),
                  color: AppColors.primaryColor,
                )),
            appBarTheme: AppBarTheme(
              backgroundColor: AppColors.athensGray,
              iconTheme: const IconThemeData(color: AppColors.ebonyClay),
              titleTextStyle:
                  TextStyleExtension.medPlusRegularTextStyle.copyWith(
                color: AppColors.ebonyClay,
              ),
            ),
            textTheme: const TextTheme()
                .copyWith(titleSmall: TextStyleExtension.inputLabelStyles)),
        initialRoute: Routes.home,
        routes: appRoutes,
      ),
    );
  }

  /// Remove the keyboard when tapped on any part of screen other than primary
  /// focus
  void _handleApplicationOnTapScreen(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    }
  }
}
