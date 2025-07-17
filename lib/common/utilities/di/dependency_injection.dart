import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moleculist/domain/repositories/compound_r.dart';

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
    GetIt.instance.registerLazySingleton<AbstractCompoundRepository>(
      () => CompoundRepository(
        GetIt.instance<NetworkController>(), // assuming your UserRepository needs NetworkController
      ),
    );

    // // Service
    // GetIt.instance.registerLazySingleton(() => UserService(GetIt.instance<AbstractUserRepository>()));

    // // Bloc
    // GetIt.instance.registerFactory(() => UserBloc(userService: GetIt.instance<UserService>()));
  }
}
