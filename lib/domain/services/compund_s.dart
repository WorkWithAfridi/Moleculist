import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:moleculist/data/local/local_storage.dart';
import 'package:moleculist/domain/models/compund_m.dart';

import '../../common/utilities/logger.dart';
import '../repositories/compound_r.dart';

class CompoundService {
  final CompoundRepository _repository;

  CompoundService({required CompoundRepository repository}) : _repository = repository;

  Future<CompoundModel?> fetchCompound(String name) async {
    return await _repository.getCompoundByName(name);
  }

  Future<List<CompoundModel>> fetchCompounds(List<String> names, {bool shouldLoadFromCache = false}) async {
    try {
      if (shouldLoadFromCache) {
        final cache = localStorageInstance.getString(key: "compounds");
        if (cache != null) {
          final decoded = jsonDecode(cache);
          if (decoded is List) {
            return decoded.map((e) => CompoundModel.fromJson(e)).toList();
          }
        }
      }
    } catch (e) {
      logger.error("Error fetching compounds from cache: $e");
    }

    final results = await Future.wait(names.map((n) => _repository.getCompoundByName(n)));

    final validResults = results.whereType<CompoundModel>().toList();

    try {
      localStorageInstance.setString(key: "compounds", value: jsonEncode(validResults.map((e) => e.toJson()).toList()));
    } catch (e) {
      logger.error("Error saving compounds to cache: $e");
    }

    return validResults;
  }
}

final CompoundService compoundServiceInstance = GetIt.I<CompoundService>();
