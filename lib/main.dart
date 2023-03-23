import 'dart:ui';

import 'package:demo_app_test/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // Default screen size is Iphone 14
      designSize: const Size(390, 844),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Demo Application Test',
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: ScreenUtil().screenHeight * 0.25,
            left: ScreenUtil().screenWidth >= 600
                ? ScreenUtil().screenWidth * 0.2
                : ScreenUtil().screenWidth * 0.15,
            child: Container(
              width: ScreenUtil().screenWidth >= 600 ? 145.w : 120.w,
              height: ScreenUtil().screenWidth >= 600 ? 145.h : 120.h,
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.7),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: ScreenUtil().screenHeight * 0.35,
            right: ScreenUtil().screenWidth * 0.15,
            child: Container(
              width: ScreenUtil().screenWidth >= 600 ? 145.w : 120.w,
              height: ScreenUtil().screenWidth >= 600 ? 145.h : 120.h,
              decoration: BoxDecoration(
                color: Colors.lightBlue.withOpacity(0.4),
                shape: BoxShape.circle,
              ),
            ),
          ),
          _buildFilterBackground(),
          _buildImageLogo(
              screenHeight: ScreenUtil().screenHeight,
              screenWidth: ScreenUtil().screenWidth),
        ],
      ),
    );
  }

  Widget _buildFilterBackground() {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: Constants.scaleSigma,
        sigmaY: Constants.scaleSigma,
      ),
      child: Container(color: Colors.black.withOpacity(0)),
    );
  }

  Widget _buildImageLogo({
    required double screenHeight,
    required double screenWidth,
  }) {
    return Positioned(
      top: screenHeight * 0.12,
      right: screenWidth >= 600 ? screenWidth * 0.3 : screenWidth * 0.2,
      child: SvgPicture.asset(
        Constants.pathImage,
        width: 120.w,
        height: 200.h,
      ),
    );
  }
}
