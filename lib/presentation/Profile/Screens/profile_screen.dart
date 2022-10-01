import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../busieness_logic/ProfileCubit/cubit.dart';
import '../Widgets/Profile_widget.dart';
class Profile_screen extends StatefulWidget {
  const Profile_screen({Key? key}) : super(key: key);

  @override
  State<Profile_screen> createState() => _Profile_screenState();
}

class _Profile_screenState extends State<Profile_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ProfileCubit>(context).getprofileinfo("dHlbidFF9j1tptoFhvFM8VlQzqrW428SwVULIoqwvSwamZJ1B0csMMr13xvT");
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    BlocProvider.of<ProfileCubit>(context).getprofileinfo("dHlbidFF9j1tptoFhvFM8VlQzqrW428SwVULIoqwvSwamZJ1B0csMMr13xvT");
  }
  @override
  Widget build(BuildContext context) {
    return Profile_Widget();
  }
}
