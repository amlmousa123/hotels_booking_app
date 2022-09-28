import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../data/Filter/models/Filter/Search/hotel.dart';

import '../../../../utils/text_styles.dart';
import '../../../../utils/themes.dart';
import '../../widgets/common_card.dart';
import '../../widgets/hotelCardItem.dart';

class MapHotelListView extends StatelessWidget {
  final VoidCallback callback;
  final Hotel hotelData;

  const MapHotelListView(
      {Key? key, required this.hotelData, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24, right: 8, top: 8, bottom: 16),
      child: CommonCard(
        color: AppTheme.scaffoldBackgroundColor,
        radius: 16,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          child: AspectRatio(
            aspectRatio: 2.7,
            child: Stack(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 0.90,
                      child: Image.asset(
                        baseurl+
                            (hotelData
                                .hotelImages![0].image)!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              hotelData.name!,
                              maxLines: 2,
                              textAlign: TextAlign.left,
                              style:
                              TextStyles(context).getBoldStyle().copyWith(
                                fontSize: 16,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              hotelData.address!,
                              style: TextStyles(context)
                                  .getDescriptionStyle()
                                  .copyWith(
                                fontSize: 14,
                              ),
                            ),
                            Expanded(
                              child: SizedBox(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            FontAwesomeIcons.mapMarkerAlt,
                                            size: 12,
                                            color:
                                            Theme.of(context).primaryColor,
                                          ),
                                          Text(
                                            " ${hotelData.description}",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyles(context)
                                                .getDescriptionStyle()
                                                .copyWith(
                                              fontSize: 14,
                                            ),
                                          ),
                                          // Text(
                                          //   AppLocalizations(context)
                                          //       .of("km_to_city"),
                                          //   overflow: TextOverflow.ellipsis,
                                          //   style: TextStyles(context)
                                          //       .getDescriptionStyle()
                                          //       .copyWith(
                                          //     fontSize: 14,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child:  RatingBarIndicator(
                                          rating: double.parse(hotelData.rate!),
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 19.0,
                                          direction: Axis.horizontal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        "\$${hotelData.price}",
                                        textAlign: TextAlign.left,
                                        style: TextStyles(context)
                                            .getBoldStyle()
                                            .copyWith(
                                          fontSize: 22,
                                        ),
                                      ),
                                      Text(
                                        "per_night",
                                        style: TextStyles(context)
                                            .getDescriptionStyle()
                                            .copyWith(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor:
                    Theme.of(context).primaryColor.withOpacity(0.1),
                    onTap: () {
                      callback();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}