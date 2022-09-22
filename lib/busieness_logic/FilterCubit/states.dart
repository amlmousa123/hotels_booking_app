import 'package:hotels_booking_app/data/models/Filter/Get%20facilities/facilitiesData_model.dart';
import 'package:hotels_booking_app/data/models/Filter/Get%20facilities/facilities_model.dart';
import 'package:hotels_booking_app/data/models/Filter/Search/hotelsSearch_model.dart';

abstract class Filterstates {}
class initialhotelstate extends Filterstates{}
class getAllFacilitiesState extends Filterstates{
  final getFacilities allfacilities ;

  getAllFacilitiesState(this.allfacilities);


}
class searchHotelsState extends Filterstates{
  final hotelsSearch searchedHotels ;

  searchHotelsState(this.searchedHotels);


}