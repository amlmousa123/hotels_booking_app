import 'package:hotels_booking_app/data/models/web_services/web_services.dart';

import '../models/Booking/booking_ model.dart';

class MyRepo {
  final web_service web_services;
  MyRepo(this.web_services);

  Future<List<Booking>>fetch() async {
    final response = await http.get(url);
    return response;
  }
  String url= "https://www.postman.com/collections/";
}
