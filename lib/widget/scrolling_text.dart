import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MarqueeText extends StatefulWidget {
  final String text;
  final TextStyle? textStyle;
  final double velocity;

  const MarqueeText({
    super.key,
    required this.text,
    this.textStyle,
    this.velocity = 30.0,
  });

  @override
  State<MarqueeText> createState() => _MarqueeTextState();
}

class _MarqueeTextState extends State<MarqueeText> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _autoScroll();
    });
  }

  void _autoScroll() {
    if (_scrollController.hasClients) {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final duration = Duration(seconds: (maxScroll / widget.velocity).round());

      _scrollController
          .animateTo(
        maxScroll,
        duration: duration,
        curve: Curves.linear,
      )
          .then((_) {
        if (mounted) {
          _scrollController.jumpTo(0);
          _autoScroll();
        }
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      physics: const NeverScrollableScrollPhysics(),
      child: Row(
        children: List.generate(
          10, // Repeat count
              (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              widget.text,
              style: widget.textStyle ??
                  GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}