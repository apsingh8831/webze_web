import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webze_web/widget/custom_text.dart';
import 'package:webze_web/widget/footer_widget.dart';
import 'package:webze_web/widget/token_sale.dart';

import '../../widget/crypto_card.dart';
import '../../widget/crypto_faq.dart';
import '../../widget/purchase_button.dart';
import '../../widget/scrolling_text.dart';
import '../../widget/webze_drawer.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation1;
  late Animation<double> _rotationAnimation;
  late Animation<double> _animation3;

  late Animation<double> _animation;

  List<Map<String, String>> listData = [
    {
      'image': 'asset/image/l1.png',
      'title': 'Crypto ',
      'title2': 'management',
      'subtitle': 'Automated identity verification and anti-money',
    },
    {
      'image': 'asset/image/l2.png',
      'title': 'Crypto ',
      'title2': 'exchange',
      'subtitle': 'A built-in explore to track transactions',
    },
    {
      'image': 'asset/image/l3.png',
      'title': 'Real-time ',
      'title2': 'data',
      'subtitle': 'Global reach with content available in multiple',
    },
    {
      'image': 'asset/image/l4.png',
      'title': 'Advanced ',
      'title2': 'trading',
      'subtitle': 'Visual dashboards for trade performance',
    },
    {
      'image': 'asset/image/l5.png',
      'title': 'Blockchain ',
      'title2': 'compliance',
      'subtitle': 'Exportable reports for tax and accounting purposes',
    },
  ];

  List<Map<String, String>> marketplaceData = [
    {
      'title': 'currency ',
      'title2': 'conversion',
      'subtitle': 'Exportable reports for tax and accounting purposes.',
    },
    {
      'title': 'Data ',
      'title2': 'encryption',
      'subtitle': 'Visual dashboards for trade performance.',
    },
    {
      'title': 'cold wallet ',
      'title2': 'storage',
      'subtitle': 'Regular updates on crypto trends and platform features.',
    },
    {
      'title': 'Transfer crypto',
      'title2': '& data',
      'subtitle': 'Guides for beginners on crypto basics and trading.',
    },
  ];

  List<Map<String, String>> planningData = [
    {
      'image': 'asset/image/p1.png',
      'year': '2014',
      'title': 'Definitions of key terms in cryptocurrency',
    },
    {
      'image': 'asset/image/p2.png',
      'year': '2017',
      'title': 'Automated tools for executing strategies',
    },
    {
      'image': 'asset/image/p3.png',
      'year': '2022',
      'title': 'APIs for developers to build custom tools',
    },
    {
      'image': 'asset/image/p4.png',
      'year': '2025',
      'title': 'A space for users to discuss trends',
    },
  ];

  List<Map<String, dynamic>> followData = [
    {
      'image': 'asset/image/f1.png',
      'designation': 'FOUNDER',
      'icon': FontAwesomeIcons.facebookF,
      'name': 'Rosalina William',
    },
    {
      'image': 'asset/image/f2.png',
      'designation': 'CEO',
      'icon': FontAwesomeIcons.telegram,
      'name': 'Alonso Dowson',
    },
    {
      'image': 'asset/image/f3.png',
      'designation': 'DESIGNER',
      'icon': FontAwesomeIcons.xTwitter,
      'name': 'Elson Nelzoon',
    },
    {
      'image': 'asset/image/f4.png',
      'designation': 'DEVELOPER',
      'icon': FontAwesomeIcons.telegram,
      'name': 'Miranda Halim',
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    // i1 - Upar neeche movement
    _animation1 = Tween<double>(
      begin: -10,
      end: 10,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // i2 - Rotation (0 to 2*pi = full rotation)
    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 3,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    // i3 - Upar neeche movement (opposite timing se i1)
    _animation3 = Tween<double>(begin: -10, end: 10).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 1.0, curve: Curves.easeInOut),
      ),
    );

    _controller = AnimationController(
      duration: Duration(seconds: 2), // speed adjust karein
      vsync: this,
    )..repeat(reverse: true); // repeat hoga aur reverse bhi

    // Tween animation - kitna upar niche move karega
    _animation =
        Tween<double>(
          begin: -20, // upar kitna jayega
          end: 20, // niche kitna jayega
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOut, // smooth motion
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
    return Scaffold(
      backgroundColor: Colors.black,
      endDrawer: const WebzeDrawer(),
      body: Stack(
        children: [
          // Scrollable Content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 120), // Header ke liye space
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    // Badge
                    Center(
                      child: Container(
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
                          text: 'BUILT ON WEB3. POWERED BY YOU',
                          color: Color(0xFFFDB927),
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Main Heading
                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: GoogleFonts.nunito(
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                            height: 1.3,
                          ),
                          children: [
                            TextSpan(
                              text: 'The ',
                              style: TextStyle(color: Colors.white),
                            ),
                            TextSpan(
                              text: 'future',
                              style: TextStyle(color: Colors.white30),
                            ),
                            TextSpan(
                              text: ' of\nleverage is here',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    CustomText(
                      text:
                          'Leverage on any tokens with a protocol trusted with billions for its performance and reliability.',
                      fontSize: 17,
                      textAlign: TextAlign.center,
                      color: Colors.grey,
                    ),

                    // Subtitle
                    const SizedBox(height: 50),
                    // Email Input
                    Container(
                      alignment: Alignment.center,

                      decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Colors.grey.shade800,
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        style: GoogleFonts.nunito(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Business email',
                          hintStyle: GoogleFonts.nunito(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade600,
                            fontSize: 15,
                          ),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                            size: 20,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 12,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // CTA Button
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFDB927), Color(0xFFFFA500)],
                        ),
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFFDB927).withOpacity(0.3),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: const CustomText(
                          text: 'GET EARLY ACCESS',
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Footer Text
                    Center(
                      child: RichText(
                        text: TextSpan(
                          style: GoogleFonts.nunito(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                          ),
                          children: const [
                            TextSpan(text: 'Start monitoring for free or '),
                            TextSpan(
                              text: 'msg us!',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 80),
                    // Bottom Decorative Elements
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // i1 - Upar Neeche
                            Transform.translate(
                              offset: Offset(0, _animation1.value),
                              child: Image.asset(
                                'asset/image/i1.png',
                                height: 60,
                              ),
                            ),
                            // i2 - Rotate
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Transform.rotate(
                                angle: _rotationAnimation.value,
                                child: Image.asset(
                                  'asset/image/i2.png',
                                  height: 70,
                                ),
                              ),
                            ),
                            // i3 - Upar Neeche
                            Transform.translate(
                              offset: Offset(0, _animation3.value),
                              child: Image.asset(
                                'asset/image/i3.png',
                                height: 60,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 100),
                    // Badge
                    Center(
                      child: Container(
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
                          text: 'ACCESSIBLE FOR EVERYONE',
                          color: Color(0xFFFDB927),
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),
                    // Main Heading
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: GoogleFonts.nunito(
                          fontSize: 35,
                          fontWeight: FontWeight.w800,
                          height: 1.3,
                        ),
                        children: [
                          TextSpan(
                            text: 'Crypto ',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: 'development',
                            style: TextStyle(color: Colors.white30),
                          ),
                          TextSpan(
                            text: ' accessible',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 50),

                    Column(
                      spacing: 30,
                      children: List.generate(listData.length, (index) {
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade800),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 40,
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  '${listData[index]['image']}',
                                  height: 100,
                                ),
                                SizedBox(height: 50),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: GoogleFonts.nunito(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      height: 1.1,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: listData[index]['title'],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      TextSpan(
                                        text: listData[index]['title2'],
                                        style: TextStyle(color: Colors.white30),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                CustomText(
                                  text: listData[index]['subtitle'],
                                  color: Colors.grey,
                                  fontSize: 17,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),

                    SizedBox(height: 50),

                    // Apne code mein aise use karo:
                    MarqueeText(
                      text: 'You will hold the way you loved Webze',
                      textStyle: GoogleFonts.nunito(
                        fontSize: 40,
                        color: Colors.white24,
                        fontWeight: FontWeight.w800,
                      ),
                      velocity: 30.0, // Speed control
                    ),

                    SizedBox(height: 50),

                    Container(
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
                        text: 'ACCESSIBLE FOR EVERYONE',
                        color: Color(0xFFFDB927),
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.2,
                      ),
                    ),

                    const SizedBox(height: 30),
                    // Main Heading
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.nunito(
                          fontSize: 35,
                          fontWeight: FontWeight.w800,
                          height: 1.3,
                        ),
                        children: [
                          TextSpan(
                            text: 'Trading ',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: 'platform',
                            style: TextStyle(color: Colors.white30),
                          ),
                          TextSpan(
                            text: ' of the future!',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 30),

                    CustomText(
                      text:
                          'Webzi brings our love for cryptocurrency into Web3! Like a frog’s leap, the chart can jump at any moment. Boom!',
                      fontSize: 17,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 30),
                    PurchaseButton(),
                    SizedBox(height: 50),

                    TokenSaleWidget(),

                    SizedBox(height: 80),
                    Center(
                      child: Container(
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
                          text: 'HOW IT WORKS?',
                          color: Color(0xFFFDB927),
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),
                    // Main Heading
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: GoogleFonts.nunito(
                          fontSize: 35,

                          fontWeight: FontWeight.w800,
                          height: 1.3,
                        ),
                        children: [
                          TextSpan(
                            text: 'Core asset of the ',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: 'crypto',
                            style: TextStyle(color: Colors.white30),
                          ),
                          TextSpan(
                            text: ' marketplace',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 80),

                    AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0, _animation.value),
                          child: child,
                        );
                      },
                      child: Center(
                        child: Image.asset(
                          'asset/image/marketplace.png',
                          height: MediaQuery.sizeOf(context).height * 0.3,
                        ),
                      ),
                    ),

                    SizedBox(height: 80),
                    Column(
                      spacing: 70,
                      children: List.generate(marketplaceData.length, (index) {
                        String number = (index + 1).toString().padLeft(2, '0');
                        return Stack(
                          clipBehavior: Clip.none,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: CustomText(
                                text: number,
                                color: Colors.white10,
                                fontSize: 100,
                                fontWeight: FontWeight.w800,
                              ),
                            ),

                            Positioned(
                              top: 60,
                              left: 20,
                              right: 20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: GoogleFonts.nunito(
                                        fontSize: 24,

                                        fontWeight: FontWeight.w800,
                                        height: 1.3,
                                      ),
                                      children: [
                                        TextSpan(
                                          text:
                                              '${marketplaceData[index]['title']} ',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        TextSpan(
                                          text:
                                              '${marketplaceData[index]['title2']}',
                                          style: TextStyle(
                                            color: Colors.white30,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  CustomText(
                                    text: marketplaceData[index]['subtitle'],
                                    fontSize: 17,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                    SizedBox(height: 80),

                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade800),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 40,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('asset/image/i3.png', height: 100),
                            SizedBox(height: 50),
                            RichText(
                              text: TextSpan(
                                style: GoogleFonts.nunito(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  height: 1.1,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Exchange ',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  TextSpan(
                                    text: 'availabilty',
                                    style: TextStyle(color: Colors.white30),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            CustomText(
                              text:
                                  'AI-powered tools to detect and prevent fraudulent activities.',
                              color: Colors.grey,
                              fontSize: 17,
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    _buildCryptoIcon(
                                      Icons.currency_bitcoin,
                                      color: Colors.orangeAccent,
                                      0,
                                    ),
                                    Positioned(
                                      left: 40,
                                      child: _buildCryptoIcon(
                                        FontAwesomeIcons.ethereum,
                                        color: Colors.orangeAccent,
                                        1,
                                      ),
                                    ),
                                    Positioned(
                                      left: 80,
                                      child: _buildCryptoIcon(
                                        Icons.layers,
                                        color: Colors.orangeAccent,
                                        2,
                                      ),
                                    ),
                                    Positioned(
                                      left: 120,
                                      child: _buildCryptoIcon(
                                        Icons.change_history,
                                        color: Colors.orangeAccent,
                                        3,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 80),
                    Center(
                      child: Container(
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
                          text: 'CRYPTO DIRECTION',
                          color: Color(0xFFFDB927),
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),
                    // Main Heading
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: GoogleFonts.nunito(
                          fontSize: 35,

                          fontWeight: FontWeight.w800,
                          height: 1.3,
                        ),
                        children: [
                          TextSpan(
                            text: 'Goods & assets ',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: 'according',
                            style: TextStyle(color: Colors.white30),
                          ),
                          TextSpan(
                            text: ' to users interests.',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 80),

                    CryptoCardsWidget(),

                    SizedBox(height: 100),

                    Image.asset('asset/image/faq.png'),

                    SizedBox(height: 30),

                    SizedBox(height: 50),

                    Container(
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
                        text: 'FAQ & ANS',
                        color: Color(0xFFFDB927),
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.2,
                      ),
                    ),

                    const SizedBox(height: 30),
                    // Main Heading
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.nunito(
                          fontSize: 35,
                          fontWeight: FontWeight.w800,
                          height: 1.3,
                        ),
                        children: [
                          TextSpan(
                            text: 'Get every ',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: 'single',
                            style: TextStyle(color: Colors.white30),
                          ),
                          TextSpan(
                            text: ' answer',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 60),
                    CryptoFAQWidget(),

                    SizedBox(height: 80),

                    Center(
                      child: Container(
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
                          text: 'ROADMAP',
                          color: Color(0xFFFDB927),
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),
                    // Main Heading
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: GoogleFonts.nunito(
                          fontSize: 35,
                          fontWeight: FontWeight.w800,
                          height: 1.3,
                        ),
                        children: [
                          TextSpan(
                            text: 'Our ',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: 'strategy',
                            style: TextStyle(color: Colors.white30),
                          ),
                          TextSpan(
                            text: ' & Planning',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 60),

                    Center(
                      child: Column(
                        spacing: 60,
                        children: List.generate(planningData.length, (index) {
                          return Column(
                            children: [
                              Image.asset(
                                '${planningData[index]['image']}',
                                height: MediaQuery.sizeOf(context).height * 0.1,
                              ),
                              SizedBox(height: 40),
                              CustomText(
                                text: planningData[index]['year'],
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                color: Colors.orangeAccent,
                              ),
                              SizedBox(height: 15),
                              CustomText(
                                text: planningData[index]['title'],
                                color: Colors.grey,
                                fontSize: 17,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          );
                        }),
                      ),
                    ),

                    SizedBox(height: 80),

                    Container(
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
                        text: 'OUR AVENGERS',
                        color: Color(0xFFFDB927),
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.2,
                      ),
                    ),

                    const SizedBox(height: 30),
                    // Main Heading
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.nunito(
                          fontSize: 35,
                          fontWeight: FontWeight.w800,
                          height: 1.3,
                        ),
                        children: [
                          TextSpan(
                            text: 'Meet with ',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: 'our',
                            style: TextStyle(color: Colors.white30),
                          ),
                          TextSpan(
                            text: ' avengers!',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    CustomText(
                      text:
                          'Webzi brings our love for cryptocurrency into Web3! Like a frog’s leap, the chart can jump at any moment. Boom!',
                      fontSize: 17,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 40),

                    Row(
                      spacing: 2,
                      children: [
                        CustomText(
                          text: 'FOLLOW US',
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                        SizedBox(width: 10),
                        _buildCryptoIcon(
                          FontAwesomeIcons.facebookF,
                          containerHeight: 40,
                          color: Colors.white,
                          0,
                          iconSize: 20,
                        ),
                        _buildCryptoIcon(
                          FontAwesomeIcons.xTwitter,
                          containerHeight: 40,
                          color: Colors.white,
                          0,
                          iconSize: 20,
                        ),
                        _buildCryptoIcon(
                          FontAwesomeIcons.telegram,
                          containerHeight: 40,
                          color: Colors.white,
                          0,
                          iconSize: 20,
                        ),
                        _buildCryptoIcon(
                          FontAwesomeIcons.discord,
                          containerHeight: 40,
                          color: Colors.white,
                          0,
                          iconSize: 20,
                        ),
                      ],
                    ),

                    SizedBox(height: 40),
                    Column(
                      spacing: 25,
                      children: List.generate(followData.length, (index) {
                        return Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              padding: EdgeInsetsGeometry.symmetric(
                                vertical: 40,
                              ),
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
                                  Image.asset('${followData[index]['image']}'),

                                  const SizedBox(height: 30),
                                  Center(
                                    child: Container(
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
                                        text: followData[index]['designation'],
                                        color: Color(0xFFFDB927),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),

                                  // Title
                                  CustomText(
                                    text: followData[index]['name'],
                                    textAlign: TextAlign.center,

                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 15,
                              right: 15,
                              child: _buildCryptoIcon(
                                followData[index]['icon'],
                                0,
                                iconSize: 20,
                                containerHeight: 50,
                              ),
                            ),
                          ],
                        );
                      }),
                    ),

                    SizedBox(height: 80),

                   FooterWidget(),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
          // Fixed Header on Top
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.only(top: 50, left: 24, right: 24),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo Section
                  Image.asset('asset/image/webze.png', height: 30),
                  // Menu Icon
                  Builder(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        child: Icon(
                          CupertinoIcons.square_grid_2x2,
                          color: Color(0xFFFDB927),
                          size: 35,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // Floating Action Button
      floatingActionButton: Container(
        height: 45,
        decoration: BoxDecoration(
          color: const Color(0xFFFDB927),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFFDB927).withOpacity(0.4),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: const Icon(
            Icons.arrow_upward_rounded,
            color: Colors.black,
            size: 20,
          ),
        ),
      ),
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
