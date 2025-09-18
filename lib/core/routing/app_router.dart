import 'package:flutter/cupertino.dart' show CupertinoPageRoute;
import 'package:flutter/material.dart'
    show
        ColorScheme,
        Theme,
        NavigatorState,
        GlobalKey,
        RouteSettings,
        Route,
        Widget;
import '../../mod/kohi_main_screen/page/kohi_main_screen.dart';
import '../error/no_routes_error.dart';
import 'routes.dart' show Routes;

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static ColorScheme get theme {
    final context = navigatorKey.currentContext;
    if (context == null) {
      throw Exception('Navigator context is not available');
    }
    return Theme.of(context).colorScheme;
  }

  Route<dynamic> generateRoute(final RouteSettings settings) {
    Widget page;
    switch (settings.name) {
      case Routes.ahwaMainScreen:
        page = const KohiMainScreen();
        break;

      default:
        page = const NoRoutesError();
    }
    return CupertinoPageRoute(builder: (_) => page);
  }
}
