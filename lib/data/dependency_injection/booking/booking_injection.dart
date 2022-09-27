import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hotels_booking_app/busieness_logic/Cubit/BookingCubit/booking_cubit.dart';
import 'package:hotels_booking_app/data/repository/Booking/booking_repo.dart';
import 'package:hotels_booking_app/data/web_services/Booking/booking_webServices.dart';

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