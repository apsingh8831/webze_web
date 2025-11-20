import 'package:flutter/material.dart';
import 'package:webze_web/widget/custom_text.dart';




class CustomBuyButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double width;
  final double height;

  const CustomBuyButton({
    Key? key,
    this.text = 'BUY NOW',
    required this.onPressed,
    this.backgroundColor = const Color(0xFFE6B84D),
    this.textColor = Colors.black,
    this.width = 120,
    this.height = 40,
  }) : super(key: key);

  @override
  State<CustomBuyButton> createState() => _CustomBuyButtonState();
}

class _CustomBuyButtonState extends State<CustomBuyButton> {
  bool isHovered = false;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => isPressed = true),
        onTapUp: (_) {
          setState(() => isPressed = false);
          widget.onPressed();
        },
        onTapCancel: () => setState(() => isPressed = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: isPressed
                ? widget.backgroundColor.withOpacity(0.8)
                : isHovered
                ? Colors.white
                : widget.backgroundColor,
            borderRadius: BorderRadius.circular(28),

          ),
          child: Center(
            child: CustomText(
             text:  widget.text,
                color: widget.textColor,
                fontSize: 13,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.0,

            ),
          ),
        ),
      ),
    );
  }
}