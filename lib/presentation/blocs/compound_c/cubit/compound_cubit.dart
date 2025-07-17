import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:moleculist/domain/models/compund_m.dart';
import 'package:moleculist/domain/services/compund_s.dart';

part 'compound_state.dart';

class CompoundCubit extends Cubit<CompoundState> {
  final CompoundService compoundService;

  CompoundCubit({required this.compoundService}) : super(CompoundUnloadedState());

  Future<void> loadCompoundList() async {
    emit(CompoundLoadingState());
    try {
      final List<String> compoundNames = ['Aspirin', 'Acetone', 'Benzene', 'Ethanol', 'Formaldehyde', 'Methane', 'Caffeine', 'Glucose'];
      final compounds = await compoundService.fetchCompounds(compoundNames);
      emit(CompoundLoadedState(compounds: compounds));
    } catch (e) {
      emit(CompoundErrorState(errorMessage: 'Failed to load compounds.'));
    }
  }
}

final CompoundCubit compoundCubitInstance = GetIt.I<CompoundCubit>();
