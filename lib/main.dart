import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_booking_app/busieness_logic/FilterCubit/states.dart';
import 'package:hotels_booking_app/presentation/Filter/screens/home/home_explore_screen.dart';



import 'busieness_logic/Auth/bloc_observer.dart';
import 'busieness_logic/FilterCubit/cubit.dart';
import 'data/Auth/web_services/cache_helper.dart';
import 'data/Auth/web_services/dio_helper.dart';
import 'injection/injection.dart';

Future<void> main() async {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
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