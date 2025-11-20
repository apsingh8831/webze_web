import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webze_web/widget/custom_text.dart';

class CryptoCardsWidget extends StatelessWidget {
  const CryptoCardsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
    runSpacing: 25,
      children: [
        _buildCard(
          icon: 'asset/image/read.svg',
          iconColor: const Color(0xFFFFB800),
          title: 'Read our',
          subtitle: 'white paper',
          buttonText: 'OPEN WHITEPAPER',
          buttonColor: Colors.transparent,
        ),

        _buildCard(
          icon: 'asset/image/token.svg',
          iconColor: const Color(0xFFE91E63),
          title: '1 CRN token price',
          subtitle: '0.00014 BTC',
          buttonText: 'BUY TOKENS',
          discount: '(-25%)',
          buttonColor: Colors.transparent,
        ),

        _buildCard(
          icon: 'asset/image/participant.svg',
          iconColor: const Color(0xFF7C4DFF),
          title: 'ICO Participants',
          subtitle: '370,000+',
          buttonText: 'JOIN OUR TELEGRAM',
          buttonColor: Colors.transparent,
        ),
      ],
    );
  }

  Widget _buildCard({
    required dynamic icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String buttonText,
    String? discount,
    required Color buttonColor,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsetsGeometry.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF3A3A3A),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon
          SvgPicture.asset(icon,height: 60),

          const SizedBox(height: 30),

          // Title
          CustomText(
            text: title,
              textAlign: TextAlign.center,

              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),





          // Subtitle
          CustomText(
          text:   subtitle,

              color: Colors.grey[600],
              fontSize: 24,
              fontWeight: FontWeight.w800,

            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 40),

          // Button
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: Colors.grey[700]!,
                width: 1,
              ),
              backgroundColor: buttonColor,
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                 text:  buttonText,

                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,

                ),
                if (discount != null) ...[
                  const SizedBox(width: 8),
                  CustomText(
                   text:  discount,

                      color: Color(0xFFFFB800),
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),


                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}




class webCryptoCardsWidget extends StatelessWidget {
  const webCryptoCardsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Row(
        spacing: 25,
        children: [
          Expanded(
            child: _buildCard(
              icon: 'asset/image/read.svg',
              iconColor: const Color(0xFFFFB800),
              title: 'Read our',
              subtitle: 'white paper',
              buttonText: 'OPEN WHITEPAPER',
              buttonColor: Colors.transparent,
            ),
          ),

          Expanded(
            child: _buildCard(
              icon: 'asset/image/token.svg',
              iconColor: const Color(0xFFE91E63),
              title: '1 CRN token price',
              subtitle: '0.00014 BTC',
              buttonText: 'BUY TOKENS',
              discount: '(-25%)',
              buttonColor: Colors.transparent,
            ),
          ),

          Expanded(
            child: _buildCard(
              icon: 'asset/image/participant.svg',
              iconColor: const Color(0xFF7C4DFF),
              title: 'ICO Participants',
              subtitle: '370,000+',
              buttonText: 'JOIN OUR TELEGRAM',
              buttonColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard({
    required dynamic icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String buttonText,
    String? discount,
    required Color buttonColor,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsetsGeometry.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF3A3A3A),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon
          SvgPicture.asset(icon,height: 60),

          const SizedBox(height: 30),

          // Title
          CustomText(
            text: title,
            textAlign: TextAlign.center,

            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w800,
          ),





          // Subtitle
          CustomText(
            text:   subtitle,

            color: Colors.grey[600],
            fontSize: 30,
            fontWeight: FontWeight.w800,

            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 40),

          // Button
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: Colors.grey[700]!,
                width: 1,
              ),
              backgroundColor: buttonColor,
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 20,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  text:  buttonText,

                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,

                ),
                if (discount != null) ...[
                  const SizedBox(width: 8),
                  CustomText(
                    text:  discount,

                    color: Color(0xFFFFB800),
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),


                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}



