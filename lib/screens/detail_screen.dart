import 'package:flutter/material.dart';
import 'package:hotel_booking/widgets/detail/image_container.dart';
import 'package:hotel_booking/widgets/detail/detail_info.dart';
import 'package:hotel_booking/widgets/detail/description.dart';
import 'package:hotel_booking/widgets/detail/facilities.dart';
import 'package:hotel_booking/widgets/detail/custom_button.dart';

class DetailScreen extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String rawRating;
  final String price;

  const DetailScreen(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.rawRating,
      required this.price})
      : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            ImageContainer(imageUrl: widget.imageUrl),
            DetailInfo(
              title: widget.title,
              rawRating: widget.rawRating,
              price: widget.price,
            ),
            const Facilities(),
            const Description(),
            const CustomButton(),
          ],
        ),
      ),
    );
  }
}
