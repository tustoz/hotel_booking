import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/constant.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List review = [];
  List facilities = [];

  Future<String> loadJsonData() async {
    var reviewJson = await rootBundle.loadString('lib/json/review.json');
    var facilitiesJson =
        await rootBundle.loadString('lib/json/facilities.json');

    setState(() {
      review = json.decode(reviewJson);
      facilities = json.decode(facilitiesJson);
    });
    return 'success';
  }

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 470,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: FadeInUp(
                      duration: const Duration(milliseconds: 500),
                      child: Image.asset(
                        'assets/images/luxuary-cover.png',
                        scale: 4,
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
                Positioned(
                  top: 365,
                  left: 24,
                  right: 24,
                  child: FadeInUp(
                    duration: const Duration(milliseconds: 700),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 16,
                      ),
                      itemCount: review.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          review[index]['imageUrl'],
                          scale: 4,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            FadeInUp(
              duration: const Duration(milliseconds: 900),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Luxuary Palace', style: nunito23),
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/star.svg'),
                            const SizedBox(width: 4),
                            Text(
                              '5.0',
                              style: nunitoRegular12.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '(545 reviews)',
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
                          r'$400',
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
            ),
            const SizedBox(height: 17),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: FadeInUp(
                duration: const Duration(milliseconds: 1100),
                child: Text(
                  'Facilities',
                  style: nunito16.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Facilities Box
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: FadeInUp(
                duration: const Duration(milliseconds: 1100),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6,
                    crossAxisSpacing: 16,
                  ),
                  itemCount: review.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: kShadeColor,
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: SvgPicture.asset(
                          facilities[index]['svgUrl'],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: FadeInUp(
                duration: const Duration(milliseconds: 1300),
                child: Text(
                  'Description',
                  style: nunito16.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 9),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: FadeInUp(
                duration: const Duration(milliseconds: 1300),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eu\ntincidunt nunc cras integer magna sapien, id egestas. Amet\nfacilisis ac in nunc sed convallis aenean mattis sit. Lacus\ndolor, integer vel suspendisse cum pellentesque ornare\nquis. Mattis ut viverra purus leo elit, et.',
                  style: nunito14,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 77),
              child: FadeInUp(
                duration: const Duration(milliseconds: 1500),
                child: SizedBox(
                  height: 52,
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Book Now'),
                    style: TextButton.styleFrom(
                      primary: kTextColor,
                      backgroundColor: kSecondaryColor,
                      textStyle: nunitoRegular17,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
