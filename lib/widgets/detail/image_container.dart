import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/widgets/detail/image_reviews.dart';

import '../../constant.dart';

class ImageContainer extends StatelessWidget {
  final String imageUrl;

  const ImageContainer({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.58,
          width: MediaQuery.of(context).size.width,
          child: Align(
            alignment: Alignment.topCenter,
            child: FadeInUp(
              duration: const Duration(milliseconds: 500),
              child: Hero(
                tag: imageUrl,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    child: Image.asset(
                      imageUrl,
                      scale: 4,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 30,
          right: 35,
          child: FadeInUp(
            duration: const Duration(milliseconds: 500),
            child: ClipOval(
              child: Container(
                height: 23,
                width: 23,
                color: kTextColor,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: SvgPicture.asset(
                    'assets/icons/heart.svg',
                  ),
                ),
              ),
            ),
          ),
        ),
        const ImageReviews(),
      ],
    );
  }
}
