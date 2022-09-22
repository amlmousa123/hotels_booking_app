import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_booking_app/busieness_logic/FilterCubit/cubit.dart';
import 'package:hotels_booking_app/busieness_logic/FilterCubit/states.dart';


import 'package:hotels_booking_app/data/models/Filter/Search/hotelsSearch_model.dart';

import '../../../busieness_logic/FilterCubit/cubit.dart';
import '../../../busieness_logic/FilterCubit/states.dart';
import '../../../data/models/Filter/Get facilities/facilities_model.dart';
class allFacilitiesScreen extends StatefulWidget {
  @override
  _allFacilitiesScreenState createState() => _allFacilitiesScreenState();
}

class _allFacilitiesScreenState extends State<allFacilitiesScreen> {
  getFacilities? allfacilties;
  hotelsSearch? searchedhotels;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<FilterCubit>(context).emitGetAllFacilities();
    print("fac[0]");
   //BlocProvider.of<FilterCubit>(context).emitGetsearchedHotels(facilities1: 3,facilities2: 4);

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          BlocBuilder<FilterCubit,Filterstates>(builder: (context,state){
                  if(state is getAllFacilitiesState)
                   {
                     allfacilties=(state).allfacilities;

                    return ListView.builder(
                      shrinkWrap: true,
                        padding: EdgeInsets.all(8),
                        itemCount: allfacilties?.data?.length,
                        itemBuilder: (BuildContext cxt, int index)
                    {
                      return Container(
                        height: 50,
                    child:

                    Center(child: Image.network((allfacilties?.data![index].image)!)),
                      );
                    }

                    );
                   }

                  else if (state is searchHotelsState)
                    {
                      searchedhotels=(state).searchedHotels;

                      return ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.all(8),
                          itemCount: searchedhotels?.data?.hotelsList?.length,
                          itemBuilder: (BuildContext cxt, int index)
                          {
                            return Container(
                              height: 50,
                              child:

                              Center(child: Text((searchedhotels?.data?.hotelsList![index].name)!)),
                            );
                          }

                      );

                    }

                  else return CircularProgressIndicator();



          })

        ],

      ),


    );
  }
}
