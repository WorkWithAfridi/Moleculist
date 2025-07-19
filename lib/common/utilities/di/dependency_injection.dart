import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moleculist/domain/repositories/compound_r.dart';
import 'package:moleculist/domain/repositories/search_r.dart';
import 'package:moleculist/domain/services/compund_s.dart';
import 'package:moleculist/domain/services/favorite_s.dart';
import 'package:moleculist/domain/services/search_s.dart';
import 'package:moleculist/presentation/blocs/compound_c/cubit/compound_cubit.dart';
import 'package:moleculist/presentation/blocs/favorite_c/favorite_cubit.dart';
import 'package:moleculist/presentation/blocs/search_c/search_cubit.dart';

import '../../../data/local/local_storage.dart';
import '../../../data/remote/controller/network_c.dart';
import '../logger.dart';

class DependencyInjection {
  init() async {
    WidgetsFlutterBinding.ensureInitialized();
    _configureLocalStorage();
    _configureControllers();
    _configureRepositoriesAndServices();
  }

  void _configureLocalStorage() {
    LocalStorage().init();
    LocalStorage localStorage = GetIt.instance.registerSingleton<LocalStorage>(LocalStorage());
    localStorage.init();
    logger.debug("Local storage initialized");
  }

  void _configureControllers() {
    NetworkController networkController = GetIt.instance.registerSingleton<NetworkController>(NetworkController());
    networkController.init();
    logger.debug("Custom controllers initialized");
  }

  void _configureRepositoriesAndServices() {
    // Repository
    GetIt.instance.registerLazySingleton<CompoundRepository>(() => CompoundRepository(GetIt.instance<NetworkController>()));
    GetIt.instance.registerLazySingleton<SearchRepository>(() => SearchRepository(GetIt.instance<NetworkController>()));

    // Service
    GetIt.instance.registerLazySingleton(() => CompoundService(repository: compoundRepositoryInstance));
    GetIt.instance.registerLazySingleton(() => SearchService(repository: searchRepositoryInstance));
    GetIt.instance.registerLazySingleton(() => FavoriteService(localStorage: localStorageInstance));

    // Bloc
    GetIt.instance.registerFactory(() => CompoundCubit(compoundService: compoundServiceInstance));
    GetIt.instance.registerFactory(() => SearchCubit(searchService: searchServiceInstance));
    GetIt.instance.registerFactory(() => FavoriteCubit(favoriteService: favoriteServiceInstance));
  }
}
