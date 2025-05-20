// ignore_for_file: prefer_const_constructors

import 'package:biggi_pop/CommonFiles/Constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import '../routes.dart';

class BottomAppbar extends StatelessWidget {
  const BottomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(0),
        topLeft: Radius.circular(0),
      ),
      child: SizedBox(
        // color:  HexColor("#272f32"),
        height: 60,
        child: Row(children: [
          Expanded(
            flex: 1,
            child: option(
              context,
              1,
              "Home",
              Routes.dashboard,
              Icons.home_outlined,
            ),
          ),
          Expanded(
            flex: 1,
            child: option(
                context, 2, "Favorite",  Routes.dashboard, Icons.favorite_border_outlined),
          ),
          Expanded(
            flex: 1,
            child: option(context, 3, "Cart", Routes.dashboard,
                Icons.shopping_cart_outlined),
          ),
          Expanded(
            flex: 1,
            child: option(
                context, 5, "Profile", Routes.dashboard, Icons.person_2_outlined),
          )
        ]),
      ),
    );
    // );
  }
}

Widget option(context, tabIndex, label, route, icon) {
  return Container(
    child: GestureDetector(
      onTap: () {
        if (tabIndex == 1) {
          Get.offAllNamed(route);
        } else {
          if (Get.currentRoute == Routes.login) {
            Get.offAndToNamed(route);
          } else {
            Get.toNamed(route);
          }
        }
        Constant.selectedTab = tabIndex;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Constant.selectedTab == tabIndex
                ? Colors.white
                : Colors.black,
            size: 30,
          ),
          Text(label.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(color: Constant.selectedTab == tabIndex
                ? Colors.white
                : Colors.black, fontSize: 11))
        ],
      ),
    ),
  );
}
