import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../main.dart';
import '../../styles/app_colors.dart';
import '../nav_bar/nav_bar_screen.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to HomeScreen after a delay
    Timer(Duration(seconds: 3), () {
      Navigator.of(Get.context!).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => NavBarScreen(),),
            (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.white, AppColors.splashBg],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'logoHero',
              child: Image.asset(
                'assets/icon/logo.png',
                width: 200.w,
                height: 200.h,
              ),
            ),
            SizedBox(height: 16.h),
            // Text(
            //   'My App',
            //   style: TextStyle(
            //     fontSize: 28,
            //     color: Colors.white,
            //     fontWeight: FontWeight.w700,
            //     letterSpacing: 1.2,
            //   ),
            // ),

          ],
        ),
      ),
    );
  }
}
