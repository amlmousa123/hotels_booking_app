import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


import '../../../data/Filter/models/Filter/Search/hotel.dart';
String baseurl="http://api.mahmoudtaha.com/images/";
class HotelCardItem extends StatelessWidget {
  HotelCardItem({
    Key?key,


    required this.hotel


  }):super(key:key);

  final Hotel hotel;
//  final void Function(String)? onchanged;
  @override
  Widget build(BuildContext context) {

    return  Card(

      color: Colors.white24,
      child: AspectRatio(
        aspectRatio: 2.7,
        child: Stack(
          children: [
            Row(
              children: [

                AspectRatio(
                    aspectRatio: 0.9,
                    child:
                  hotel
                        .hotelImages?.length!=0?
                    Image.network(

                          baseurl+
                              (hotel
                          .hotelImages![0].image)!

                      , fit: BoxFit.cover,
                    ):
                    Container()
                ),
                Expanded(child:
                Container(
                  color: Colors.white60,
                  padding: EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment
                        .start,
                    crossAxisAlignment: CrossAxisAlignment
                        .start,
                    children: [
                      Text(
                          (hotel
                              .name)!

                      ),
                      Expanded(child: Container(),),
                      RatingBarIndicator(
                        rating: double.parse(hotel.rate!),
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 19.0,
                        direction: Axis.horizontal,
                      ),

                    ],

                  ),
                )
                )
              ],
            )

          ],
        ),

      ),
      elevation: 5.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)

      ),
    );
  }
}
