import 'package:flutter/material.dart';
import 'package:webze_web/widget/footer_widget.dart';

import '../../constant_data/data.dart';
import '../../widget/built_widget.dart';
import '../../widget/custom_text.dart';
import '../../widget/purchase_button.dart';
import 'package:webze_web/widget/desktop_appbar.dart';

class WebBlogScreen extends StatefulWidget {
  const WebBlogScreen({super.key});

  @override
  State<WebBlogScreen> createState() => _WebBlogScreenState();
}

class _WebBlogScreenState extends State<WebBlogScreen> {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: BuiltWidget(text: 'BUILT ON WEB3. POWERED BY YOU',fontSize: 13,),
                  ),
                  SizedBox(height: 25,),
                  Center(child: CustomText(text: 'Blog & insights',fontSize: 55,fontWeight: FontWeight.w800,color: Colors.white)),

                  SizedBox(height: 100,),




                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 120),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,

                        crossAxisSpacing: 30,
                        mainAxisSpacing: 60,

                      ),
                      itemCount: blogData.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('${blogData[index]['image']}'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            CustomText(
                              text: '${blogData[index]['month-data']}, ${blogData[index]['year']}',
                              fontSize: 17,
                              color: Colors.orangeAccent,
                              fontWeight: FontWeight.w700,
                            ),
                            SizedBox(height: 15),
                            CustomText(
                              text: blogData[index]['title'],
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 60,),

                  PurchaseButton(text: "LOAD MORE",alignmentGeometry: Alignment.center,),

                  SizedBox(height: 100,),

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
}
