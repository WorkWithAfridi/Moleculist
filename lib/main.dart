import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/resources/theme/app_theme.dart';
import 'common/utilities/di/dependency_injection.dart';
import 'common/utilities/routing/app_routes.dart';
import 'common/utilities/routing/route_controller.dart';
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
      providers: [BlocProvider(create: (context) => SplashCubit())],
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
    );
  }
}
