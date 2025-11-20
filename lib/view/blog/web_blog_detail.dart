import 'package:flutter/material.dart';
import 'package:webze_web/widget/footer_widget.dart';

import '../../widget/built_widget.dart';
import '../../widget/custom_text.dart';
import 'package:webze_web/widget/desktop_appbar.dart';

class WebBlogDetail extends StatefulWidget {
  const WebBlogDetail({super.key});

  @override
  State<WebBlogDetail> createState() => _WebBlogDetailState();
}

class _WebBlogDetailState extends State<WebBlogDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Stack(
        children: [
          // Scrollable Content
          SingleChildScrollView(

            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 16,
                top: 180,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 120),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: BuiltWidget(text: 'BUILT ON WEB3. POWERED BY YOU',fontSize: 13,),
                        ),
                        SizedBox(height: 25),
                        Center(
                          child: CustomText(
                            text: 'Blog Details',
                            fontSize: 55,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),

                        SizedBox(height: 50),

                        Row(
                          spacing: 40,
                          children: [
                            Expanded(
                              child: Container(
                                height: MediaQuery.sizeOf(context).height * 0.5,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('asset/image/d1.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadiusGeometry.circular(20),
                                ),
                              ),
                            ),


                            Expanded(
                              child: Container(
                                height: MediaQuery.sizeOf(context).height * 0.5,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('asset/image/d2.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadiusGeometry.circular(20),
                                ),
                              ),
                            ),
                          ],
                        ),



                        SizedBox(height: 40),
                        CustomText(
                          text: 'January 31, 2025'.toUpperCase(),
                          fontSize: 17,
                          color: Colors.orangeAccent,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(height: 10),
                        CustomText(
                          text: 'Intro of the news',
                          fontSize: 50,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),

                        SizedBox(height: 20),
                        CustomText(
                          text:
                          "The adoption of blockchain by fifteen Indian banks for trade finance signifies a significant step toward enhancing efficiency, transparency, and security in financial transactions. Blockchain's decentralized and immutable nature allows for real-time tracking and reduced risks of fraud, streamlining processes like document verification and cross-border payments. This move could revolutionize traditional banking operations, fostering trust and collaboration among global trade participants. Fifteen leading Indian banks have collectively adopted blockchain technology to transform trade finance, a vital sector in global commerce. Trade finance involves processes like issuing letters of credit, managing cross-border payments, and mitigating risks such as non-payment or fraud. Blockchain's decentralized and immutable nature offers a significant advantage by ensuring transparency, security, and efficiency. Through a permissioned blockchain platform, these banks are digitizing critical processes such as electronic bills of lading and letters of credit. This reduces paperwork, accelerates transaction times, and eliminates intermediaries, ultimately cutting costs.",
                          fontSize: 17,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 20),
                        CustomText(
                          text:
                          "The adoption aims to enhance trust among stakeholders, including importers, exporters, and regulators, while also minimizing fraud by authenticating documents and preventing double financing. Blockchain's audit trail further aids regulatory compliance, making cross-border trade smoother and more reliable. This initiative aligns with global efforts like Marco Polo and Voltron, positioning India as a key player in the blockchain-driven trade finance landscape. However, challenges such as high implementation costs, interoperability issues with global platforms, and regulatory complexities remain. Despite these hurdles, this step is a major milestone that could inspire broader blockchain integration in banking, fostering efficiency, security, and economic growth.",
                          fontSize: 17,
                          color: Colors.grey,
                        ),

                        SizedBox(height: 60),

                        Row(
                          spacing: 30,
                          children: [
                            Expanded(
                              child: Container(
                                height: MediaQuery.sizeOf(context).height * 0.7,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('asset/image/d3.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadiusGeometry.circular(20),
                                ),
                              ),
                            ),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: 'What is Trade Finance?',
                                    fontSize: 35,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),

                                  SizedBox(height: 30),

                                  listTileWidget(
                                    "Indian banks’ blockchain adoption aligns with global efforts like Marco Polo and Voltron, blockchain platforms for trade finance.",
                                  ),

                                  SizedBox(height: 15),
                                  listTileWidget(
                                    "Implementing blockchain systems requires significant investment in technology and training.",
                                  ),
                                  SizedBox(height: 15),
                                  listTileWidget(
                                    "This move is expected to lay the groundwork for broader blockchain adoption in other banking services, such as supply chain financing.",
                                  ),
                                  SizedBox(height: 15),
                                  listTileWidget(
                                    "Real-time settlements, and retail banking. It demonstrates how blockchain can redefine traditional financial operations.",
                                  ),

                                ],
                              ),
                            )


                          ],
                        ),

                        SizedBox(height: 30),
                        CustomText(text: "The adoption of blockchain by fifteen Indian banks for trade finance signifies a significant step toward enhancing efficiency, transparency, and security in financial transactions. Blockchain's decentralized and immutable nature allows for real-time tracking and reduced risks of fraud, streamlining processes like document verification and cross-border payments. This move could revolutionize traditional banking operations, fostering trust and collaboration among global trade participants. Fifteen leading Indian banks have collectively adopted blockchain technology to transform trade finance, a vital sector in global commerce.",fontSize: 17,color: Colors.grey,),
                        SizedBox(height: 40,),







                        IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// GOLD VERTICAL LINE
                              Container(
                                width: 1,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.orangeAccent,
                                      Colors.grey.shade800,
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                              ),

                              const SizedBox(width: 15),

                              /// QUOTE + NAME SECTION
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text:  "“ Blockchain's decentralized and immutable nature "
                                          "allows for real-time tracking and reduced risks of fraud, "
                                          "streamlining processes like document verification and "
                                          "cross-border payments. ”",

                                      color: Colors.white,
                                      fontSize: 17,
                                      height: 1.5,
                                      fontWeight: FontWeight.w600,

                                    ),

                                    const SizedBox(height: 20),

                                    CustomText(
                                      text: "Miranda H. Halim",

                                      color: Colors.orangeAccent,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,

                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 30,),

                        CustomText(text: "Blockchain's audit trail further aids regulatory compliance, making cross-border trade smoother and more reliable. This initiative aligns with global efforts like Marco Polo and Voltron, positioning India as a key player in the blockchain-driven trade finance landscape. However, challenges such as high implementation costs, interoperability issues with global platforms, and regulatory complexities remain. Despite these hurdles, this step is a major milestone that could inspire broader blockchain integration in banking, fostering efficiency, security, and economic growth.",fontSize: 17,color: Colors.grey,),

                        SizedBox(height: 20,),

                        CustomText(text: "The adoption of blockchain by fifteen Indian banks for trade finance signifies a significant step toward enhancing efficiency, transparency, and security in financial transactions. Blockchain's decentralized and immutable nature allows for real-time tracking and reduced risks of fraud, streamlining processes like document verification and cross-border payments. This move could revolutionize traditional banking operations, fostering trust and collaboration among global trade participants. Fifteen leading Indian banks have collectively adopted blockchain technology to transform trade finance, a vital sector in global commerce. Trade finance involves processes like issuing letters of credit, managing cross-border payments, and mitigating risks such as non-payment or fraud. Blockchain's decentralized and immutable nature offers a significant advantage by ensuring transparency, security, and efficiency. Through a permissioned blockchain platform, these banks are digitizing critical processes such as electronic bills of lading and letters of credit. This reduces paperwork, accelerates transaction times, and eliminates intermediaries, ultimately cutting costs.",fontSize: 17,color: Colors.grey,),

                        SizedBox(height: 100),


                      ],
                    ),
                  ),

                  WebFooterWidget(),
                ],
              ),
            ),
          ),

          // Fixed Header on Top
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 30),
            child: DesktopAppbar(),
          ),
        ],
      ),
      // floatingActionButton: FloatingWidget(controller: _scrollController),

    );
  }
  Widget listTileWidget(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: text, fontSize: 16, color: Colors.grey),
        SizedBox(height: 15),
        Divider(thickness: 0.2),
      ],
    );
  }
}
