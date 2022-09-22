import 'dart:convert';

import 'package:hotels_booking_app/data/models/Filter/Search/hotelsSearch_model.dart';
import '../../web_services/FilterWebsevices/web_services.dart';

import '../../models/Filter/Get facilities/facilities_model.dart';

class MyRepo{
  final webServices WebService;

  MyRepo(this.WebService);
  Future<getFacilities> getAllFacilities()async{

 var response= await WebService.getAllFacilities();
return response;
  }

  Future<hotelsSearch> searchHotels(
      var name,
  var address,
  var maxprice,
  var minprice,
  var facilities1,
  var facilities2,
  var latitude,
  var longitude,
  var distance,
  var count,
  var page,


      )async{

    var response= await WebService.searchHotels(name,address,
      maxprice,minprice,facilities1,facilities2,
       latitude,longitude,distance,count,page
    );
   // jsonEncode(response);
    return response;

  }

}