import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constant.dart';

class DetailInfo extends StatefulWidget {
  final String title;
  final String rawRating;
  final String price;

  const DetailInfo({
    Key? key,
    required this.title,
    required this.rawRating,
    required this.price,
  }) : super(key: key);

  @override
  _DetailInfoState createState() => _DetailInfoState();
}

class _DetailInfoState extends State<DetailInfo> {
  @override
  Widget build(BuildContext context) {
    var rating = widget.rawRating.split(" ");

    return FadeInUp(
      duration: const Duration(milliseconds: 900),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title, style: nunito23),
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/star.svg'),
                        const SizedBox(width: 4),
                        Text(
                          rating[0],
                          style: nunitoRegular12.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          rating[1],
                          style: nunito10.copyWith(
                            color: kAccentColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.price,
                      style: nunito18.copyWith(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      'per night',
                      style: nunito10.copyWith(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        color: kAccentColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 17),
        ],
      ),
    );
  }
}
