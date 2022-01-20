import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constant.dart';

class FacilityItem extends StatelessWidget {
  final String svgPath;

  const FacilityItem({Key? key, required this.svgPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          svgPath,
        ),
      ),
    );
  }
}
