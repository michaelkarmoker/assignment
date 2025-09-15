
import 'package:assignment/features/shopping/logic/shopping_cubit.dart';
import 'package:assignment/features/shopping/repository/shopping_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';


import '../api/datasource/remote/dio/dio_client.dart';
import '../api/datasource/remote/dio/logging_interceptor.dart';




import '../features/nav_bar/logic/navbar_cubit.dart';
import 'appconstant.dart';


final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
  sl.registerLazySingleton(() => DioClient(AppConstants.baseUrl, sl(), loggingInterceptor: sl()));

  // Core
  //sl.registerLazySingleton(() => DioClient(AppConstants.baseUrl, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));



  sl.registerFactory(() => NavbarCubit( ));
  sl.registerFactory(() => ShoppingRepository(dioClient: sl() ));
  sl.registerFactory(() => ShoppingCubit(shoppingRepository: sl() ));








}
