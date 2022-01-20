import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:hotel_booking/widgets/detail/facility_item.dart';
import 'package:hotel_booking/widgets/detail/section_title.dart';

import '../../dummy.dart';

class Facilities extends StatelessWidget {
  const Facilities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Facilities'),
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 15),
          child: FadeInUp(
            duration: const Duration(milliseconds: 1100),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                crossAxisSpacing: 16,
              ),
              itemCount: facilities.length,
              itemBuilder: (context, index) {
                return FacilityItem(svgPath: facilities[index]);
              },
            ),
          ),
        ),
      ],
    );
  }
}
