import 'package:flutter/material.dart';
import 'package:grocery_app/dashboard/address_detail.dart';
import 'package:grocery_app/dashboard/appearance_page.dart';
import 'package:grocery_app/dashboard/checkout_summary.dart';
import 'package:grocery_app/dashboard/dashboard.dart';
import 'package:grocery_app/dashboard/filter.dart';
import 'package:grocery_app/dashboard/order_success.dart';
import 'package:grocery_app/dashboard/payment_method.dart';
import 'package:grocery_app/dashboard/previous_order_detail.dart';
import 'package:grocery_app/dashboard/search_page.dart';
import 'package:grocery_app/dashboard/storepage.dart';
import 'package:grocery_app/dashboard/product_detail_page.dart';
import 'package:grocery_app/dashboard/trackorder_1.dart';
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
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // All scaffolds will be white
      ),
      // home: SplashScreen(),
      // home: Onboarding1(),
      // home: Onboarding2(),
      // home: Onboarding3(),
      // home: Onboarding4(),
      // home: GetStartedScreen(),
      // home: OtpScreen(),
      // home: SelectCategory(),
      // home: SetLocation(),
      // home: EnableNotification(),
      // home: HomePage(),
      // home: Dashboard(),
      // home: Storepage(),
      // home: ProductDetailPage(),
      // home: OrderDetail(),
      home: CheckoutSummary(),
      // home: PaymentMethod(),
      // home: SearchPage(),
      // home: Filter(),
      // home: AddressDetail(),
      // home: AppearancePage(),
      // home: OrderSuccessPage(),
      // home: Trackorder1(),
    );
  }
}
