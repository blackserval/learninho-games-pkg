import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget web;

  const ResponsiveWidget({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.web,
  });

  static const int mobileBreakpointWidth = 600;
  static const int tabletBreakpointWidth = 1200;

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileBreakpointWidth;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= mobileBreakpointWidth &&
        MediaQuery.of(context).size.width < tabletBreakpointWidth;
  }

  static bool isWeb(BuildContext context) {
    return MediaQuery.of(context).size.width >= tabletBreakpointWidth;
  }

  @override
  Widget build(BuildContext context) {
    if (isMobile(context)) {
      return mobile;
    } else if (isTablet(context)) {
      return tablet;
    } else {
      return web;
    }
  }
}
