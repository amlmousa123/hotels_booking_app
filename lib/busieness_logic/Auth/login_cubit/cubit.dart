import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_booking_app/busieness_logic/Auth/login_cubit/states.dart';

import '../../../constants/end_points.dart';
import '../../../data/Auth/models/login_model.dart';
import '../../../data/Auth/web_services/dio_helper.dart';




class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;

  void userLogin ({required String email ,required String password}){
    emit(LoginLoadingState()) ;
    DioHelper.postData(url: LOGIN, body:{
      'email' : email,
      'password' : password ,
    }).then((value) {
      loginModel = LoginModel.fromJson(value.data) ;
      emit(LoginSuccessState(loginModel!));
    }).catchError((error){
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }





}