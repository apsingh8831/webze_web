import 'dart:ui';

import 'package:flutter/material.dart';

Widget buildCryptoIcon(
    IconData icon,
    int index, {
      Color? color,
      double? containerWidth,
      double? containerHeight,
      double? iconSize,
    }) {
  return Container(
    width: containerWidth ?? 50,
    height: containerHeight ?? 50,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: const Color(0xFF3A3A3A), width: 1),
    ),
    child: Center(
      child: Icon(icon, color: color ?? Colors.white, size: iconSize ?? 25),
    ),
  );
}