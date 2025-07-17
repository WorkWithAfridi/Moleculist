import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../common/services/feature_flagger/feature_flagger_s.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  triggerSplash() async {
    await FeatureFlaggerService().initService();
    await Future.delayed(const Duration(seconds: 2));

    emit(SplashCompleted());
  }
}
