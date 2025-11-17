import 'package:flutter/material.dart';

import 'custom_text.dart';

class BuiltWidget extends StatelessWidget {

  final String text;

  const BuiltWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFFDB927),
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: CustomText(
        text: text,
        color: Color(0xFFFDB927),
        fontSize: 12,
        fontWeight: FontWeight.w800,
        letterSpacing: 1.2,
      ),
    );
  }
}
