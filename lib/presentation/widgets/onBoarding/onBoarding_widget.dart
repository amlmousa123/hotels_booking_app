import 'package:flutter/material.dart';
import 'package:hotels_booking_app/presentation/widgets/onBoarding/page1.dart';
import 'package:hotels_booking_app/presentation/widgets/onBoarding/page2_widget.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Container(
            child: IntroductionScreen(),
          ),
          Container(
            child:Page1(),
          )

        ],
      ),
    );
  }
}
