import 'package:flutter/material.dart';
import 'package:hotels_booking_app/data/models/login_model.dart';

class HomeScreen extends StatelessWidget {
  final LoginModel? loginModel ;
  const HomeScreen({Key? key,  this.loginModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('done'),
        ],
      ),
    );
  }
}
