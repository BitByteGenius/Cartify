import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBreakpoints {
  static const double phone = 600; // <600dp
  static const double tablet = 900; // 600-900dp
  static const double largeTablet = 1200; // 900-1200dp
  static const double desktop = 1200; // >1200dp
}

/// Initialize screen util in the root widget
class ResponsiveInit extends StatelessWidget {
  final Widget child;
  const ResponsiveInit({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // base iPhone size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, _) => child,
    );
  }
}

/// Helper extensions for responsive sizing
extension SizeExtension on num {
  double get w => ScreenUtil().setWidth(toDouble());
  double get h => ScreenUtil().setHeight(toDouble());
  double get r => ScreenUtil().radius(toDouble());
  double get sp => ScreenUtil().setSp(toDouble());
}
