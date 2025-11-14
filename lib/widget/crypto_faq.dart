import 'package:flutter/material.dart';
import 'package:webze_web/widget/custom_text.dart';

class CryptoFAQWidget extends StatefulWidget {
  const CryptoFAQWidget({Key? key}) : super(key: key);

  @override
  State<CryptoFAQWidget> createState() => _CryptoFAQWidgetState();
}

class _CryptoFAQWidgetState extends State<CryptoFAQWidget> {
  int expandedIndex = 0; // Starting me 1 expanded (2nd item)

  final List<Map<String, String>> faqItems = [
    {
      'question': 'Main purpose of a cryptocurrency',
      'answer':
      'The private key, stored securely in the wallet, allows you to sign transactions and prove ownership of the funds cryptocurrency wallet.',
    },
    {
      'question': 'How can I make refund?',
      'answer':
      'To make a refund, please contact our support team with your transaction details. Refunds are processed within 5-7 business days depending on your payment method.',
    },
    {
      'question': 'How do they operate on blockchain?',
      'answer':
      'Blockchain technology operates through a distributed ledger system where transactions are verified by network nodes through cryptography and recorded in a public distributed ledger.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: List.generate(
        faqItems.length,
            (index) => _buildFAQItem(
          question: faqItems[index]['question']!,
          answer: faqItems[index]['answer']!,
          index: index,
        ),
      ),
    );
  }

  Widget _buildFAQItem({
    required String question,
    required String answer,
    required int index,
  }) {
    bool isExpanded = expandedIndex == index;

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF2A2A2A),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomText(
                   text:  question,

                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,

                  ),
                ),
                const SizedBox(width: 16),

                /// 👉 Only this icon will toggle expand
                GestureDetector(
                  onTap: () {
                    setState(() {
                      expandedIndex =
                      isExpanded ? -1 : index; // toggle only on icon tap
                    });
                  },
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: isExpanded ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Icon(
                      isExpanded ? Icons.remove : Icons.add,
                      color: isExpanded ? Colors.black : Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// Reveal / Hide answer
          AnimatedCrossFade(
            firstChild: Container(),
            secondChild: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                bottom: 24,
              ),
              child: CustomText(
               text:  answer,

                  color: Colors.grey[500],
                  fontSize: 17 ,
                  height: 1.6,
                ),

            ),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }
}
