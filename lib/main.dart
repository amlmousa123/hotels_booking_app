import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_booking_app/busieness_logic/FilterCubit/states.dart';
import 'package:hotels_booking_app/presentation/Filter/screens/Filteration/FilterationScreen.dart';
import 'package:hotels_booking_app/presentation/Filter/screens/explore/explore_map&all.dart';
import 'package:hotels_booking_app/presentation/Filter/screens/explore/explore_screen.dart';
import 'package:hotels_booking_app/presentation/Filter/screens/home/home_explore_screen.dart';
import 'package:hotels_booking_app/presentation/Filter/screens/map/map_screen.dart';


import 'package:hotels_booking_app/presentation/Filter/screens/searchHotels/SearchScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'busieness_logic/FilterCubit/cubit.dart';
import 'injection/injection.dart';

void main() {
  //SharedPreferences.setMockInitialValues({});
 // WidgetsFlutterBinding.ensureInitialized();
  initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: Duration(seconds: 5),
    );
  }
  @override
  Widget build(BuildContext context) {
    FilterCubit.getpref();
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
          HomeExploreScreen( animationController: this.controller,),
        // MapScreen(),
      // HotelHomeScreen()

    );

    }
    )
    );

  }
}

// BlocProvider(
// create:(context)=>getIt<FilterCubit>() ,
// child: FilterationScreen()
// ));