import 'package:hotels_booking_app/busieness_logic/FilterCubit/states.dart';

import '../../data/repository/FilterRepo/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class FilterCubit extends Cubit<Filterstates> {
  FilterCubit(this.myrepo) : super(initialhotelstate());
  static FilterCubit get(context) => BlocProvider.of(context);
  MyRepo myrepo;
  void emitGetAllFacilities()
  {
    myrepo.getAllFacilities().then((facilities) {

      emit(getAllFacilitiesState(facilities));
      
      
    });


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
      name,
      address,
      maxprice,
       minprice,
       facilities1,
       facilities2,
      latitude,
      longitude,
      distance,
      count,
      page,
    ).then((searchedhotels) {

      emit(searchHotelsState(searchedhotels));


    });


  }

}