import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_booking_app/busieness_logic/FilterCubit/states.dart';
import 'package:hotels_booking_app/presentation/Filter/screens/Filteration/FilterationScreen.dart';
import 'package:hotels_booking_app/presentation/Filter/screens/home/home_screen.dart';

import 'package:hotels_booking_app/presentation/Filter/screens/searchHotels/SearchScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'busieness_logic/FilterCubit/cubit.dart';
import 'injection/injection.dart';

void main() {
  SharedPreferences.setMockInitialValues({});
  WidgetsFlutterBinding.ensureInitialized();
  initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers:[
        BlocProvider(
        create:(context)=>getIt<FilterCubit>()..emitGetAllFacilities()
            ..getAllhotels()
    )],
    child: BlocBuilder<FilterCubit,Filterstates>(

    builder: (context,state)

    {return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(

            primarySwatch: Colors.blue,
          ),
          home:
          home_screen());

    }
    )
    );

  }
}

// BlocProvider(
// create:(context)=>getIt<FilterCubit>() ,
// child: FilterationScreen()
// ));