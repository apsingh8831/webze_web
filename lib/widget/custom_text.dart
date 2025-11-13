import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {

  const CustomText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.height,
    this.textAlign,
    this.textOverflow,
    this.shadow,
    this.maxLine,
    this.fontWeight,
    this.wordSpacing,
    this.textDecoration,
    this.fontStyle,
    this.decorationColor,
    this.decorationStyle,
    this.letterSpacing,
    this.decorationThickness,

  });
  final String? text;
  final double? height;
  final List<Shadow>? shadow;
  final Color? color;
  final double? fontSize;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLine;
  final double? letterSpacing;
  final FontWeight? fontWeight;
  final double? wordSpacing;
  final TextDecoration? textDecoration;
  final FontStyle? fontStyle;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final double? decorationThickness;


  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: GoogleFonts.nunito(
          color: color,
          shadows: shadow,
          wordSpacing: wordSpacing,
          fontSize: fontSize,
          decoration: textDecoration,
          decorationColor: decorationColor,
          decorationStyle: decorationStyle,
          letterSpacing: letterSpacing,
          height: height,
          fontWeight: fontWeight,
          decorationThickness: decorationThickness,
          fontStyle: fontStyle),
      maxLines: maxLine,
      overflow: textOverflow,
      textAlign: textAlign,
    );
  }
}