import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:moleculist/domain/models/compund_m.dart';

import '../../../domain/services/favorite_s.dart';
import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteService favoriteService;

  FavoriteCubit({required this.favoriteService}) : super(FavoriteInitial());

  Future<void> loadFavorites() async {
    emit(FavoriteLoading());
    try {
      final favorites = await favoriteService.getFavoriteList();
      emit(FavoriteLoaded(favorites: favorites));
    } catch (e) {
      emit(FavoriteError('Failed to load favorites'));
    }
  }

  Future<void> toggleFavorite(CompoundModel compound) async {
    await favoriteService.setFavorite(compound);
    await loadFavorites(); // Refresh after change
  }

  Future<bool> isFavorite(CompoundModel compound) async {
    return await favoriteService.isFavorite(compound);
  }
}

final FavoriteCubit favoriteCubitInstance = GetIt.I<FavoriteCubit>();
