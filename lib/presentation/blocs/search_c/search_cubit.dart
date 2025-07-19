import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../domain/models/compund_m.dart';
import '../../../domain/services/search_s.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchService searchService;

  SearchCubit({required this.searchService}) : super(SearchInitial());

  Future<void> searchCompound(String query) async {
    if (query.trim().isEmpty) {
      emit(SearchInitial());
      return;
    }

    emit(SearchLoading());
    try {
      final compound = await searchService.searchCompound(query);
      if (compound != null) {
        emit(SearchResultLoaded(compounds: [compound]));
      } else {
        emit(SearchResultLoaded(compounds: []));
      }
    } catch (e) {
      emit(SearchError('Failed to search compound.'));
    }
  }

  Future resetState() async {
    emit(SearchInitial());
  }
}

final SearchCubit searchCubitInstance = GetIt.I<SearchCubit>();
