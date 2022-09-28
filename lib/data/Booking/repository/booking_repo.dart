
import 'package:hotels_booking_app/data/Booking/models/booking_%20model.dart';
import 'package:hotels_booking_app/data/Booking/models/response_model.dart';
import 'package:hotels_booking_app/data/Booking/web_services/booking_webServices.dart';

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
