import 'package:get_it/get_it.dart';
import 'package:moleculist/domain/models/compund_m.dart';
import '../../common/utilities/logger.dart';
import '../../data/remote/config/api_endpoints.dart';
import '../../data/remote/controller/network_c.dart';

abstract class AbstractSearchRepository {
  Future<CompoundModel?> searchCompoundByName(String name);
}

class SearchRepository implements AbstractSearchRepository {
  final NetworkController networkController;

  SearchRepository(this.networkController);

  @override
  Future<CompoundModel?> searchCompoundByName(String name) async {
    try {
      final response = await networkController.request(
        url: ApiEndPoints.getCompoundByName(name),
        method: Method.GET,
      );

      if (response?.data != null) {
        return CompoundModel.fromPubChemJson(response!.data, name);
      }
    } catch (e) {
      logger.error("Search error for '$name': $e");
    }
    return null;
  }
}

final SearchRepository searchRepositoryInstance = GetIt.I<SearchRepository>();
