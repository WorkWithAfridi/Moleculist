part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchResultLoaded extends SearchState {
  final List<CompoundModel> compounds;
  SearchResultLoaded({required this.compounds});
}

final class SearchError extends SearchState {
  final String message;
  SearchError(this.message);
}
