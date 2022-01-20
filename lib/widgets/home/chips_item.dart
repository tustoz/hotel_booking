import 'package:flutter/material.dart';

import '../../constant.dart';

class ChipsItem extends StatelessWidget {
  final String label;

  const ChipsItem({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18),
      child: Chip(
        elevation: 0,
        label: Text(label, style: nunito16),
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
  }
}
