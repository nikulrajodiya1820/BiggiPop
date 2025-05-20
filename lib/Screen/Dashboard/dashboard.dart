import 'dart:convert';
import 'dart:typed_data';

import 'package:biggi_pop/CommonComponents/app_bar_custom.dart';
import 'package:biggi_pop/CommonComponents/bottom_appBar.dart';
import 'package:biggi_pop/CommonFiles/assets.dart';
import 'package:biggi_pop/Screen/Dashboard/dashboard_controller.dart';
import 'package:biggi_pop/routes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var dashboardController = Get.put(DashboardController());
  final _designFor = Get.arguments ?? "Man";

  void _onItemTapped(int index) {
    dashboardController.selectedIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: HexColor("#272f32"),
      appBar: AppBarCustom(),
      // bottomNavigationBar: const BottomAppbar(),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  primary: true,
                  child: Column(children: [
                    const SizedBox(
                      height: 10,
                    ),
                    // SizedBox(
                    //     height: 100,
                    //     child: CarouselSlider(
                    //       options:
                    //           CarouselOptions(height: 400.0, autoPlay: true),
                    //       items: dashboardController.sliderImages.map((i) {
                    //         return Builder(
                    //           builder: (BuildContext context) {
                    //             return Stack(
                    //               children: [
                    //                 Container(
                    //                     width:
                    //                         MediaQuery.of(context).size.width,
                    //                     // padding: EdgeInsets.symmetric(horizontal: 5),
                    //                     margin: const EdgeInsets.symmetric(
                    //                       horizontal: 10.0,
                    //                     ),
                    //                     // decoration:
                    //                     //     BoxDecoration(color: Colors.amber),
                    //                     child: ClipRRect(
                    //                         borderRadius:
                    //                             const BorderRadius.all(
                    //                                 Radius.circular(10)),
                    //                         child: Image(
                    //                           image: AssetImage(i),
                    //                           fit: BoxFit.fitWidth,
                    //                         ))),
                    //                 Positioned(
                    //                   bottom: 10,
                    //                   left: 20,
                    //                   child: SizedBox(
                    //                       height: 30,
                    //                       child: ElevatedButton(
                    //                         style: ElevatedButton.styleFrom(
                    //                             backgroundColor: Colors.white,
                    //                             shape: RoundedRectangleBorder(
                    //                               borderRadius:
                    //                                   BorderRadius.circular(10),
                    //                             )),
                    //                         onPressed: () async {
                    //                           // Get.toNamed(
                    //                           //     Routes.customizeScreen);
                    //                         },
                    //                         child: Text(
                    //                           "Shop now",
                    //                           style: TextStyle(
                    //                               fontSize: 14,
                    //                               color: HexColor("#4b5153")),
                    //                         ),
                    //                       )),
                    //                 )
                    //               ],
                    //             );
                    //           },
                    //         );
                    //       }).toList(),
                    //     )),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // // TextFormField(
                    // //   style: const TextStyle(color: Colors.black),
                    // //   cursorColor: HexColor("#969897"),
                    // //   decoration: InputDecoration(
                    // //     fillColor: Colors.white,
                    // //     hintText: "Search",
                    // //     hintStyle: TextStyle(color: HexColor("#969897")),
                    // //     isDense: true,
                    // //     contentPadding: const EdgeInsets.symmetric(
                    // //         horizontal: 15, vertical: 13),
                    // //     focusedBorder: OutlineInputBorder(
                    // //       borderRadius: BorderRadius.circular(50),
                    // //       borderSide:
                    // //           BorderSide(color: HexColor("#969897"), width: 2),
                    // //     ),
                    // //     enabledBorder: OutlineInputBorder(
                    // //       borderRadius: BorderRadius.circular(50),
                    // //       borderSide:
                    // //           BorderSide(color: HexColor("#969897"), width: 2),
                    // //     ),
                    // //   ),
                    // // ),
                    // // const SizedBox(
                    // //   height: 20,
                    // // ),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    // const Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text("Popular",
                    //         style: TextStyle(
                    //             fontSize: 18,
                    //             color: Colors.white,
                    //             fontWeight: FontWeight.bold)),
                    //     Text(
                    //       "View All",
                    //       style: TextStyle(fontSize: 16, color: Colors.grey),
                    //     )
                    //   ],
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    for (dynamic item in _designFor == "Men"
                        ? dashboardController.mensDesignList
                        : dashboardController.womensDesignList)
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () async {
                          final ByteData bytes =
                              await rootBundle.load(item['Image']);
                          final Uint8List list = bytes.buffer.asUint8List();
                          // final editedImage =
                          // ignore: use_build_context_synchronously
                          //   await Navigator.push(
                          // context,
                          // MaterialPageRoute(
                          //   builder: (context) =>
                          //       ImageEditor(
                          //           image: list),
                          //   ),
                          // );
                          // if (editedImage != null) {
                          // final imageEncoded = base64
                          //     .encode(list);
                          // print(imageEncoded.toString());
                          Get.toNamed(Routes.customizeScreen, arguments: list);
                          // Get.toNamed(Routes.customizeScreen,arguments: imageEncoded);
                          // }
                        },
                        child: Card(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(15)),
                                  child: Image.asset(
                                    item['Image'] ?? "",
                                    height: 225,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      item['Name'] ?? "",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      item['Price'] ?? "",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(width: 1),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5))),
                                      padding: const EdgeInsets.all(8),
                                      child: const Text("Design your T-Shirt"),
                                    )
                                  ]).marginOnly(bottom: 10)
                            ],
                          ),
                        ).marginOnly(bottom: 5),
                      )
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
