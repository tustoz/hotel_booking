import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/constant.dart';
import 'package:hotel_booking/screens/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List chip = [];
  List popular = [];
  List nearby = [];

  Future<String> loadJsonData() async {
    var chipJson = await rootBundle.loadString('lib/json/chip.json');
    var popularJson = await rootBundle.loadString('lib/json/popular.json');
    var nearbyJson = await rootBundle.loadString('lib/json/nearby.json');

    setState(() {
      chip = json.decode(chipJson);
      popular = json.decode(popularJson);
      nearby = json.decode(nearbyJson);
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
            //menu & profile header
            FadeInUp(
              duration: const Duration(milliseconds: 500),
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 24, right: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset('assets/icons/menu.svg'),
                    Image.asset('assets/images/profile.png', scale: 4),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 11),
            // header text
            FadeInUp(
              duration: const Duration(milliseconds: 500),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Find a perfect', style: nunitoRegular17),
                    Text('Hotel for you', style: nunito26),
                    const SizedBox(height: 9),
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/location.svg'),
                        const SizedBox(width: 5),
                        Text(
                          'United States',
                          style: nunito14.copyWith(fontFamily: 'Roboto'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),
            FadeInUp(
              duration: const Duration(milliseconds: 700),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Container(
                      height: 44,
                      width: MediaQuery.of(context).size.width - 109,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        border: Border.all(color: kShadeColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search Hotel',
                            icon: SvgPicture.asset('assets/icons/search.svg'),
                            border: InputBorder.none,
                            hintStyle:
                                nunitoRegular12.copyWith(color: kAccentColor),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 17),
                    Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(11),
                        child: SvgPicture.asset('assets/icons/option.svg'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 19),
            SizedBox(
              height: 36,
              child: Padding(
                padding: const EdgeInsets.only(left: 24),
                child: FadeInUp(
                  duration: const Duration(milliseconds: 700),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: chip.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 18),
                        child: Chip(
                          elevation: 0,
                          label: Text(chip[index]['label'], style: nunito16),
                          labelStyle: nunito16,
                          backgroundColor: kShadeColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 7,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 23),
            FadeInUp(
              duration: const Duration(milliseconds: 900),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Most Popular', style: nunito18),
                    Row(
                      children: [
                        Text('See all', style: nunito14),
                        const SizedBox(width: 6.5),
                        SvgPicture.asset('assets/icons/chevron-right.svg'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 13),
            FadeInUp(
              duration: const Duration(milliseconds: 1100),
              child: SizedBox(
                height: 239,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: popular.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: SizedBox(
                          height: 239,
                          width: 178,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const DetailScreen(),
                                ),
                              );
                            },
                            child: Stack(
                              children: [
                                Image.asset(
                                  popular[index]['imageUrl'],
                                  scale: 4,
                                ),
                                Positioned(
                                  top: 12,
                                  right: 12,
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
                                Positioned(
                                  bottom: 15,
                                  left: 15,
                                  right: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            popular[index]['name'],
                                            style: nunito14,
                                          ),
                                          Text(
                                            popular[index]['price'],
                                            style: nunito14.copyWith(
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icons/star.svg'),
                                              const SizedBox(width: 4),
                                              Text(
                                                popular[index]['rating'],
                                                style: nunito8.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text('per night', style: nunito8),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 23),
            FadeInUp(
              duration: const Duration(milliseconds: 1300),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Nearby you', style: nunito18),
                    Row(
                      children: [
                        Text('See all', style: nunito14),
                        const SizedBox(width: 6.5),
                        SvgPicture.asset('assets/icons/chevron-right.svg'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 3),
            FadeInUp(
              duration: const Duration(milliseconds: 1300),
              child: SizedBox(
                height: 115 * nearby.length / 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 8,
                    ),
                    itemCount: nearby.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        nearby[index]['imageUrl'],
                        scale: 4,
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
