import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constant.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 700),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 44,
                  width: MediaQuery.of(context).size.width - 109,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    border: Border.all(color: kShadeColor),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    style: TextStyle(color: kAccentColor),
                    decoration: InputDecoration(
                      hintText: 'Search Hotel',
                      icon: SvgPicture.asset('assets/icons/search.svg'),
                      border: InputBorder.none,
                      hintStyle: nunitoRegular12.copyWith(color: kAccentColor),
                    ),
                  ),
                ),
                const SizedBox(width: 17),
                Container(
                  height: 44,
                  width: 44,
                  padding: const EdgeInsets.all(11),
                  decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: SvgPicture.asset('assets/icons/option.svg'),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
