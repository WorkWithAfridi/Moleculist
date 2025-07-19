import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:moleculist/data/local/local_storage.dart';
import 'package:moleculist/domain/models/compund_m.dart';

class FavoriteService {
  static const String _favoritesKey = 'favorite_compounds';
  final LocalStorage localStorage;

  FavoriteService({required this.localStorage});

  Future<void> setFavorite(CompoundModel compound) async {
    final list = await getFavoriteList();
    final exists = list.any((c) => c.cid == compound.cid);

    if (exists) {
      list.removeWhere((c) => c.cid == compound.cid);
    } else {
      list.add(compound);
    }

    await localStorage.writeList(_favoritesKey, list.map((e) => e.toJson()).toList());
  }

  Future<List<CompoundModel>> getFavoriteList() async {
    final rawList = await localStorage.readList(_favoritesKey);
    if (rawList == null) return [];
    return rawList.map((e) => CompoundModel.fromJson(jsonEncode(e))).toList();
  }

  Future<bool> isFavorite(CompoundModel compound) async {
    final list = await getFavoriteList();
    return list.any((c) => c.cid == compound.cid);
  }
}

final FavoriteService favoriteServiceInstance = GetIt.I<FavoriteService>();
