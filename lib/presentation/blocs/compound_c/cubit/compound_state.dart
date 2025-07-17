part of 'compound_cubit.dart';

@immutable
sealed class CompoundState {}

final class CompoundUnloadedState extends CompoundState {}

final class CompoundLoadingState extends CompoundState {}

final class CompoundLoadedState extends CompoundState {
  List<CompoundModel> compounds;

  CompoundLoadedState({required this.compounds});
}

final class CompoundErrorState extends CompoundState {
  String errorMessage;

  CompoundErrorState({required this.errorMessage});
}
