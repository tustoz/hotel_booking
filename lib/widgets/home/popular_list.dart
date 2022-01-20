import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:hotel_booking/widgets/home/popular_item.dart';
import 'package:hotel_booking/widgets/home/section_title.dart';

class PopularList extends StatelessWidget {
  final List items;

  const PopularList({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 1100),
      child: Column(
        children: [
          const SectionTitle(title: 'Most Popular'),
          Container(
            height: 239,
            margin: const EdgeInsets.only(bottom: 25),
            child: Padding(
              padding: const EdgeInsets.only(left: 24),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  var item = items[index];

                  return PopularItem(
                    imageUrl: item['imageUrl'],
                    name: item['name'],
                    price: item['price'],
                    rating: item['rating'],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
