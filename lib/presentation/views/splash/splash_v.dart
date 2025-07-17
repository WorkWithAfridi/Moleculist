import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moleculist/common/utilities/extensions/on_build_context.dart';
import 'package:moleculist/common/utilities/routing/app_routes.dart';
import 'package:moleculist/presentation/blocs/splash_c/splash_cubit.dart';

import '../../../common/resources/assets/app_assets.dart';
import '../../../common/resources/dimentions/app_sizes.dart';
import '../../../common/utilities/logger.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    context.read<SplashCubit>().triggerSplash();
    super.initState();
    logger.debug("Splash initialized");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashCompleted) {
            context.navigateOffNamed(ROUTES.getDashboardRoute);
          }
        },
        child: SizedBox(
          width: getWidth(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [SizedBox(height: 200, width: 200, child: Image.asset(AppAssets.appLogo))],
          ),
        ),
      ),
    );
  }
}
