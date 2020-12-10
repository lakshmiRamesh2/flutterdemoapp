import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';

import 'package:flutter_app/feature/domain/usecase/registration_response_usecase.dart';
import 'package:flutter_app/feature/presentation/pages/login/register_bloc.dart';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'core/utils/my_shared_pref.dart';
import 'feature/data/client/client.dart';
import 'feature/data/datasource/local_datasource.dart';
import 'feature/data/datasource/remote_datasource.dart';
import 'feature/data/repositories/repository_impl.dart';
import 'feature/domain/repositories/repository.dart';

import 'feature/presentation/bloc/authentication/authentication_bloc.dart';
import 'feature/presentation/bloc/my_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => MyBloc());

  sl.registerFactory(() => AuthenticationBloc(sharedPref: sl()));
  sl.registerFactory(() => RegisterBloc(
        authenticationBloc: sl(),
        registerUseCase: sl(),
      ));

  // UseCase
  sl.registerLazySingleton(() => RegistrtionResponseUseCase(sl()));

  // repository
  sl.registerLazySingleton<Repository>(() => RepositoryImpl(
        localDataSource: sl(),
        remoteDataSource: sl(),
        networkInfo: sl(),
      ));

  // Data Sources
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(
        client: sl(),
      ));
  // No access to DB provider, job of LocalDataSource to choose which source
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(
        mySharedPref: sl(),
      ));

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton<MySharedPref>(() => MySharedPref(sl()));

  // initializing dio
  final dio = Dio();
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton(() => RestClient(dio, sl()));
  sl.registerLazySingleton(() => DataConnectionChecker());
}
