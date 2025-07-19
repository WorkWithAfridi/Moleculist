import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moleculist/presentation/blocs/dashboard_b/dashboard_bloc.dart';
import 'package:toastification/toastification.dart';

import 'common/resources/theme/app_theme.dart';
import 'common/utilities/di/dependency_injection.dart';
import 'common/utilities/routing/app_routes.dart';
import 'common/utilities/routing/route_controller.dart';
import 'presentation/blocs/favorite_c/favorite_cubit.dart';
import 'presentation/blocs/splash_c/splash_cubit.dart';

void main(List<String> args) async {
  await DependencyInjection().init();
  runApp(const MoleculistApp());
}

class MoleculistApp extends StatelessWidget {
  const MoleculistApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashCubit()),
        BlocProvider(create: (context) => DashboardBloc()),
        BlocProvider(create: (context) => favoriteCubitInstance),
      ],
      child: ToastificationWrapper(
        child: MaterialApp(
          title: 'MoleculistApp',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.light,
          scrollBehavior: ScrollBehavior().copyWith(physics: BouncingScrollPhysics()),
          onGenerateRoute: ROUTECONTROLLER.routeController,
          initialRoute: ROUTES.getSplashRoute,
        ),
      ),
    );
  }
}
