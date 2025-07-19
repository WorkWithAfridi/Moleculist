import 'package:moleculist/data/local/local_storage.dart';
import 'package:moleculist/domain/models/compund_m.dart';

class FavoriteService {
  LocalStorage localStorage;

  FavoriteService({required this.localStorage});

  setFavorite(CompoundModel compund) async {}

  getFavoriteList() async {}

  isFavorite() async {}
}
