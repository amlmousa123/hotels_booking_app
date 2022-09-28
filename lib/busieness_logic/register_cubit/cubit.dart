import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_booking_app/busieness_logic/register_cubit/states.dart';
import 'package:hotels_booking_app/data/models/login_model.dart';

import '../../constants/end_points.dart';
import '../../data/web_services/dio_helper.dart';



class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;

  void userRegister(
      {required String email, required String password, required String confirmPassword}) {
    emit(RegisterLoadingState());
    DioHelper.postData(url: REGISTER, body: {
      'email': email,
      'password': password,
      'confirmPassword' : confirmPassword,
    }).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      emit(RegisterSuccessState(loginModel!));
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
    });
  }

}