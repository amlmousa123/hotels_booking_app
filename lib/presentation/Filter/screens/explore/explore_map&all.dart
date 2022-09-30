import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



import '../../widgets/NoHotelsFound.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../busieness_logic/FilterCubit/cubit.dart';
import '../../../../busieness_logic/FilterCubit/states.dart';
import '../../../../compnents/filter_bar_UI.dart';
import '../../../../compnents/map_and_list_view.dart';
import '../../../../data/Filter/models/Filter/Search/hotel.dart';
import '../../../../data/Filter/models/Filter/Search/hotelsSearch_model.dart';

import 'package:provider/provider.dart';

import '../../../../injection/injection.dart';
import '../../../../utils/text_styles.dart';
import '../../../../utils/themes.dart';
import '../../widgets/common_card.dart';
import '../../widgets/common_search_bar.dart';
import '../../widgets/hotelCardItem.dart';
import '../../widgets/hotel_list_view.dart';
import '../../widgets/remove_focus.dart';
import '../../widgets/searchField.dart';
import '../Filteration/FilterationScreen.dart';
import '../searchHotels/SearchScreen.dart';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class HotelHomeScreen extends StatefulWidget {
  @override
  _HotelHomeScreenState createState() => _HotelHomeScreenState();
}

class _HotelHomeScreenState extends State<HotelHomeScreen>
    with TickerProviderStateMixin {
  late Marker searchedPlaceMarker;
  late Marker currentLocationMarker;
  var progressIndicator = false;
  late List<LatLng> polylinePoints;
  var isSearchedPlaceMarkerClicked = false;
  var isTimeAndDistanceVisible = false;
  late CameraPosition goToSearchedForPlace;
  Completer<GoogleMapController> _mapController = Completer();


  late AnimationController animationController;
  late AnimationController _animationController;
  List<Hotel> hotelList =[];
  ScrollController scrollController = new ScrollController();
  int room = 1;
  int ad = 2;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(Duration(days: 5));
  bool _isShowMap = false;

  final searchBarHieght = 158.0;
  final filterBarHieght = 52.0;
  @override
  void initState() {
    // getIt<FilterCubit>()
    //   ..getAllhotels();
    animationController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    _animationController =
        AnimationController(duration: Duration(milliseconds: 0), vsync: this);
    scrollController.addListener(() {
      if (scrollController.offset <= 0) {
        _animationController.animateTo(0.0);
      } else if (scrollController.offset > 0.0 &&
          scrollController.offset < searchBarHieght) {
        // we need around searchBarHieght scrolling values in 0.0 to 1.0
        _animationController
            .animateTo((scrollController.offset / searchBarHieght));
      } else {
        _animationController.animateTo(1.0);
      }
    });
    super.initState();
  }

  Future<bool> getData() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          RemoveFocuse(
            onClick: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: BlocBuilder<FilterCubit, Filterstates>(
            builder: (context, state) {
    if (BlocProvider
        .of<FilterCubit>(context)
        .allHotels
        .data
        ?.hotelsList
        ?.isNotEmpty == true) {
    hotelList=(BlocProvider.of<FilterCubit>(context).allHotels.data ?.hotelsList)!;
             return Column(
                children: <Widget>[
                  _getAppBarUI(),
                  _isShowMap
                      ? MapAndListView(
                    hotelList: hotelList,

                  )
                      :   Expanded(
                        child: BlocBuilder<FilterCubit, Filterstates>(
                        builder: (context, state) {
                          if (FilterCubit
                              .FilteredHotels
                              .data
                              ?.hotelsList
                              ?.isNotEmpty==true)
                          {
                            return ListView.builder(
                                shrinkWrap: true,
                               // physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.all(8),
                                itemCount: FilterCubit
                                    .FilteredHotels
                                    .data
                                    ?.hotelsList
                                    ?.length,
                                itemBuilder: (BuildContext cxt, int index) {
                                  return HotelCardItem(
                                    hotel: (FilterCubit
                                        .FilteredHotels
                                        .data
                                        ?.hotelsList![index])!,
                                  );
                                });
                          } else return NoHotelsFound(message:'No Hotels Found',image: "assets/images/hotel.svg",);
                        }),
                      )
                ],
              );
    } else return CircularProgressIndicator();
            })
          ),
        ],
      ),
    );
  }


  Widget _getAppBarUI() {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top, left: 8, right: 8),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                alignment:
                Alignment.centerLeft,
                width: AppBar().preferredSize.height + 40,
                height: AppBar().preferredSize.height,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.all(
                      Radius.circular(32.0),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                ),
              ),
              const Expanded(
                child: Center(
                  child: Text(
                   "Explore",
                    style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: AppBar().preferredSize.height + 40,
                height: AppBar().preferredSize.height,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.all(
                              Radius.circular(32.0),
                            ),
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.favorite_border),
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.all(
                              Radius.circular(32.0),
                            ),
                            onTap: () {

                              setState(() {
                                _isShowMap = !_isShowMap;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(_isShowMap
                                  ? Icons.sort
                                  : FontAwesomeIcons.mapMarkedAlt),
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 5,
                child:
                SearchField(
                    isenabled: false,
                    // controller:
                    //     BlocProvider.of<FilterCubit>(context)
                    //         .searchcontroller,
                    onchanged: (searchedhotels) {
                      // BlocProvider.of<FilterCubit>(context)
                      //     .searchedfunc(searchedhotels);
                    },
                    hintText: "Search Hotels",
                    prefixIcon: Icon(Icons.search)),
                // CommonSearchBar(
                //   iconData: FontAwesomeIcons.search,
                //   enabled: false,
                //   text: "Search Hotels",
                // height: 50,
                // ),
              ),
              Expanded(
                child: MaterialButton(
                  height: 45,
                  shape: CircleBorder(),
                  //padding: EdgeInsets.all(24),

                  color: Colors.green,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => searchScreen()),
                    );
                  },
                  child: Center(
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      )),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          _isShowMap==false?
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FilterationScreen()),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text("Filter"),
                Icon(
                  Icons.filter_list_alt,
                  color: Colors.green,
                )
              ],
            ),
          ):Container(),
        ],
      ),
    );
  }
}