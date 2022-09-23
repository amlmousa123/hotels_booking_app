import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hotels_booking_app/presentation/Filter/allFacilties/allFacilitiesScreen.dart';

import 'busieness_logic/FilterCubit/cubit.dart';
import 'injection/injection.dart';

void main() {
  initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create:(context)=>getIt<FilterCubit>() ,
          child: allFacilitiesScreen())
    );
  }
}

