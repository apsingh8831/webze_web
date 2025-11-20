import 'package:flutter/material.dart';
import 'package:webze_web/view/blog/mobile_blog_screen.dart';

import '../../constant_data/responsive.dart';


class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(mobile: MobileBlogScreen(), tablet: MobileBlogScreen(), desktop: MobileBlogScreen());
  }
}
