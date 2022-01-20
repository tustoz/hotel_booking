import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: FadeInUp(
            duration: const Duration(milliseconds: 1300),
            child: Text(
              title,
              style: nunito16.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
