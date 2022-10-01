import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hotels_booking_app/busieness_logic/BookingCubit/booking_states.dart';
import 'package:hotels_booking_app/constants/colors.dart';

import '../../../busieness_logic/BookingCubit/booking_cubit.dart';
import '../../../data/Booking/models/booking_ model.dart';

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
        bookings = (state).booking.data.data;
        return Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.separated(
              itemBuilder: (context, index) => buildTripItem(bookings[index]),
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemCount: 5),
        ));
      } else {
        return Container();
      }
    });
  }

  Widget buildTripItem(BookingData bookingItem) {
    String? dopDownValue;
    return Container(
      height: 300, //
      width: double.infinity,
      child: Card(
        elevation: 3.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Hero(
            tag: Text('name'),
            child: Material(
              child: InkWell(
                onTap: () {},
                child: Stack(children: [
                  GridTile(
                      footer: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    bookingItem.hotel.name.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    bookingItem.hotel.price.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        bookingItem.hotel.address.toString(),
                                        //widget.hotelData.subTxt,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: MyColors.myGery,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Icon(
                                        FontAwesomeIcons.mapMarkerAlt,
                                        size: 12,
                                        color: MyColors.myGreen,
                                      ),
                                      Text(
                                        '2.0',
                                        // "${widget.hotelData.dist.toStringAsFixed(1)}",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: MyColors.myGery,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'km to city',
                                          //  AppLocalizations(context).of("km_to_city"),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: MyColors.myGery,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '/per night',
                                    style: TextStyle(
                                      color: MyColors.myGery,
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              buildStarsRateBar(3.5),
                            ],
                          ),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          bookingItem.hotel.hotelImages![0].image.toString(),
                          fit: BoxFit.cover,
                        ),
                      )),
                  // Align(
                  //   alignment: AlignmentDirectional.topEnd,
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(10),
                  //     child: DropdownButton<String>(
                  //       value: dopDownValue,
                  //       onChanged: (String? newValue) {
                  //         BlocProvider.of<BookingCubit>(context).updateBooking(
                  //             bookingItem.id, newValue.toString());
                  //       },
                  //       icon: Container(
                  //         width: 40,
                  //         height: 40,
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(10),
                  //           color: MyColors.myWhite,
                  //         ),
                  //         child: Icon(
                  //           Icons.change_circle_outlined,
                  //           size: 30,
                  //           color: MyColors.myGreen,
                  //         ),
                  //       ),
                  //       items: <String>['upcomming', 'cancelled', 'completed']
                  //           .map((String value) {
                  //         return DropdownMenuItem<String>(
                  //           value: value,
                  //           child: Container(
                  //               width: double.infinity,
                  //               decoration: BoxDecoration(
                  //                   borderRadius: BorderRadius.circular(30),
                  //                   color: MyColors.myGreen),
                  //               child: Text(
                  //                 value,
                  //                 textAlign: TextAlign.center,
                  //               )),
                  //         );
                  //       }).toList(),
                  //     ),
                  //   ),
                  // )
                ]),
              ),
            )),
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
