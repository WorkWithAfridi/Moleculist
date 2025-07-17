import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  triggerSplash() async {
    // TODO: uncomment to generate random color
    // AppColors().primary = ColorService.generateCustomColorShades();

    await Future.delayed(const Duration(seconds: 2));

    emit(SplashCompleted());
  }
}
