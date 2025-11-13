import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custom_text.dart';

class TokenSaleWidget extends StatefulWidget {
  const TokenSaleWidget({super.key});

  @override
  State<TokenSaleWidget> createState() => _TokenSaleWidgetState();
}

class _TokenSaleWidgetState extends State<TokenSaleWidget> {
  // Countdown values (you can make these dynamic)
  int days = 411;
  int hours = 11;
  int minutes = 19;
  int seconds = 31;

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey.shade800,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title
          const CustomText(
            text: 'Token sale ends in:',
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 40),

          // Countdown Timer Row
          Center(
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,

              children: [
                _buildTimeUnit(days.toString(), 'Days'),
                _buildTimeUnit(hours.toString(), 'Hour'),
                _buildTimeUnit(minutes.toString(), 'Minute'),
                _buildTimeUnit(seconds.toString(), 'Second'),
              ],
            ),
          ),

          const SizedBox(height: 50),

          // Contribution Amount
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CustomText(
                  text: '\$49,222,300',
                  color: Color(0xFFFDB927),
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: CustomText(
                    text: 'contribution received',
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),

          // Progress Bar Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: '\$5M',
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
              const Spacer(),
              const CustomText(
                text: '\$99M',
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Progress Bar
          Stack(
            children: [
              // Background Bar
              Container(
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              // Progress Bar
              FractionallySizedBox(
                widthFactor: 0.52, // 52% progress
                child: Container(
                  height: 6,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFFDB927),
                        Color(0xFFFFA500),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFFDB927).withOpacity(0.5),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),

          // Wallet Address Section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.grey.shade900.withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.grey.shade800,
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: CustomText(
                    text: '0x2170Ed0880ac9A755fd29B2688956BD959f933F8',
                    color: Colors.grey.shade400,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () {
                    Clipboard.setData(
                      const ClipboardData(
                        text: '0x2170Ed0880ac9A755fd29B2688956BD959f933F8',
                      ),
                    );

                  },
                  child: Icon(
                    Icons.copy,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeUnit(String value, String label) {
    return Column(
      children: [
        // Circle with number
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade900.withOpacity(0.3),
            border: Border.all(
              color: Colors.grey.shade800,
              width: 2,
            ),
          ),
          child: Center(
            child: CustomText(
              text: value,
              color: const Color(0xFFFDB927),
              fontSize: 28,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(height: 12),
        // Label
        CustomText(
          text: label,
          color: Colors.white,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}