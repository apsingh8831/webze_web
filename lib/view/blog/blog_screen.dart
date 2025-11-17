import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webze_web/widget/footer_widget.dart';
import 'package:webze_web/widget/header_widget.dart';

import '../../widget/built_widget.dart';
import '../../widget/custom_text.dart';
import '../../widget/floating_widget.dart';
import '../../widget/purchase_button.dart';
import '../../widget/webze_drawer.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {

  final ScrollController _scrollController = ScrollController();


  List<Map<String, String>> blogData = [
    {
      'image':'asset/image/b1.jpg',
      'month-data':'January 31',
      'year':'2025',
      'title':'Blockchain enhances transparency in food supply chains.'
    },
    {
      'image':'asset/image/b2.jpg',
      'month-data':'January 31',
      'year':'2025',
      'title':'Lagos plans to integrate blockchain in education.'
    },
    {
      'image':'asset/image/b3.jpg',
      'month-data':'January 31',
      'year':'2025',
      'title':'Bangladesh should embrace blockchain, says official.'
    },
    {
      'image':'asset/image/b4.jpg',
      'month-data':'January 31',
      'year':'2025',
      'title':'Cryptoverse: Blockchain bridges encounter challenges ahead.'
    },
    {
      'image':'asset/image/b5.jpg',
      'month-data':'January 31',
      'year':'2025',
      'title':'Fifteen Indian banks adopt blockchain trade finance.'
    },
    {
      'image':'asset/image/b6.jpg',
      'month-data':'January 31',
      'year':'2025',
      'title':'Blockchain summit in Bangladesh scheduled tomorrow.'
    },
    {
      'image':'asset/image/b7.jpg',
      'month-data':'January 31',
      'year':'2025',
      'title':'Bangladesh hosts three-day Blockchain Olympiad event.'
    },
    {
      'image':'asset/image/b8.jpg',
      'month-data':'January 31',
      'year':'2025',
      'title':'Rethinking blockchain for business amid GenAI era.'
    },
    {
      'image':'asset/image/b9.jpg',
      'month-data':'January 31',
      'year':'2025',
      'title':'Digital Bangladesh introduces blockchain, emerging technologies.'
    },
    {
      'image':'asset/image/b10.jpg',
      'month-data':'January 31',
      'year':'2025',
      'title':'Blockchain seminar held at AIUB university.'
    },
    {
      'image':'asset/image/b11.jpg',
      'month-data':'January 31',
      'year':'2025',
      'title':"Blockchain combats fake drugs in Nigeria's markets."
    },
    {
      'image':'asset/image/b12.jpg',
      'month-data':'January 31',
      'year':'2025',
      'title':'Thriving Skills to host first blockchain summit.'
    },
    {
      'image':'asset/image/b13.jpg',
      'month-data':'January 31',
      'year':'2025',
      'title':'Enhancing tax transparency with blockchain technology.'
    },
    {
      'image':'asset/image/b14.jpg',
      'month-data':'January 31',
      'year':'2025',
      'title':"Blockchain's potential extends beyond Bitcoin applications."
    },
    {
      'image':'asset/image/b15.jpg',
      'month-data':'January 31',
      'year':'2025',
      'title':'Bangladesh, India conduct first blockchain-enabled trade.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      endDrawer: const WebzeDrawer(),
      body: Stack(
        children: [
          // Scrollable Content
          SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 16,
                top: 180,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: BuiltWidget(text: 'BUILT ON WEB3. POWERED BY YOU'),
                  ),
                  SizedBox(height: 25,),
                  Center(child: CustomText(text: 'Blog & insights',fontSize: 35,fontWeight: FontWeight.w800,color: Colors.white)),

                  SizedBox(height: 50,),

                  Column(
                    spacing: 60,
                    children: List.generate(blogData.length, (index){
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.sizeOf(context).height * 0.25,
                            width: double.infinity,
                            decoration: BoxDecoration(

                                image: DecorationImage(image: AssetImage('${blogData[index]['image']}'),fit: BoxFit.fill),
                                borderRadius: BorderRadiusGeometry.circular(20)
                            ),
                          ),
                          SizedBox(height: 20,),
                          CustomText(text: '${blogData[index]['month-data']},${blogData[index]['year']}',fontSize: 17,color: Colors.orangeAccent,fontWeight: FontWeight.w700,),
                          SizedBox(height: 15),
                          CustomText(text: blogData[index]['title'],fontSize: 20,color: Colors.white,fontWeight: FontWeight.w700,)

                        ],
                      );
                    }),
                  ),

                  SizedBox(height: 60,),

                  PurchaseButton(text: "LOAD MORE",alignmentGeometry: Alignment.center,),

                  SizedBox(height: 100,),

                  FooterWidget(),

                ],
              ),
            ),
          ),
          // Fixed Header on Top

          HeaderWidget(),


        ],
      ),
      floatingActionButton: FloatingWidget(controller: _scrollController),
    );
  }
}
