import 'package:archiman/app/app_constants.dart';
import 'package:archiman/app/app_strings.al.dart';
import 'package:archiman/features/common/pages/splash/cubit/splash_cubit.dart';
import 'package:archiman/features/common/pages/splash/splash_page.dart';
import 'package:archiman/features/common/utils/generic/page_utils.dart';
import 'package:archiman/infrastructure/misc/analytics.dart';
import 'package:archiman/start/service_locator.dart';
import 'package:auto_localized/auto_localized.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:universal_io/io.dart';

import 'app_messenger.dart';
import 'app_navigator.dart';
import 'app_routes.dart';
import 'cubit/app_cubit.dart';
import 'cubit/app_state.dart';

class ThisApp extends StatefulWidget {
  const ThisApp({Key? key}) : super(key: key);

  @override
  ThisAppState createState() => ThisAppState();
}

class ThisAppState extends State<ThisApp> {
  final AppCubit _appCubit = getIt<AppCubit>();
  final AppNavigator _appNavigator = getIt<AppNavigator>();
  final AppMessenger _appMessenger = getIt<AppMessenger>();
  final Analytics _analytics = getIt<Analytics>();
  final RouteObserver _routeObserver = getIt<RouteObserver>();

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      enabled: false,
      builder: (BuildContext context) {
        return AutoLocalizedApp(
          child: BlocProvider<AppCubit>(
            create: (BuildContext context) => _appCubit,
            child: BlocBuilder<AppCubit, AppState>(
              bloc: _appCubit,
              builder: (BuildContext context, AppState state) {
                return MaterialApp(
                  useInheritedMediaQuery: true,
                  locale: DevicePreview.locale(context),
                  debugShowCheckedModeBanner: false,
                  title: 'Archiman',
                  supportedLocales: context.supportedLocales,
                  localizationsDelegates: context.localizationsDelegates,
                  builder: (BuildContext context, Widget? child) {
                    final Size size = MediaQuery.of(context).size;
                    _logger.fine('Device size ${size.width} x ${size.height}');
                    return DevicePreview.appBuilder(
                      context,
                      AppDelegate(child: child),
                    );
                  },
                  home: BlocProvider<SplashCubit>(
                    create: (BuildContext context) =>
                        SplashCubit()..appStarted(),
                    child: SplashPage(),
                  ),
                  theme: state.appTheme.themeData,
                  darkTheme: state.appTheme.darkThemeData,
                  themeMode: state.appTheme.themeMode,
                  navigatorKey: _appNavigator.navigatorKey,
                  navigatorObservers: isProduction
                      ? (_analytics.navigatorObservers()..add(_routeObserver))
                      : <NavigatorObserver>[_routeObserver],
                  scaffoldMessengerKey: _appMessenger.messengerKey,
                  onGenerateRoute: (RouteSettings settings) =>
                      appRoutes(settings, _appCubit),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class AppDelegate extends StatefulWidget {
  const AppDelegate({Key? key, required this.child}) : super(key: key);

  final Widget? child;

  @override
  AppDelegateState createState() => AppDelegateState();
}

class AppDelegateState extends State<AppDelegate> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _cubit(context).appStarted();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _logger.fine('app paused');
      _cubit(context).appPaused();
    }
    if (state == AppLifecycleState.resumed) {
      _logger.fine('app resumed');
      _cubit(context).appResumed();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Dismiss the keyboard when any tap happens outside a TextField
        if (Platform.isIOS) {
          PageUtils.hideKeyboard(context);
        }
      },
      child: widget.child,
    );
  }

  AppCubit _cubit(BuildContext context) => context.read<AppCubit>();
}

// ignore: unused_element
final Logger _logger = Logger('App');
