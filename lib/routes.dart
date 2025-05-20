import 'package:biggi_pop/Screen/Cart/cart.dart';
import 'package:biggi_pop/Screen/Checkout/checkout.dart';
import 'package:biggi_pop/Screen/CustomizeScreen/customize_result.dart';
import 'package:biggi_pop/Screen/CustomizeScreen/customize_screen.dart';
import 'package:biggi_pop/Screen/Home/home.dart';
import 'package:get/get.dart';

import 'Screen/Dashboard/dashboard.dart';
import 'Screen/Login/login.dart';

class Routes {
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String home = '/home';
  static const String customizeScreen = '/customize_screen';
  static const String customizeResult = '/customize_result';
  static const String cart = '/cart';
  static const String checkout = '/Checkout';

  static final routes = [
    GetPage(name: login, page: () => const Login()),
    GetPage(name: dashboard, page: () => const Dashboard()),
    GetPage(name: home, page: () => const Home()),
    GetPage(name: customizeScreen, page: () => const CustomizeScreen()),
    GetPage(name: customizeResult, page: () => const CustomizeResult()),
    GetPage(name: cart, page: () => const Cart()),
    GetPage(name: checkout, page: () => const Checkout()),
  ];
}
