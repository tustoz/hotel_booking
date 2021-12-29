import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_booking/constant.dart';
import 'package:hotel_booking/widgets/bottom_bar.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark));
  runApp(const HotelBooking());
}

class HotelBooking extends StatelessWidget {
  const HotelBooking({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hotel_booking',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'NunitoSans',
        scaffoldBackgroundColor: kPrimaryColor,
      ),
      home: const BottomBar(),
    );
  }
}
