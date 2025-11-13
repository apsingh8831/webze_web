import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webze_web/widget/custom_text.dart';
import 'package:webze_web/widget/token_sale.dart';

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
                  children: [
                    const SizedBox(height: 40),
                    // Badge
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
                        text: 'BUILT ON WEB3. POWERED BY YOU',
                        color: Color(0xFFFDB927),
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Main Heading
                    RichText(
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
                    RichText(
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

                    const SizedBox(height: 40),
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
                        text: 'HOW IT WORKS?',
                        color: Color(0xFFFDB927),
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.2,
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
                      child: Image.asset(
                        'asset/image/marketplace.png',
                        height: MediaQuery.sizeOf(context).height * 0.3,
                      ),
                    ),

                    const SizedBox(height: 100),
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
                  SvgPicture.asset(
                    matchTextDirection: true,
                    'asset/image/webze.svg',
                    height: 35,
                  ),
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
}
