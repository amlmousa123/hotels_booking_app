import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_booking_app/busieness_logic/Auth/register_cubit/states.dart';

import '../../../constants/end_points.dart';
import '../../../data/Auth/models/login_model.dart';
import '../../../data/Auth/web_services/dio_helper.dart';




class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;

  void userRegister(
      {required String name,required String email, required String password, required String confirmPassword}) {
    emit(RegisterLoadingState());
    print("email $email password $password name $name  confirm $confirmPassword" );
    DioHelper.postData(url: REGISTER, body: {
      'name':name,
      'email': email,
      'password': password,
      'password_confirmation' : confirmPassword,
    }).then((value) {
      print(value.toString());
      loginModel = LoginModel.fromJson(value.data);
      emit(RegisterSuccessState(loginModel));
    }).catchError((error) {
      print(" erorrrrrrrrrrrrrrrrrrrrrrrr${error.toString()}");
      emit(RegisterErrorState(error.toString()));
    });
  }

}