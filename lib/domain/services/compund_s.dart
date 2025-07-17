import 'package:get_it/get_it.dart';
import 'package:moleculist/domain/models/compund_m.dart';

import '../repositories/compound_r.dart';

class CompoundService {
  final CompoundRepository _repository;

  CompoundService({required CompoundRepository repository}) : _repository = repository;

  Future<CompoundModel?> fetchCompound(String name) async {
    return await _repository.getCompoundByName(name);
  }

  Future<List<CompoundModel>> fetchCompounds(List<String> names) async {
    final results = await Future.wait(names.map((n) => _repository.getCompoundByName(n)));
    return results.whereType<CompoundModel>().toList();
  }
}

final CompoundService compoundServiceInstance = GetIt.I<CompoundService>();
