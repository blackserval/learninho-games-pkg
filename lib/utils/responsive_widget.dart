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

  // Largura máxima para mobile em modo retrato
  static const int mobilePortraitBreakpointWidth = 600;
  // Largura mínima para mobile em modo paisagem
  static const int mobileLandscapeBreakpointWidth = 950;
  // Largura mínima para tablet em modo retrato
  static const int tabletPortraitBreakpointWidth = 900;
  // Largura mínima para tablet em modo paisagem
  static const int tabletLandscapeBreakpointWidth = 1200;

  static bool isMobile(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.width <= mobilePortraitBreakpointWidth;
    } else {
      return MediaQuery.of(context).size.width <=
          mobileLandscapeBreakpointWidth;
    }
  }

  static bool isTablet(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.width >
              mobilePortraitBreakpointWidth &&
          MediaQuery.of(context).size.width <= tabletPortraitBreakpointWidth;
    } else {
      return MediaQuery.of(context).size.width >
              mobileLandscapeBreakpointWidth &&
          MediaQuery.of(context).size.width <= tabletLandscapeBreakpointWidth;
    }
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
