import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hotels_booking_app/presentation/screens/onBoarding_screen.dart';


import 'busieness_logic/bloc_observer.dart';
import 'data/web_services/dio_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}
//
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.teal,
      ),
      home: OnBoardingScreen(),
    );
  }
}

