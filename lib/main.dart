import 'package:flutter/material.dart';
import 'data/models/Booking/booking_ model.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final Future <List<Booking>> booking;
  MyApp ({Key key, required this.booking}) :super

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
     // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

