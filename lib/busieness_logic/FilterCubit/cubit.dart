import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hotels_booking_app/busieness_logic/FilterCubit/states.dart';

import 'package:hotels_booking_app/presentation/Filter/screens/searchHotels/SearchScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/Filter/models/Filter/Get facilities/facilities_model.dart';
import '../../data/Filter/models/Filter/Search/hotelsSearch_model.dart';
import '../../data/Filter/repository/FilterRepo/repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
class FilterCubit extends Cubit<Filterstates> {
  SfRangeValues pricevalues = SfRangeValues(0.0, 6000);
 SharedPreferences? prefs;
  FilterCubit(this.myrepo) : super(initialhotelstate());
  static FilterCubit get(context) => BlocProvider.of(context);
  static bool isShowMap=false;
  final searchcontroller=TextEditingController();
   List<bool> isswitchedlist=[];
  hotelsSearch allHotels=new hotelsSearch();
  static hotelsSearch FilteredHotels=new hotelsSearch();
  List adresses=['Not selected','rome','tanta'];
  String selectedAdresse='Not selected';
  static hotelsSearch searchedhotels=new hotelsSearch();
  MyRepo myrepo;
  getFacilities? facilities;
  static String? lastsearches=null;
  static savepref(String lastsearches)async{
    print("from savepref2");
    SharedPreferences prefs= await SharedPreferences.getInstance();
    
       prefs.setString("lastSearched", lastsearches);
       print("from savepref");
       print(prefs.get("lastSearched"));
     

 

  }
  static getpref()async{


       SharedPreferences prefs= await SharedPreferences.getInstance();
    lastsearches=prefs.getString("lastSearched");
    if( lastsearches!=null)
    {
     searchedhotels= hotelsSearch.fromJson(jsonDecode( lastsearches!));
     print("from getpref");
     print(lastsearches?.isNotEmpty.toString());
     print(searchedhotels.data?.hotelsList?.length);
    }

  }
 void getAllhotels(){
myrepo.getAllHotels().then((value) {
      allHotels=value;
      FilteredHotels=value;

      emit(getAllHotelsState());

});


 }
 void loadSharedpref(String lastsearched)
 {
 // searchedhotels= lastsearched;
 }
 void gethotelsbyFilter({var facility1=null,var facility2=null, var pricevalues=null , String? selectedcity}){
 if(selectedcity=="Not selected") {
   selectedcity=null;
 }

   emitGetsearchedHotels(facilities1:facility1,facilities2: facility2,maxprice: pricevalues.end,
       minprice: pricevalues.start,address: selectedcity );



 }
  void searchedfunc(var searchedHotel) {
    if (searchcontroller.text.isNotEmpty) {
    print("from search");
    print(searchcontroller.text);
    print(searchedHotel);

    myrepo.searchHotels(name: searchedHotel).then((searchedHotels) {
      searchedhotels = searchedHotels;
      print("jjjllllllllllllll");

        savepref(jsonEncode(searchedHotels));

      print(searchedhotels.data?.hotelsList?.length);
      emit(searchHotelsState(searchedhotels));
    }
    );
  }
  }

  void emitGetAllFacilities()
  {
    myrepo.getAllFacilities().then((facilitiess) {
     facilities=facilitiess;
      int? size=facilities?.data?.length;
     isswitchedlist = List<bool>.filled((size)!, false, growable: true);
      emit(getAllFacilitiesState(facilities!));
      
      
    });


  }
  void onOroffFacility (int index,bool value)
  {
    isswitchedlist[index]=value;
    emit(updateFacilityState());
  }
  void updatepriceslider (SfRangeValues values)
  {
   pricevalues=values;
    emit(updatepricesliderState());
  }
  void updateaddress (String selected)
  {
   selectedAdresse=selected;
    emit(updateaddressState());
  }
  void showMap(bool isShow)
  {
    isShowMap=isShow;
    emit(ShowMapState());

  }
  void emitGetsearchedHotels(
      {var name=null,
      var address=null,
      var maxprice=null,
      var minprice=null,
      var facilities1=null,
      var facilities2=null,
      var latitude=null,
      var longitude=null,
      var distance=null,
      var count=null,
      var page=null,
}
      )
  {

    myrepo.searchHotels(
     name: name,
      address:address,
      maxprice:maxprice,
      minprice:minprice,
      facilities1:facilities1,
      facilities2: facilities2,
      latitude:latitude,
      longitude:longitude,
      distance:distance,
      count:count,
      page:page,
    ).then((filterdhotels) {


      FilteredHotels=filterdhotels;
      emit(getAllHotelsState());
     // emit(searchHotelsState(searchedhotels));


    });


  }

}