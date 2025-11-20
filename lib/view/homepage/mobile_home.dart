import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webze_web/widget/built_widget.dart';
import 'package:webze_web/widget/custom_text.dart';
import 'package:webze_web/widget/floating_widget.dart';
import 'package:webze_web/widget/footer_widget.dart';
import 'package:webze_web/widget/header_widget.dart';
import 'package:webze_web/widget/token_sale.dart';

import '../../constant_data/data.dart';
import '../../provider/drawer_provider.dart';
import '../../widget/buil_crypto_icon.dart';
import '../../widget/crypto_card.dart';
import '../../widget/crypto_faq.dart';
import '../../widget/purchase_button.dart';
import '../../widget/scrolling_text.dart';
import '../../widget/webze_drawer.dart';

class MobileHome extends StatefulWidget {
  final String? scrollTo;
  const MobileHome({super.key, this.scrollTo});

  @override
  State<MobileHome> createState() => MobileHomeState();
}

class MobileHomeState extends State<MobileHome> with TickerProviderStateMixin {

  static MobileHomeState? instance;

  double featurePos = 0;
  double tokenPos = 0;
  double howPos = 0;
  double roadmapPos = 0;

  final GlobalKey featureKey = GlobalKey();
  final GlobalKey tokenKey = GlobalKey();
  final GlobalKey howItWorksKey = GlobalKey();
  final GlobalKey roadmapKey = GlobalKey();

  final ScrollController homeScroll = ScrollController();

  late AnimationController _controller;
  late Animation<double> _animation1;
  late Animation<double> _rotationAnimation;
  late Animation<double> _animation3;

  late Animation<double> _animation;


  double _getOffset(GlobalKey key) {
    try {
      final ctx = key.currentContext;
      final box = ctx!.findRenderObject() as RenderBox;
      return box.localToGlobal(Offset.zero).dy + homeScroll.offset;
    } catch (e) {
      return 0;
    }
  }

  void _calculateSectionOffsets() {
    featurePos = _getOffset(featureKey);
    tokenPos = _getOffset(tokenKey);
    howPos = _getOffset(howItWorksKey);
    roadmapPos = _getOffset(roadmapKey);
  }


