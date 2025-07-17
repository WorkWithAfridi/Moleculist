import 'package:get_it/get_it.dart';
import 'package:moleculist/domain/models/compund_m.dart';

import '../../common/utilities/logger.dart';
import '../../data/remote/config/api_endpoints.dart';
import '../../data/remote/controller/network_c.dart';

abstract class AbstractCompoundRepository {
  Future<CompoundModel?> getCompoundByName(String name);
  Future<String?> getStructureImageUrl(int cid);
}

class CompoundRepository implements AbstractCompoundRepository {
  final NetworkController networkController;

  CompoundRepository(this.networkController);

  @override
  Future<CompoundModel?> getCompoundByName(String name) async {
    try {
      final response = await networkController.request(url: ApiEndPoints.getCompoundByName(name), method: Method.GET);

      if (response?.data != null) {
        return CompoundModel.fromPubChemJson(response!.data, name);
      }
    } catch (e) {
      logger.error("Error fetching compound '$name': $e");
    }
    return null;
  }

  @override
  Future<String?> getStructureImageUrl(int cid) async {
    try {
      return ApiEndPoints.getCompoundImage(cid);
    } catch (e) {
      logger.error("Error generating structure image URL: $e");
    }
    return null;
  }
}

final CompoundRepository compoundRepositoryInstance = GetIt.I<CompoundRepository>();
