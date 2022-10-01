import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../busieness_logic/BookingCubit/booking_cubit.dart';
import '../data/Booking/repository/booking_repo.dart';
import '../data/Booking/web_services/booking_webServices.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<BookingCubit>(() => BookingCubit(getIt()));
  getIt.registerLazySingleton<BookingRepo>(() => BookingRepo(getIt()));
  getIt.registerLazySingleton<BookingWebServices>(
          () => BookingWebServices(createAndSetupDio()));
}

Dio createAndSetupDio() {
  Dio dio = Dio();

  dio
    ..options.connectTimeout = 200 * 1000
    ..options.receiveTimeout = 200 * 1000;

  dio.interceptors.add(LogInterceptor(
    responseBody: true,
    error: true,
    requestHeader: false,
    responseHeader: false,
    request: true,
    requestBody: true,
  ));

  return dio;
}