
import 'dart:convert';

import 'package:biggi_pop/CommonFiles/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'package:stickereditor/stickereditor.dart';

class CustomizeResult extends StatefulWidget {
  const CustomizeResult({super.key});

  @override
  State<CustomizeResult> createState() => _CustomizeScreenState();
}

class _CustomizeScreenState extends State<CustomizeResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  HexColor("#272f32"),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.only(left: 15,top: 8,bottom: 8),
          child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.asset(Assets.profile,fit: BoxFit.cover,)),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Alica Tyler",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Premium User",
              style: TextStyle(color: Colors.white, fontSize: 14),
            )
          ],
        ),
        actions:  [
          const Center(
              child: Text(
            "2 Items",
            style: TextStyle(color: Colors.white),
          )),
          Icon(
            Icons.shopping_cart_outlined,
            size: 30,
            color: Colors.white,
          ).marginOnly(right: 15)
        ],
      ),
      body: Container(child: Image.memory(base64Decode(Get.arguments),height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,)));
  }
}

