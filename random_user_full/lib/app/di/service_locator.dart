import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../user/data/datasources/user_random_data_source.dart';
import '../../user/data/datasources/user_random_data_source_impl.dart';
import '../../user/data/repositories/user_repository_impl.dart';
import '../../user/domain/repositories/user_repository.dart';
import '../../user/domain/usecases/get_random_user.dart';
import '../../user/domain/usecases/get_random_users.dart';

final GetIt serviceLocator =
    GetIt.instance; // el diccionario, uno solo en toda la app

void configureDependencies() {
  // "Si alguien pide un Dio, constrúyelo así. Uno solo para toda la app."
  serviceLocator.registerLazySingleton<Dio>(Dio.new);

  // "Si alguien pide un UserRandomDataSource, dale un Impl... y para armarlo, pídeme el Dio."
  serviceLocator.registerLazySingleton<UserRandomDataSource>(
    () => UserRandomDataSourceImpl(serviceLocator<Dio>()),
  );

  // Igual: el repositorio necesita el datasource, así que lo pide al diccionario.
  serviceLocator.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(serviceLocator<UserRandomDataSource>()),
  );

  // Los use cases: factory porque no guardan estado, se crean y se tiran.
  serviceLocator.registerFactory(
    () => GetRandomUser(serviceLocator<UserRepository>()),
  );
  serviceLocator.registerFactory(
    () => GetRandomUsers(serviceLocator<UserRepository>()),
  );
}
