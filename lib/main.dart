import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_booking_app/busieness_logic/BookingCubit/booking_cubit.dart';
import 'package:hotels_booking_app/busieness_logic/FilterCubit/states.dart';
import 'package:hotels_booking_app/data/Auth/web_services/dio_helper.dart';
import 'package:hotels_booking_app/presentation/Auth/Widgets/onBoarding/onBoarding_widget.dart';
import 'busieness_logic/Auth/bloc_observer.dart';
import 'busieness_logic/Auth/register_cubit/cubit.dart';
import 'busieness_logic/FilterCubit/cubit.dart';
import 'busieness_logic/ProfileCubit/cubit.dart';
import 'constants/strings.dart';
import 'data/profile/rebo/profile_rebo.dart';
import 'data/profile/rebo/update_rebo.dart';
import 'injection/injection.dart';

void main() {
  //SharedPreferences.setMockInitialValues({});
  WidgetsFlutterBinding.ensureInitialized();
  initGetIt();
  initGetIt2();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  //CacheHelper.init();
  //WidgetsFlutterBinding.ensureInitialized(); //
}

class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: Duration(seconds:3),
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

          ),
          BlocProvider(
            create: (BuildContext context) => RegisterCubit(),
          ),
          BlocProvider(
            create: (BuildContext context) => ProfileCubit(getIt<ProfileRebo>(),getIt<UpdateRebo>()),
          ),
          BlocProvider(
              create:(context)=>getIt<BookingCubit>()
          ),
        ],
        child: BlocBuilder<FilterCubit,Filterstates>(

            builder: (context,state)

            {return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(

                  primarySwatch: Colors.blue,
                ),
                home: OnBoardingWidget(),

              // HomeExploreScreen( animationController: this.controller,),
              // MapScreen(),
              //HotelHomeScreen()

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