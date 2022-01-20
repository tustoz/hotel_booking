import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constant.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 900),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(title, style: nunito18),
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
    );
  }
}