  void scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  void scrollToSection(String section) {
    switch (section) {
      case "top":
        homeScroll.animateTo(
          0,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
        break;

      case "features":
        scrollTo(featureKey);
        break;

      case "token":
        scrollTo(tokenKey);
        break;

      case "how":
        scrollTo(howItWorksKey);
        break;

      case "roadmap":
        scrollTo(roadmapKey);
        break;
    }
  }

  // bool _isInSection(double scrollPos, GlobalKey key) {
  //   final ctx = key.currentContext;
  //   if (ctx == null) return false;
  //
  //   final box = ctx.findRenderObject() as RenderBox;
  //   final offset = box.localToGlobal(Offset.zero).dy;
  //
  //   return (offset - 200 <= 0);
  // }

  void _updateDrawerOnScroll() {
    final drawer = Provider.of<DrawerProvider>(context, listen: false);

    final pos = homeScroll.offset + 200;

    if (pos < featurePos) {
      drawer.selectMain(0); // HOME
    }
    else if (pos >= featurePos && pos < tokenPos) {
      drawer.selectMain(1); // FEATURES
    }
    else if (pos >= tokenPos && pos < howPos) {
      drawer.selectMain(2); // TOKEN
    }
    else if (pos >= howPos && pos < roadmapPos) {
      drawer.selectMain(3); // HOW IT WORKS
    }
    else {
      drawer.selectMain(4); // ROADMAP
    }
  }




  @override
  void initState() {
    super.initState();

    instance = this;

    homeScroll.addListener(_updateDrawerOnScroll);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _calculateSectionOffsets();   // ✅ NEW (offsets calculate)

      if (widget.scrollTo == "features") scrollTo(featureKey);
      if (widget.scrollTo == "token") scrollTo(tokenKey);
      if (widget.scrollTo == "how") scrollTo(howItWorksKey);
      if (widget.scrollTo == "roadmap") scrollTo(roadmapKey);
    });

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    // i1 - Upar neeche movement
    _animation1 = Tween<double>(
      begin: -10,
      end: 10,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // i2 - Rotation
    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 3,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    // i3 - Upar neeche movement (delay timing)
    _animation3 = Tween<double>(begin: -10, end: 10).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 1.0, curve: Curves.easeInOut),
      ),
    );

    _animation = Tween<double>(
      begin: -20,
      end: 20,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }


  @override
  void dispose() {
    instance = null;
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
            controller: homeScroll,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 16,
                top: 140,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  // Badge
                  Center(
                    child: BuiltWidget(text: 'BUILT ON WEB3. POWERED BY YOU'),
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

                  Center(
                    child: CustomText(
                      text:
                          'Leverage on any tokens with a protocol trusted with billions for its performance and reliability.',
                      fontSize: 17,
                      textAlign: TextAlign.center,
                      color: Colors.grey,
                    ),
                  ),

                  // Subtitle
                  const SizedBox(height: 50),
                  // Email Input
                  Container(
                    alignment: Alignment.center,

                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.grey.shade800, width: 1),
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
                    height: 50,
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

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    key: featureKey,
                    children: [
                      const SizedBox(height: 150),
                      Center(
                        child: BuiltWidget(text: 'ACCESSIBLE FOR EVERYONE'),
                      ),

                      // Badge
                      const SizedBox(height: 40),

                      // Main Heading
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
                                          style: TextStyle(
                                            color: Colors.white30,
                                          ),
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
                    ],
                  ),

                  // Apne code mein aise use karo:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    key: tokenKey,
                    children: [
                      SizedBox(height: 50),
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

                      BuiltWidget(text: 'ACCESSIBLE FOR EVERYONE'),

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
                    ],
                  ),

                  SizedBox(height: 30),
                  PurchaseButton(
                    text: "PURCHASE NOW",
                    alignmentGeometry: Alignment.centerLeft,
                  ),
                  SizedBox(height: 50),

                  TokenSaleWidget(),

                  Column(
                    key: howItWorksKey,
                    children: [
                      SizedBox(height: 60),
                      Divider(thickness: 0.2),
                      SizedBox(height: 80),

                      Center(child: BuiltWidget(text: 'HOW IT WORKS?')),

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
                    ],
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
                                        style: TextStyle(color: Colors.white30),
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
                                  buildCryptoIcon(
                                    Icons.currency_bitcoin,
                                    color: Colors.orangeAccent,
                                    0,
                                  ),
                                  Positioned(
                                    left: 40,
                                    child: buildCryptoIcon(
                                      FontAwesomeIcons.ethereum,
                                      color: Colors.orangeAccent,
                                      1,
                                    ),
                                  ),
                                  Positioned(
                                    left: 80,
                                    child: buildCryptoIcon(
                                      Icons.layers,
                                      color: Colors.orangeAccent,
                                      2,
                                    ),
                                  ),
                                  Positioned(
                                    left: 120,
                                    child: buildCryptoIcon(
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

                  Center(child: BuiltWidget(text: 'CRYPTO DIRECTION')),

                  const SizedBox(height: 30),
                  // Main Heading
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
                  ),
                  SizedBox(height: 80),

                  CryptoCardsWidget(),

                  SizedBox(height: 100),

                  Center(child: Image.asset('asset/image/faq.png')),

                  SizedBox(height: 30),

                  SizedBox(height: 50),

                  BuiltWidget(text: 'FAQ & ANS'),

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

                  Column(
                    key: roadmapKey,
                    children: [
                      SizedBox(height: 60),
                      Divider(thickness: 0.2),
                      SizedBox(height: 80),
                      Center(child: BuiltWidget(text: 'ROADMAP')),
                    ],
                  ),

                  const SizedBox(height: 30),
                  // Main Heading
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

                  BuiltWidget(text: 'OUR AVENGERS'),

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
                      buildCryptoIcon(
                        FontAwesomeIcons.facebookF,
                        containerHeight: 40,
                        color: Colors.white,
                        0,
                        iconSize: 20,
                      ),
                      buildCryptoIcon(
                        FontAwesomeIcons.xTwitter,
                        containerHeight: 40,
                        color: Colors.white,
                        0,
                        iconSize: 20,
                      ),
                      buildCryptoIcon(
                        FontAwesomeIcons.telegram,
                        containerHeight: 40,
                        color: Colors.white,
                        0,
                        iconSize: 20,
                      ),
                      buildCryptoIcon(
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
                            padding: EdgeInsetsGeometry.symmetric(vertical: 40),
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
                                  child: BuiltWidget(
                                    text: followData[index]['designation'],
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
                            child: buildCryptoIcon(
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
          // Fixed Header on Top
          HeaderWidget(),
        ],
      ),
      // Floating Action Button
      floatingActionButton: FloatingWidget(controller: homeScroll),
    );
  }


}
