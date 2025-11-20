import 'package:flutter/material.dart';
import 'package:webze_web/widget/custom_text.dart';

class PurchaseButton extends StatefulWidget {

  final String text;
  final AlignmentGeometry alignmentGeometry;

  const PurchaseButton({super.key, required this.text, required this.alignmentGeometry});

  @override
  State<PurchaseButton> createState() => _PurchaseButtonState();
}

class _PurchaseButtonState extends State<PurchaseButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.alignmentGeometry,
      child: MouseRegion(
        onEnter: (_) => setState(() => isHover = true),
        onExit: (_) => setState(() => isHover = false),
        cursor: SystemMouseCursors.click,
        child: IntrinsicWidth(  // 👈 This ensures width matches content
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            decoration: BoxDecoration(
              color: isHover ? Colors.orange : Colors.transparent,
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: isHover ? 0 : 1.5,
              ),
            ),
            child: CustomText(
              text: widget.text,
              color: isHover ? Colors.black : Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 12,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}