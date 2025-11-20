import 'package:flutter/material.dart';


class AppBreakpoints { static const double mobile = 600; static const double tablet = 1300; }

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  // 👍 Helper method => tablet?
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= AppBreakpoints.mobile &&
          MediaQuery.of(context).size.width < AppBreakpoints.tablet;

  // 👍 Helper method => mobile?
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < AppBreakpoints.mobile;

  // 👍 Helper method => desktop?
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= AppBreakpoints.tablet;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < AppBreakpoints.mobile) {
          return mobile;
        } else if (constraints.maxWidth < AppBreakpoints.tablet) {
          return tablet;
        } else {
          return desktop;
        }
      },
    );
  }
}
