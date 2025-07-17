import 'package:flutter/material.dart';

import '../../../presentation/views/global/error_v.dart';
import '../../../presentation/views/splash/splash_v.dart';
import '../logger.dart';
import 'app_routes.dart';
import 'custom_route_transition/custom_route_transition.dart';

class ROUTECONTROLLER {
  static Route<dynamic> routeController(RouteSettings settings) {
    switch (settings.name) {
      case ROUTES.getSplashRoute:
        return CustomTransitionPageRoute(childWidget: const SplashView());
      default:
        logger.debug(settings.name.toString());
        return CustomTransitionPageRoute(childWidget: const ErrorView());
    }
  }
}
