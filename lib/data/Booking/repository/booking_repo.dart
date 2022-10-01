
import 'package:hotels_booking_app/data/Booking/models/booking_%20model.dart';
import 'package:hotels_booking_app/data/Booking/models/response_model.dart';
import 'package:hotels_booking_app/data/Booking/web_services/booking_webServices.dart';

class BookingRepo {
  final BookingWebServices bookingWebServices;

  BookingRepo(this.bookingWebServices);

  Future<StatusResponse> createBooking(int hotelId) async {
    return await bookingWebServices.createBooking(
        token:
            '4JW2g2z2RjKCnBFEGY42VqphuNuhzw8y9jbhwU73ypb6RbN2If26kMnyQM0P',
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
      '4JW2g2z2RjKCnBFEGY42VqphuNuhzw8y9jbhwU73ypb6RbN2If26kMnyQM0P',
    );
  }
}
