import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:webze_web/widget/built_widget.dart';
import 'package:webze_web/widget/purchase_button.dart';
import 'package:webze_web/widget/token_sale.dart';
import 'package:webze_web/widget/button.dart';
import 'package:webze_web/widget/desktop_appbar.dart';
import '../../constant_data/data.dart';
import '../../provider/drawer_provider.dart';
import '../../widget/buil_crypto_icon.dart';
import '../../widget/crypto_card.dart';
import '../../widget/crypto_faq.dart';
import '../../widget/custom_text.dart';
import '../../widget/footer_widget.dart';
import '../../widget/scrolling_text.dart';
import '../../widget/webze_drawer.dart';

class DesktopHomepage extends StatefulWidget {
  final String? scrollTo;
  const DesktopHomepage({super.key, this.scrollTo});

  @override
  State<DesktopHomepage> createState() => DesktopHomepageState();
}

class DesktopHomepageState extends State<DesktopHomepage>
    with TickerProviderStateMixin {

  static DesktopHomepageState? instance;

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
    // TODO: implement initState
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      endDrawer: const WebzeDrawer(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only( top: 140),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: BuiltWidget(
                      text: 'BUILT ON WEB3. POWERED BY YOU',
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: GoogleFonts.nunito(
                          fontSize: 50,
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
                  SizedBox(height: 40),
                  Center(
                    child: CustomText(
                      text:
                      'Leverage on any tokens with a protocol trusted with billions\nfor its performance and reliability.',
                      fontSize: 22,
                      textAlign: TextAlign.center,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 40),

                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.35,
                    alignment: Alignment.center,

                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.grey.shade800, width: 1),
                    ),
                    child: Row(
                      children: [
                        Expanded(
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

                        CustomBuyButton(
                          onPressed: () {},
                          height: 50,
                          text: 'GET EARLY ACCESS',
                          width: 190,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                  // Footer Text
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.nunito(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                        children: const [
                          TextSpan(text: 'Start monitoring for free or '),
                          TextSpan(
                            text: 'msg us!',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: AnimatedBuilder(
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
                                height: MediaQuery.sizeOf(context).height * 0.2,
                              ),
                            ),
                            // i2 - Rotate
                            Padding(
                              padding: const EdgeInsets.only(top: 80),
                              child: Transform.rotate(
                                angle: _rotationAnimation.value,
                                child: Image.asset(
                                  'asset/image/i2.png',
                                  height: MediaQuery.sizeOf(context).height * 0.3,
                                ),
                              ),
                            ),
                            // i3 - Upar Neeche
                            Transform.translate(
                              offset: Offset(0, _animation3.value),
                              child: Image.asset(
                                'asset/image/i3.png',
                                height: MediaQuery.sizeOf(context).height * 0.2,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    key: featureKey,
                    children: [
                      const SizedBox(height: 150),
                      Center(
                        child: BuiltWidget(text: 'ACCESSIBLE FOR EVERYONE', fontSize: 13,),
                      ),

                      // Badge
                      const SizedBox(height: 20),

                      // Main Heading
                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: GoogleFonts.nunito(
                              fontSize: 50,
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
                                text: ' \naccessible',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 50),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 100),
                        child: Column(

                          spacing: 30,
                          children: [
                            // First Row - Index 0 and 1
                            Row(
                              spacing: 30,
                              children: List.generate(
                                listData.length >= 2 ? 2 : listData.length,
                                    (index) {
                                  return Expanded(
                                    child: Container(
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
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              '${listData[index]['image']}',
                                              height: MediaQuery.sizeOf(context).height * 0.2,
                                            ),
                                            SizedBox(width: 20),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  RichText(
                                                    text: TextSpan(
                                                      style: GoogleFonts.nunito(
                                                        fontSize: 30,
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
                                                    fontSize: 20,
                                                    textAlign: TextAlign.start,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),

                            // Second Row - Index 2, 3, 4...
                            if (listData.length > 2)
                              Row(
                                spacing: 30,
                                children: List.generate(
                                  listData.length - 2,
                                      (i) {
                                    int index = i + 2; // Start from index 2
                                    return Expanded(
                                      child: Container(
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
                                                height: MediaQuery.sizeOf(context).height * 0.2,
                                              ),
                                              SizedBox(height: 50),
                                              RichText(
                                                textAlign: TextAlign.center,
                                                text: TextSpan(
                                                  style: GoogleFonts.nunito(
                                                    fontSize: 30,
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
                                                fontSize: 20,
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40,),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        key: tokenKey,
                        children: [
                          SizedBox(height: 50),
                          MarqueeText(
                            text: 'You will hold the way you loved Webze',
                            textStyle: GoogleFonts.nunito(
                              fontSize: 120,
                              color: Colors.white24,
                              fontWeight: FontWeight.w800,
                            ),
                            velocity: 30.0, // Speed control
                          ),
                          SizedBox(height: 50),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 100),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      BuiltWidget(text: 'ACCESSIBLE FOR EVERYONE',fontSize: 13,),

                                      const SizedBox(height: 30),
                                      // Main Heading
                                      RichText(
                                        text: TextSpan(
                                          style: GoogleFonts.nunito(
                                            fontSize: 50,
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
                                        fontSize: 20,
                                        color: Colors.grey,
                                      ),

                                      SizedBox(height: 50,),

                                      PurchaseButton(text: 'PURCHASE NOW', alignmentGeometry: AlignmentDirectional.centerStart)
                                    ],
                                  ),
                                ),

                                SizedBox(width: 100),

                                Expanded(child: TokenSaleWidget()),


                              ],
                            ),
                          ),



                        ],
                      ),

                      Column(
                        key: howItWorksKey,
                        children: [
                          SizedBox(height: 60),
                          Divider(thickness: 0.2),
                          SizedBox(height: 80),

                          Center(child: BuiltWidget(text: 'HOW IT WORKS?',fontSize: 13,)),

                          const SizedBox(height: 30),
                          // Main Heading
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: GoogleFonts.nunito(
                                fontSize: 50,

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
                                  text: ' \nmarketplace',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),



                      SizedBox(height: 100,),

                      Stack(
                        children: [
                          // Center Image
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
                                height: MediaQuery.sizeOf(context).height * 0.5,
                              ),
                            ),
                          ),

                          // Items positioned around the image
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 100),
                            child: Column(
                              children: [

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Left Top - Index 0
                                    Expanded(
                                      child: _buildItem(0),
                                    ),

                                    SizedBox(width: MediaQuery.sizeOf(context).width * 0.3),

                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: _buildItem(1),
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Left Bottom - Index 2
                                    Expanded(
                                      child: _buildItem(2),
                                    ),

                                    SizedBox(width: MediaQuery.sizeOf(context).width * 0.3),

                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: _buildItem(3),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 80),

                      Container(
                        width: double.infinity,
                        margin: EdgeInsetsGeometry.symmetric(horizontal: 100),
                        decoration: BoxDecoration(
                          color: Color(0xFF1a1a1a), // Darker background to match design
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey.shade900, width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset('asset/image/i3.png',scale: 1.5,),

                              SizedBox(width: 30,),
                              // Left side - Icon and Text
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Settings/Gear Icon

                                    SizedBox(height: 40),
                                    // Title
                                    RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.nunito(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w800,
                                          height: 1.2,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: 'Exchange ',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          TextSpan(
                                            text: 'availability',
                                            style: TextStyle(color: Colors.grey.shade700),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    // Description
                                    Text(
                                      'AI-powered tools to detect and prevent\nfraudulent activities.',
                                      style: GoogleFonts.nunito(
                                        color: Colors.grey.shade600,
                                        fontSize: 20,
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Right side - Crypto Icons
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  _buildCryptoIcon(Icons.currency_bitcoin, Colors.amber.shade600),
                                  SizedBox(width: 10),
                                  _buildCryptoIcon(FontAwesomeIcons.ethereum, Colors.amber.shade600),
                                  SizedBox(width: 10),
                                  _buildCryptoIcon(Icons.layers, Colors.amber.shade600),
                                  SizedBox(width: 10),
                                  _buildCryptoIcon(Icons.change_history, Colors.amber.shade600),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 60),
                      Divider(thickness: 0.2),
                      SizedBox(height: 80),

                      Center(child: BuiltWidget(text: 'CRYPTO DIRECTION',fontSize: 13,)),

                      const SizedBox(height: 30),
                      // Main Heading
                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: GoogleFonts.nunito(
                              fontSize: 50,

                              fontWeight: FontWeight.w800,
                              height: 1.2,
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
                                text: ' \nto users interests.',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),


                      SizedBox(height: 60),

                      webCryptoCardsWidget(),

                      SizedBox(height: 100),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 100),
                        child: Row(
                          children: [
                            Image.asset('asset/image/faq.png'),

                            SizedBox(width: 100,),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  BuiltWidget(text: 'FAQ & ANS',fontSize: 13,),

                                  const SizedBox(height: 30),
                                  RichText(
                                    text: TextSpan(
                                      style: GoogleFonts.nunito(
                                        fontSize: 60,
                                        fontWeight: FontWeight.w800,
                                        height: 1.2,
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
                                          text: ' \nanswer',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: 60),

                                  CryptoFAQWidget(),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),


                      Column(
                        key: roadmapKey,
                        children: [
                          SizedBox(height: 60),
                          Divider(thickness: 0.2),
                          SizedBox(height: 80),

                          Center(child: BuiltWidget(text: 'ROADMAP',fontSize: 13,)),
                        ],
                      ),

                      const SizedBox(height: 30),
                      // Main Heading
                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: GoogleFonts.nunito(
                              fontSize: 50,

                              fontWeight: FontWeight.w800,
                              height: 1.2,
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

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 100),
                        child: Row(
                          spacing: 40,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(planningData.length, (index) {
                            return Expanded(
                              child: Column(
                                children: [
                                  // ---- TOP IMAGE ----
                                  Image.asset(
                                    '${planningData[index]['image']}',
                                    height: MediaQuery.sizeOf(context).height * 0.15,
                                  ),

                                  const SizedBox(height: 25),

                                  // ---- YEAR ----
                                  CustomText(
                                    text:  planningData[index]['year'],

                                    fontSize: 32,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.orangeAccent,

                                  ),

                                  const SizedBox(height: 10),

                                  // ---- TITLE ----
                                  CustomText(
                                    text:  planningData[index]['title'],
                                    textAlign: TextAlign.center,
                                    fontSize: 20,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),

                      SizedBox(height: 80,),
                      Divider(thickness: 0.2),
                      SizedBox(height: 80,),



                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 100),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BuiltWidget(text: 'OUR AVENGERS'),
                                  const SizedBox(height: 30),

                                  // Main Heading
                                  RichText(
                                    text: TextSpan(
                                      style: GoogleFonts.nunito(
                                        fontSize: 55,
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
                                    text: 'Webzi brings our love for cryptocurrency into Web3! Like a frog\'s leap, the chart can jump at any moment. Boom!',
                                    fontSize: 20,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(height: 40),

                                  // Social Icons Row
                                  Row(
                                    children: [
                                      CustomText(
                                        text: 'FOLLOW US',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                      ),
                                      SizedBox(width: 20),
                                      buildCryptoIcon(
                                        FontAwesomeIcons.facebookF,
                                        containerHeight: 40,
                                        color: Colors.white,
                                        0,
                                        iconSize: 20,
                                      ),
                                      SizedBox(width: 10),
                                      buildCryptoIcon(
                                        FontAwesomeIcons.xTwitter,
                                        containerHeight: 40,
                                        color: Colors.white,
                                        0,
                                        iconSize: 20,
                                      ),
                                      SizedBox(width: 10),
                                      buildCryptoIcon(
                                        FontAwesomeIcons.telegram,
                                        containerHeight: 40,
                                        color: Colors.white,
                                        0,
                                        iconSize: 20,
                                      ),
                                      SizedBox(width: 10),
                                      buildCryptoIcon(
                                        FontAwesomeIcons.discord,
                                        containerHeight: 40,
                                        color: Colors.white,
                                        0,
                                        iconSize: 20,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 100),

                            // Team Grid Section
                            Expanded(
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  final cardWidth = (constraints.maxWidth - 25) / 2;

                                  return Wrap(
                                    spacing: 25,
                                    runSpacing: 25,
                                    children: List.generate(followData.length, (index) {
                                      return SizedBox(
                                        width: cardWidth,
                                        child: Stack(
                                          children: [
                                            Container(
                                              width: cardWidth,
                                              padding: const EdgeInsets.symmetric(
                                                vertical: 40,
                                                horizontal: 20,
                                              ),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF111111),
                                                borderRadius: BorderRadius.circular(16),
                                                border: Border.all(
                                                  color: const Color(0xFF3A3A3A),
                                                  width: 1,
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  // Profile Image
                                                  CircleAvatar(
                                                    radius: 70,
                                                    backgroundColor: Colors.transparent,
                                                    backgroundImage: AssetImage(
                                                      followData[index]['image'],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20),

                                                  // Designation Tag
                                                  Container(
                                                    padding: const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 6,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Colors.amber.shade700,
                                                      borderRadius: BorderRadius.circular(30),
                                                    ),
                                                    child: Text(
                                                      followData[index]['designation'],
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20),

                                                  // Name
                                                  Text(
                                                    followData[index]['name'],
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 24,
                                                      fontWeight: FontWeight.w800,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            // Top Right Social Icon
                                            Positioned(
                                              top: 15,
                                              right: 15,
                                              child: Container(
                                                height: 48,
                                                width: 48,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.black.withOpacity(0.4),
                                                  border: Border.all(color: Colors.white12),
                                                ),
                                                child: Center(
                                                  child: Icon(
                                                    followData[index]['icon'],
                                                    size: 22,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),


                      SizedBox(height: 150),

                      WebFooterWidget(),

                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 30),
            child: DesktopAppbar(),
          ),
        ],
      ),
    );

  }
  Widget _buildItem(int index) {
    if (index >= marketplaceData.length) return SizedBox();

    String number = (index + 1).toString().padLeft(2, '0');
    bool isRightSide = index % 2 == 1;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Background Number
        Positioned(
          top: -20,
          left: isRightSide ? null : 0,
          right: isRightSide ? 0 : null,
          child: Text(
            number,
            style: TextStyle(
              color: Colors.white12,
              fontSize: 120,
              fontWeight: FontWeight.w900,
              height: 1,
            ),
          ),
        ),

        // Content
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            crossAxisAlignment: isRightSide
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              RichText(
                textAlign: isRightSide ? TextAlign.right : TextAlign.left,
                text: TextSpan(
                  style: GoogleFonts.nunito(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    height: 1.3,
                  ),
                  children: [
                    TextSpan(
                      text: '${marketplaceData[index]['title']} ',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextSpan(
                      text: '${marketplaceData[index]['title2']}',
                      style: TextStyle(color: Colors.white30),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              CustomText(
                text: marketplaceData[index]['subtitle'],
                fontSize: 20,
                color: Colors.grey,
                textAlign: isRightSide ? TextAlign.right : TextAlign.left,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCryptoIcon(IconData icon, Color color) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade900.withOpacity(0.5),
        border: Border.all(
          color: Colors.grey.shade800,
          width: 1,
        ),
      ),
      child: Icon(
        icon,
        size: 36,
        color: color,
      ),
    );
  }

}
