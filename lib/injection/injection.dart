import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hotels_booking_app/busieness_logic/FilterCubit/cubit.dart';
import '../data/repository/FilterRepo/repository.dart';

import '../data/web_services/FilterWebsevices/web_services.dart';
final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<FilterCubit>(()=> FilterCubit(getIt()));
  getIt.registerLazySingleton<MyRepo>(()=> MyRepo(getIt()));
  getIt.registerLazySingleton<webServices>(()=> webServices(createAndsetupDio()));



}
