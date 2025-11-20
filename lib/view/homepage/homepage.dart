import 'package:flutter/material.dart';
import 'package:webze_web/view/homepage/desktop_home.dart';
import 'package:webze_web/view/homepage/mobile_home.dart';

import '../../constant_data/responsive.dart';

class Homepage extends StatelessWidget {


  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: MobileHome(),
      tablet: MobileHome(),
      desktop: DesktopHomepage(),
    );
  }
}
