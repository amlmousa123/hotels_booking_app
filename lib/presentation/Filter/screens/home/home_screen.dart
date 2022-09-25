import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../busieness_logic/FilterCubit/cubit.dart';
import '../../../../busieness_logic/FilterCubit/states.dart';
import '../../widgets/hotelCardItem.dart';
import '../../widgets/searchField.dart';
import '../Filteration/FilterationScreen.dart';
import '../../widgets/NoHotelsFound.dart';
import '../searchHotels/SearchScreen.dart';

class home_screen extends StatefulWidget {
  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<FilterCubit>(context).getAllhotels();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              onPressed: () {},
                              icon: Icon(Icons.arrow_back)),
                          const Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Explore",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Icon(Icons.map_outlined)
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 5,
                            child: SearchField(
                              isenabled: false,
                                // controller:
                                //     BlocProvider.of<FilterCubit>(context)
                                //         .searchcontroller,
                                onchanged: (searchedhotels) {
                                  BlocProvider.of<FilterCubit>(context)
                                      .searchedfunc(searchedhotels);
                                },
                                hintText: "Search Hotels",
                                prefixIcon: Icon(Icons.search)),
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
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
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
                      ),
                      BlocBuilder<FilterCubit, Filterstates>(
                          builder: (context, state) {
                             if (BlocProvider.of<FilterCubit>(context)
                                 .allHotels
                                 .data
                                 ?.hotelsList
                                 ?.isNotEmpty==true) {
                               return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.all(8),
                            itemCount: BlocProvider.of<FilterCubit>(context)
                                .allHotels
                                .data
                                ?.hotelsList
                                ?.length,
                            itemBuilder: (BuildContext cxt, int index) {
                              return HotelCardItem(
                                hotel: (BlocProvider.of<FilterCubit>(context)
                                    .allHotels
                                    .data
                                    ?.hotelsList![index])!,
                              );
                            });
                             } else return NoHotelsFound(message:'No Hotels Found',image: "assets/images/hotel.svg",);
                      })
                    ])))));
  }
}
