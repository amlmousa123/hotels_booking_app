
import 'package:bloc/bloc.dart';
import 'package:hotels_booking_app/busieness_logic/ProfileCubit/states.dart';

import '../../data/profile/models/profile_info.dart';
import '../../data/profile/rebo/profile_rebo.dart';
import '../../data/profile/rebo/update_rebo.dart';


class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRebo profileRebo;
  final UpdateRebo updateRebo;



late Profile_info profile_info;

  ProfileCubit(ProfileState initialState, this.profileRebo, this.updateRebo) : super(initialState);



  void updateprofileinfo(String token, String name, String email, String image) {
    updateRebo.getUpdateresponse(token,name,email,image).then((value) {
      emit(ProfileUpdate(value));
    });
  }

  Profile_info getprofileinfo(String token) {
    profileRebo.getProfileInfo(token).then((profile) {
      emit(ProfileInfoLoaded(profile));
     this.profile_info =profile;
    });
    return profile_info;
  }
}