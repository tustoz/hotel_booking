import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:hotel_booking/widgets/home/section_title.dart';

class NearbyGrid extends StatelessWidget {
  final List<String> data;

  const NearbyGrid({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 1300),
      child: Column(
        children: [
          const SectionTitle(title: 'Nearby you'),
          Container(
            height: 115 * data.length / 3,
            margin: const EdgeInsets.only(bottom: 40),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 8,
                ),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Image.asset(
                    data[index],
                    scale: 4,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
