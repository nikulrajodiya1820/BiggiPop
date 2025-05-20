import 'package:biggi_pop/CommonFiles/constant.dart';
import 'package:biggi_pop/Screen/Dashboard/dashboard.dart';
import 'package:biggi_pop/Screen/Home/home.dart';
import 'package:biggi_pop/Screen/Landing/landing.dart';
import 'package:biggi_pop/Screen/Login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';

import 'routes.dart';

Future<void> main() async {
  await GetStorage.init();
  final storage = GetStorage();
  Constant.userSession = storage.read('UserSession');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Biggi Pop',
      getPages: Routes.routes,
      theme: ThemeData(useMaterial3: false,primaryColor: HexColor("#272f32"),),
      home: Constant.userSession!=null ? const Home() : const Home(),
    );
  }
}