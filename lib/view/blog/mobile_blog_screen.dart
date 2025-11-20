import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webze_web/widget/footer_widget.dart';
import 'package:webze_web/widget/header_widget.dart';

import '../../constant_data/data.dart';
import '../../widget/built_widget.dart';
import '../../widget/custom_text.dart';
import '../../widget/floating_widget.dart';
import '../../widget/purchase_button.dart';
import '../../widget/webze_drawer.dart';

class MobileBlogScreen extends StatefulWidget {
  const MobileBlogScreen({super.key});

  @override
  State<MobileBlogScreen> createState() => _MobileBlogScreenState();
}

class _MobileBlogScreenState extends State<MobileBlogScreen> {

  final ScrollController _scrollController = ScrollController();




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
