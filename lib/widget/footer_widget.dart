import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webze_web/widget/built_widget.dart';

import 'custom_text.dart';

class FooterWidget extends StatefulWidget {
  const FooterWidget({super.key});

  @override
  State<FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> with SingleTickerProviderStateMixin{

  late AnimationController _controller;

  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);




    // i3 - Upar neeche movement (opposite timing se i1)
    _animation = Tween<double>(begin: -15, end: 15).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.1, 1.0, curve: Curves.easeInOut),
      ),
    );

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Align(
          alignment: AlignmentGeometry.centerRight,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _animation.value),
                child: Image.asset(
                  'asset/image/g1.png',
                  height: MediaQuery.sizeOf(context).height * 0.15,
                ),
              );
            },
          ),
        ),
        SizedBox(height: 20,),
        Center(child: Image.asset('asset/image/webze.png')),

        SizedBox(height: 30),

        Center(child: BuiltWidget(text: 'BUILT WEB3, POWERED BY YOU')),

        SizedBox(height: 20),
        Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: GoogleFonts.nunito(
                fontSize: 35,
                fontWeight: FontWeight.w800,
                height: 1.3,
              ),
              children: [
                TextSpan(
                  text: 'Join with our ',
                  style: TextStyle(color: Colors.white),
                ),
                TextSpan(
                  text: 'future',
                  style: TextStyle(color: Colors.white30),
                ),
                TextSpan(
                  text: ' of Webzo currency',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,

          spacing: 10,
          children: [


            _buildCryptoIcon(
              FontAwesomeIcons.facebookF,
              containerHeight: 50,
              color: Colors.white,
              0,
              iconSize: 20,
            ),
            _buildCryptoIcon(
              FontAwesomeIcons.xTwitter,
              containerHeight: 50,
              color: Colors.white,
              0,
              iconSize: 20,
            ),
            _buildCryptoIcon(
              FontAwesomeIcons.telegram,
              containerHeight: 50,
              color: Colors.white,
              0,
              iconSize: 20,
            ),
            _buildCryptoIcon(
              FontAwesomeIcons.discord,
              containerHeight: 50,
              color: Colors.white,
              0,
              iconSize: 20,
            ),
          ],
        ),


        SizedBox(height: 30),

        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _animation.value),
              child: Image.asset(
                'asset/image/i3.png',
                height: MediaQuery.sizeOf(context).height * 0.15,
              ),
            );
          },
        ),

        SizedBox(height: 60,),

        Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: GoogleFonts.nunito(
                fontSize: 14,
                fontWeight: FontWeight.w500,

                height: 1.3,
              ),
              children: [
                TextSpan(
                  text: 'Copyright & design by ',
                  style: TextStyle(color: Colors.grey),
                ),
                TextSpan(
                  text: '@ThemeAdapt',
                  style: TextStyle(color: Colors.white30),
                ),
                TextSpan(
                  text: ' - 2025',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }

  Widget _buildCryptoIcon(
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
}
