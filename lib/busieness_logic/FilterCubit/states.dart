import 'package:hotels_booking_app/data/models/Filter/Get%20facilities/facilitiesData_model.dart';
import 'package:hotels_booking_app/data/models/Filter/Get%20facilities/facilities_model.dart';
import 'package:hotels_booking_app/data/models/Filter/Search/hotelsSearch_model.dart';

abstract class Filterstates {}
class initialhotelstate extends Filterstates{}
class getAllFacilitiesState extends Filterstates{

  final getFacilities facilities;
  getAllFacilitiesState(this.facilities);


}
class updateFacilityState extends Filterstates{

//List<bool> isswitchedList;
  //updateFacilityState(this.isswitchedList);


}
class updatepricesliderState extends Filterstates{



}
class updateaddressState extends Filterstates{



}
class searchHotelsState extends Filterstates{
  final hotelsSearch searchedHotels ;

  searchHotelsState(this.searchedHotels);


}
class getAllHotelsState extends Filterstates{}
class getFilterdHotelsState extends Filterstates{}
class ShowMapState extends Filterstates{}