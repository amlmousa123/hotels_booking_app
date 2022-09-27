import 'package:hotels_booking_app/data/models/Booking/booking_%20model.dart';
import 'package:hotels_booking_app/data/web_services/Booking/booking_webServices.dart';

import '../../models/response_model.dart';

class BookingRepo {
  final BookingWebServices bookingWebServices;

  BookingRepo(this.bookingWebServices);

  Future<StatusResponse> createBooking(int hotelId) async {
    return await bookingWebServices.createBooking(
        token:
            'Bearer DnkaEA2eU1DNZmKIpx5I7u6ptaKeEGAA1nq4bFkClgBsYsWLyTMNsJD7O06u',
        hotelId: hotelId);
  }

  Future<StatusResponse> updateBookingStatus(
      int bookingId, String bookingType) async {
    return await bookingWebServices.updateBookingStatus(
        bookingId: bookingId, type: bookingType);
  }

  Future<Booking> getMyBooking(String bookingType, int count) async {
    return await bookingWebServices.getMyBooking(
      bookingType,
      count,
      'Bearer DnkaEA2eU1DNZmKIpx5I7u6ptaKeEGAA1nq4bFkClgBsYsWLyTMNsJD7O06u',
    );
  }
}