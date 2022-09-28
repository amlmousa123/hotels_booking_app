import 'package:bloc/bloc.dart';
import 'package:hotels_booking_app/data/Booking/models/booking_%20model.dart';
import 'package:hotels_booking_app/data/Booking/repository/booking_repo.dart';

import 'booking_states.dart';

class BookingCubit extends Cubit<BookingState> {
  final BookingRepo bookingRepo;
  late Booking booking;

  BookingCubit(this.bookingRepo) : super(InitialBooking());

  void createBooking(int hotelId) {
    bookingRepo.createBooking(hotelId).then((value) {
      emit(BookingCreated(value));
    });
  }

  void updateBooking(int bookingId, String statusType) {
    bookingRepo.updateBookingStatus(bookingId, statusType).then((value) {
      emit(BookingUpdated(value));
    });
  }

  Booking getBooking(String type) {
    bookingRepo.getMyBooking(type, 10).then((booking) {
      emit(BookingLoaded(booking));
      this.booking = booking;
    });
    return booking;
  }
}
