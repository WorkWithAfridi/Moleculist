import 'package:get_it/get_it.dart';
import 'package:moleculist/domain/models/compund_m.dart';

import '../../common/utilities/logger.dart';
import '../repositories/search_r.dart';

class SearchService {
  final SearchRepository _repository;

  SearchService({required SearchRepository repository}) : _repository = repository;

  Future<CompoundModel?> searchCompound(String name) async {
    if (name.trim().isEmpty) return null;
    try {
      return await _repository.searchCompoundByName(name.trim());
    } catch (e) {
      logger.error("SearchService error: $e");
      return null;
    }
  }
}

final SearchService searchServiceInstance = GetIt.I<SearchService>();
