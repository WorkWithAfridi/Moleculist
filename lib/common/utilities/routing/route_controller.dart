import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moleculist/domain/models/compund_m.dart';
import 'package:moleculist/presentation/blocs/compound_c/cubit/compound_cubit.dart';
import 'package:moleculist/presentation/blocs/cubit/search_cubit.dart';
import 'package:moleculist/presentation/views/compunds/views/compund_detail_v.dart';
import 'package:moleculist/presentation/views/dashboard/dashboard_v.dart';

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
      case ROUTES.getCompundDetailRoute:
        final CompoundModel compund = settings.arguments as CompoundModel;
        return CustomTransitionPageRoute(childWidget: CompundDetailView(compound: compund));
      case ROUTES.getDashboardRoute:
        return CustomTransitionPageRoute(
          childWidget: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => compoundCubitInstance),
              BlocProvider(create: (context) => searchCubitInstance),
            ],
            child: DashboardView(),
          ),
        );
      default:
        logger.debug(settings.name.toString());
        return CustomTransitionPageRoute(childWidget: const ErrorView());
    }
  }
}
