import 'package:flutter/material.dart';
import 'package:grocery_app/dashboard/dashboard.dart';
import 'package:grocery_app/dashboard/storepage.dart';
import 'package:grocery_app/onboarding/enable_notification.dart';
import 'package:grocery_app/onboarding/get_started.dart';
import 'package:grocery_app/dashboard/home_page.dart';
import 'package:grocery_app/onboarding/otp.dart';
import 'package:grocery_app/onboarding/select_category.dart';
import 'package:grocery_app/widget/store_card.dart';
import 'splash_screen.dart';
import 'package:grocery_app/onboarding/onbording_1.dart';
import 'package:grocery_app/onboarding/onbording_2.dart';
import 'package:grocery_app/onboarding/onbording_3.dart';
import 'package:grocery_app/onboarding/onbording_4.dart';
import 'package:grocery_app/onboarding/get_started.dart';
import 'package:grocery_app/onboarding/set_location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: SplashScreen(),
      // home: Onboarding1(),
      // home: Onboarding2(),
      // home: Onboarding3(),
      // home: GetStartedScreen(),
      // home: OtpScreen(),
      // home: SelectCategory(),
      // home: SetLocation(),
      // home: EnableNotification(),
      // home: HomePage(),
      // home: Dashboard(),
      home: Storepage(),
    );
  }
}
