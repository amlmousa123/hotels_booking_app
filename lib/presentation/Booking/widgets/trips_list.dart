import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hotels_booking_app/busieness_logic/BookingCubit/booking_states.dart';
import 'package:hotels_booking_app/constants/colors.dart';

import '../../../busieness_logic/BookingCubit/booking_cubit.dart';
import '../../../data/Booking/models/booking_ model.dart';
import '../../Filter/widgets/hotelCardItem.dart';

class TripsList extends StatefulWidget {
  final String typeOfTrips;
  TripsList({
    Key? key,
    required this.typeOfTrips,
  }) : super(key: key);

  @override
  State<TripsList> createState() => _TripsListState();
}

class _TripsListState extends State<TripsList> {
  late List<BookingData> bookings;

  @override
  void initState() {
    BlocProvider.of<BookingCubit>(context).getBooking(widget.typeOfTrips);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(builder: (context, state) {
      if (state is BookingLoaded) {
        bookings = BlocProvider.of<BookingCubit>(context).getBooking(widget.typeOfTrips).data.data;
        return Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.separated(
              itemBuilder: (context, index) => buildTripItem(bookings[index]),
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemCount: bookings.length),
        ));
      } else {
        return Container();
      }
    });
  }

  Widget buildTripItem(BookingData bookingItem) {
    String? dopDownValue;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        children: [
          Image(
            image: NetworkImage(
              baseurl + (bookingItem.hotel.hotelImages![0].image).toString(),
            ),
            width: double.infinity,
            height: 200.0,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children:  [
                    Expanded(
                      child: Text(
                        bookingItem.hotel.name.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      bookingItem.hotel.price.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children:  [
                    Icon(
                      Icons.star_rate_rounded,
                      color: Colors.amber,
                      size: 24,
                    ),
                    Text(
                      bookingItem.hotel.rate.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),


    );
  }

  Widget buildStarsRateBar(double value) {
    return RatingBarIndicator(
      rating: value,
      itemBuilder: (context, index) => Icon(
        Icons.star,
        color: MyColors.myGreen,
      ),
      itemCount: 5,
      itemSize: 19.0,
      direction: Axis.horizontal,
    );
  }
}
