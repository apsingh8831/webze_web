import 'package:flutter/material.dart';
import 'package:webze_web/constant_data/responsive.dart';
import 'package:webze_web/view/blog/mobile_blog_detail.dart';
import 'package:webze_web/view/blog/web_blog_detail.dart';

class BlogDetail extends StatelessWidget {
  const BlogDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(mobile: MobileBlogDetail(), tablet: MobileBlogDetail(), desktop: WebBlogDetail());
  }
}
