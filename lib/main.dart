import 'package:flutter/material.dart';
import 'package:grocery_app/test_api.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:grocery_app/dashboard/address_detail.dart';
import 'package:grocery_app/dashboard/appearance_page.dart';
import 'package:grocery_app/dashboard/cart/cart.dart';
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
import 'package:grocery_app/core/models/grocery.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('Flutter'); // box for storing profile info
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),

      initialRoute: '/splash',

      // 🔹 Define all routes here
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/onboarding1': (context) => const Onboarding1(),
        '/onboarding2': (context) => const Onboarding2(),
        '/onboarding3': (context) => const Onboarding3(),
        '/onboarding4': (context) => const Onboarding4(),
        '/getStarted': (context) => const GetStartedScreen(),
        '/otp': (context) => const OtpScreen(),
        '/selectCategory': (context) => const SelectCategory(),
        '/setLocation': (context) => const SetLocation(),
        '/enableNotification': (context) => const EnableNotification(),
        '/home': (context) => const Dashboard(initialIndex: 0),
        '/myCart': (context) => cofnst Dashboard(initialIndex: 1),
        '/profileDetail': (context) => const Dashboard(initialIndex: 3),
        '/storePage': (context) {
          final args = ModalRoute.of(context)?.settings.arguments;
          if (args == null || args is! Store) {
            return Scaffold(
              body: Center(child: Text('No store data provided')),
            );
          }

          final store = args;
          return StorePage(store: store);
        },

        '/productDetail': (context) {
          final product = ModalRoute.of(context)!.settings.arguments as Product;
          return ProductDetailPage(product: product);
        },
        '/orderDetail': (context) => const OrderDetail(),
        '/checkout': (context) => const CheckoutSummary(),
        '/paymentMethod': (context) => const PaymentMethod(),
        '/search': (context) => const SearchPage(),
        '/filter': (context) => const Filter(),
        '/addressDetail': (context) => const AddressDetail(),
        '/appearance': (context) => const AppearancePage(),
        '/orderSuccess': (context) => const OrderSuccessPage(),
        '/trackOrder': (context) => const Trackorder1(),
      },

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
      // home: CheckoutSummary(),
      // home: PaymentMethod(),
      // home: SearchPage(),
      // home: Filter(),
      // home: AddressDetail(),
      // home: AppearancePage(),
      // home: OrderSuccessPage(),
      // home: Trackorder1(),

      // home: GroceryScreen()
    );
  }
}
