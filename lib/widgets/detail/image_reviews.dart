import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../dummy.dart';

class ImageReviews extends StatelessWidget {
  const ImageReviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 365,
      left: 24,
      right: 24,
      child: FadeInUp(
        duration: const Duration(milliseconds: 700),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 16,
          ),
          itemCount: review.length,
          itemBuilder: (context, index) {
            return Image.asset(
              review[index],
              scale: 4,
            );
          },
        ),
      ),
    );
  }
}
