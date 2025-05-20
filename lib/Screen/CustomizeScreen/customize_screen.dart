import 'dart:convert';
import 'dart:math' as math;

import 'package:biggi_pop/CommonComponents/app_bar_custom.dart';
import 'package:biggi_pop/CommonComponents/bottom_appbar.dart';
import 'package:biggi_pop/CommonFiles/assets.dart';
import 'package:biggi_pop/Screen/CustomizeScreen/colors_picker.dart';
import 'package:biggi_pop/Screen/CustomizeScreen/customize_screen_controller.dart';
import 'package:biggi_pop/Screen/CustomizeScreen/image_item.dart';
import 'package:biggi_pop/Screen/CustomizeScreen/image_layer_overlay.dart';
import 'package:biggi_pop/Screen/CustomizeScreen/layer.dart';
import 'package:biggi_pop/Screen/CustomizeScreen/text_layer_overlay.dart';
import 'package:biggi_pop/routes.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screenshot/screenshot.dart';

class CustomizeScreen extends StatefulWidget {
  const CustomizeScreen({super.key});

  @override
  State<CustomizeScreen> createState() => _CustomizeScreenState();
}

class _CustomizeScreenState extends State<CustomizeScreen> {
  var customizeScreenController = Get.put(CustomizeScreenController());
  var textEditingController = TextEditingController();
  var screenshotController = ScreenshotController();

  @override
  void initState() {
    customizeScreenController.layer.add(BackgroundLayerData(
        image: ImageItem.fromJson({'image': Get.arguments})));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: HexColor("#272f32"),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () async {
        //     var imageList = await screenshotController.capture();
        //     final imageEncoded = base64.encode(imageList!);
        //     // print(imageEncoded.toString());
        //     Get.toNamed(Routes.customizeResult, arguments: imageEncoded);
        //   },
        //   backgroundColor: Colors.white,
        //   child: Icon(
        //     Icons.check,
        //     color: HexColor("#272f32"),
        //   ),
        // ),
        // appBar: AppBarCustom(),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(0),
            topLeft: Radius.circular(0),
          ),
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(width: 1, color: HexColor("#e8e8e8")))),
            // color:  HexColor("#272f32"),
            height: 60,
            child: Row(children: [
              Expanded(
                flex: 1,
                child: option(context, 1, "PRODUCT", Routes.dashboard,
                    Icons.production_quantity_limits, () {
                  productBottomSheet();
                }),
              ),
              Expanded(
                flex: 1,
                child: option(context, 2, "DESIGN", Routes.dashboard,
                    Icons.photo_size_select_actual_outlined, () {
                  stickerBottomSheet();
                }),
              ),
              Expanded(
                flex: 1,
                child: option(context, 3, "TEXT", Routes.dashboard,
                    Icons.text_fields_rounded, () {
                  textBottomSheet();
                }),
              ),
              Expanded(
                flex: 1,
                child: option(context, 5, "ORDER", Routes.dashboard,
                    Icons.shopping_bag_outlined, () {
                  orderBottomSheet();
                }),
              )
            ]),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (customizeScreenController
                                      .selectedLayer.value >
                                  0) {
                                var imageLayer =
                                    customizeScreenController.layer[
                                        customizeScreenController.selectedLayer
                                            .value] as ImageLayerData;
                                imageLayer.scale = imageLayer.scale + 0.05;
                                print(imageLayer.scale);
                                customizeScreenController.layer.refresh();
                              }
                            },
                            child: Icon(
                              Icons.zoom_in_rounded,
                              size: 30,
                              color: HexColor("#5d5d5d"),
                            ).marginOnly(bottom: 10),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (customizeScreenController
                                      .selectedLayer.value >
                                  0) {
                                var imageLayer =
                                    customizeScreenController.layer[
                                        customizeScreenController.selectedLayer
                                            .value] as ImageLayerData;
                                imageLayer.scale = imageLayer.scale > 0.1
                                    ? imageLayer.scale - 0.05
                                    : imageLayer.scale;
                                customizeScreenController.layer.refresh();
                              }
                            },
                            child: Icon(
                              Icons.zoom_out_outlined,
                              size: 30,
                              color: HexColor("#5d5d5d"),
                            ).marginOnly(bottom: 10),
                          ),
                          GestureDetector(
                            onTap: () {
                              productBottomSheet();
                            },
                            child: Icon(
                              Icons.production_quantity_limits,
                              color: HexColor("#5d5d5d"),
                              size: 30,
                            ).marginOnly(bottom: 10),
                          ),
                          Icon(
                            Icons.share,
                            color: HexColor("#5d5d5d"),
                            size: 30,
                          ).marginOnly(bottom: 10),
                          GestureDetector(
                            onTap: () {
                              if (customizeScreenController
                                      .selectedLayer.value >
                                  0) {
                                customizeScreenController.showColorBar.value =
                                    !customizeScreenController
                                        .showColorBar.value;
                              }
                            },
                            child: Icon(
                              Icons.color_lens_rounded,
                              color: HexColor("#5d5d5d"),
                              size: 30,
                            ).marginOnly(bottom: 10),
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (customizeScreenController.layer.length > 1) {
                                var imageLayer =
                                    customizeScreenController.layer[
                                        customizeScreenController.selectedLayer
                                            .value] as ImageLayerData;

                                Uint8List? filterAppliedImage =
                                    await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ImageFilters(
                                      image: imageLayer.image.bytes,
                                      // options: widget.filtersOption,
                                    ),
                                  ),
                                );
                                if (filterAppliedImage != null) {
                                  imageLayer.image.bytes = filterAppliedImage;
                                  customizeScreenController.layer.refresh();
                                }
                              }
                            },
                            child: Icon(
                              Icons.display_settings_rounded,
                              color: HexColor("#5d5d5d"),
                              size: 30,
                            ).marginOnly(bottom: 10),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (customizeScreenController.layer.length > 1) {
                                var imageLayer =
                                    customizeScreenController.layer[
                                        customizeScreenController.selectedLayer
                                            .value] as ImageLayerData;
                                imageLayer.scale = 0.8;
                                imageLayer.offset = const Offset(-11, -11);
                                customizeScreenController.layer.refresh();
                              }
                            },
                            child: Icon(
                              Icons.zoom_out_map_rounded,
                              color: HexColor("#5d5d5d"),
                              size: 30,
                            ).marginOnly(bottom: 10),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (customizeScreenController.layer.length > 1) {
                                var imageLayer =
                                    customizeScreenController.layer[
                                        customizeScreenController.selectedLayer
                                            .value] as ImageLayerData;
                                imageLayer.flip =
                                    imageLayer.flip == 0 ? math.pi : 0;
                                customizeScreenController.layer.refresh();
                              }
                            },
                            child: Icon(
                              Icons.flip,
                              color: HexColor("#5d5d5d"),
                              size: 30,
                            ).marginOnly(bottom: 10),
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (customizeScreenController.layer.length > 1) {
                                var imageLayer =
                                    customizeScreenController.layer[
                                        customizeScreenController.selectedLayer
                                            .value] as ImageLayerData;
                                Uint8List? croppedImage = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ImageCropper(
                                      image: imageLayer.image.bytes,
                                      // availableRatios: widget.cropOption!.ratios,
                                    ),
                                  ),
                                );
                                if (croppedImage != null) {
                                  imageLayer.image.bytes = croppedImage;
                                  customizeScreenController.layer.refresh();
                                }
                              }
                            },
                            child: Icon(
                              Icons.crop,
                              color: HexColor("#5d5d5d"),
                              size: 30,
                            ).marginOnly(bottom: 10),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (customizeScreenController.layer.length > 1) {
                                var imageBytes =
                                    (customizeScreenController.layer[
                                            customizeScreenController
                                                .selectedLayer
                                                .value] as ImageLayerData)
                                        .image
                                        .bytes;
                                var newImage = ImageLayerData.fromJson(
                                    jsonDecode(jsonEncode(
                                        customizeScreenController.layer[
                                            customizeScreenController
                                                .selectedLayer.value])));
                                newImage.image.bytes = imageBytes;
                                newImage.scale = 0.4;
                                customizeScreenController.layer.add(newImage);
                                customizeScreenController.layer.refresh();
                              }
                            },
                            child: Icon(
                              Icons.layers,
                              color: HexColor("#5d5d5d"),
                              size: 30,
                            ).marginOnly(bottom: 10),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (customizeScreenController.layer.length > 1 &&
                                  customizeScreenController
                                          .selectedLayer.value >
                                      0) {
                                customizeScreenController.layer.removeAt(
                                    customizeScreenController
                                        .selectedLayer.value);
                                customizeScreenController.selectedLayer.value =
                                    customizeScreenController.layer.length - 1;
                                customizeScreenController.layer.refresh();
                              }
                            },
                            child: Icon(
                              Icons.delete,
                              color: HexColor("#5d5d5d"),
                              size: 30,
                            ).marginOnly(bottom: 10),
                          )
                        ],
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            StreamBuilder<Object>(
                                stream: customizeScreenController.layer.stream,
                                builder: (context, snapshot) {
                                  return Screenshot(
                                    controller: screenshotController,
                                    child: SizedBox(
                                      width: double.maxFinite,
                                      child: Stack(
                                        children: [
                                          SizedBox(
                                            width: double.maxFinite,
                                            child: Image.memory(
                                              (customizeScreenController
                                                          .layer[0]
                                                      as BackgroundLayerData)
                                                  .image
                                                  .bytes,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          Positioned(
                                            top: 60,
                                            left: (MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2) -
                                                122,
                                            child: DottedBorder(
                                              color: Colors.red,
                                              strokeWidth: 1,
                                              child: GestureDetector(
                                                behavior:
                                                    HitTestBehavior.translucent,
                                                onScaleUpdate: (detail) {
                                                  if (detail.pointerCount ==
                                                      2) {
                                                    // layer.scale = detail.scale;
                                                    customizeScreenController
                                                        .layer[
                                                            customizeScreenController
                                                                .selectedLayer
                                                                .value]
                                                        .scale = (customizeScreenController
                                                                .layer[customizeScreenController
                                                                    .selectedLayer
                                                                    .value]
                                                                .lastScale /
                                                            2) *
                                                        math.min(
                                                            detail
                                                                .horizontalScale,
                                                            detail
                                                                .verticalScale);
                                                  }
                                                  customizeScreenController
                                                      .layer
                                                      .refresh();
                                                },
                                                child: SizedBox(
                                                  height: 160,
                                                  width: 160,
                                                  child: Stack(
                                                      children: List<
                                                              Widget>.generate(
                                                          customizeScreenController
                                                              .layer
                                                              .length, (index) {
                                                    var element =
                                                        customizeScreenController
                                                            .layer[index];
                                                    if (element
                                                        is TextLayerData) {
                                                      return TextLayer(element);
                                                    }
                                                    // Image layer
                                                    if (element
                                                        is ImageLayerData) {
                                                      return StickerLayer(
                                                          element, index);
                                                    }
                                                    return Container();
                                                  }).toList()
                                                      // customizeScreenController
                                                      //     .layer
                                                      //     .map((element) {
                                                      //   // if (element is BackgroundLayerData) {
                                                      //   //   return Image.memory(
                                                      //   //     element.image.bytes,
                                                      //   //     fit: BoxFit.contain,
                                                      //   //   );
                                                      //   // }

                                                      //   // Text layer

                                                      // }).toList(),
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).paddingAll(10),
                            const Spacer(),
                            StreamBuilder<Object>(
                                stream: customizeScreenController
                                    .showColorBar.stream,
                                builder: (context, snapshot) {
                                  return Container(
                                    child: customizeScreenController
                                                    .selectedLayer.value >
                                                0 &&
                                            customizeScreenController
                                                .showColorBar.value
                                        ? Row(
                                            children: [
                                              Expanded(
                                                child: BarColorPicker(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width-100,
                                                  thumbColor: Colors.white,
                                                  initialColor:
                                                      (customizeScreenController
                                                                      .layer[
                                                                  customizeScreenController
                                                                      .selectedLayer
                                                                      .value]
                                                              as ImageLayerData)
                                                          .image
                                                          .color,
                                                  cornerRadius: 10,
                                                  pickMode: PickMode.color,
                                                  colorListener: (int value) {
                                                    // setState(() {
                                                    (customizeScreenController
                                                                    .layer[
                                                                customizeScreenController
                                                                    .selectedLayer
                                                                    .value]
                                                            as ImageLayerData)
                                                        .image
                                                        .color = Color(value);
                                                    customizeScreenController
                                                        .layer
                                                        .refresh();
                                                    // });
                                                  },
                                                ),
                                              ),
                                              GestureDetector(
                                                  onTap: () {
                                                    (customizeScreenController
                                                                    .layer[
                                                                customizeScreenController
                                                                    .selectedLayer
                                                                    .value]
                                                            as ImageLayerData)
                                                        .image
                                                        .color = Colors.transparent;
                                                    customizeScreenController
                                                        .showColorBar
                                                        .value = false;
                                                    customizeScreenController
                                                        .layer
                                                        .refresh();
                                                  },
                                                  child: const Icon(
                                                      Icons.restore_outlined))
                                            ],
                                          )
                                        : const SizedBox(),
                                  );
                                })
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Row(
            //   children: [
            //     Expanded(
            //       child: Card(
            //           shape: const OutlineInputBorder(
            //               borderRadius: BorderRadius.all(Radius.circular(10)),
            //               borderSide:
            //                   BorderSide(width: 0, color: Colors.white)),
            //           elevation: 2,
            //           child: StreamBuilder<Object>(
            //               stream: customizeScreenController.sizeList.stream,
            //               builder: (context, snapshot) {
            //                 return Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   mainAxisAlignment: MainAxisAlignment.start,
            //                   children: [
            //                     const Icon(
            //                       Icons.password_rounded,
            //                       size: 20,
            //                     ),
            //                     const Text(
            //                       "Sizing",
            //                       style: TextStyle(
            //                           fontSize: 11,
            //                           fontWeight: FontWeight.bold),
            //                     ),
            //                     const SizedBox(
            //                       height: 10,
            //                     ),
            //                     for (SizeModel sizeModel
            //                         in customizeScreenController.sizeList)
            //                       SizingSelection(sizeModel)
            //                   ],
            //                 ).paddingAll(15);
            //               })),
            //     ),
            //   ],
            // ).paddingSymmetric(horizontal: 15),
            // const SizedBox(
            //   height: 15,
            // ),
            // SizedBox(
            //     height: 50,
            //     width: double.infinity,
            //     child: ElevatedButton(
            //       style: ElevatedButton.styleFrom(
            //           backgroundColor: Colors.white,
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(12),
            //           )),
            //       onPressed: () {
            //         Get.toNamed(Routes.cart);
            //       },
            //       child: Text(
            //         "Add to cart",
            //         style:
            //             TextStyle(fontSize: 18, color: HexColor("#4b5153")),
            //       ),
            //     )).marginSymmetric(horizontal: 20),
          ],
        ));
  }

  Widget option(context, tabIndex, label, route, icon, onTap) {
    return Container(
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.black,
              size: 30,
            ),
            Text(label.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black, fontSize: 11))
          ],
        ),
      ),
    );
  }

  Widget SizingSelection(SizeModel sizeModel) {
    return Row(
      children: [
        SizedBox(
          width: 80,
          child: Text(
            sizeModel.label,
            style: TextStyle(fontSize: 16, color: HexColor('#5a5a5a')),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: HexColor('#f1f1f1')),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: IntrinsicHeight(
            child: Row(
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    if (sizeModel.qty > 0) {
                      sizeModel.qty--;
                      customizeScreenController.sizeList.refresh();
                    }
                  },
                  child: Icon(
                    Icons.remove,
                    size: 25,
                    color: HexColor('#5a5a5a'),
                  ).paddingAll(10),
                ),
                VerticalDivider(
                  color: HexColor('#f1f1f1'),
                  thickness: 2,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 50,
                  child: Text(
                    sizeModel.qty.toString(),
                    style: TextStyle(fontSize: 16, color: HexColor('#5a5a5a')),
                  ).paddingSymmetric(vertical: 10),
                ),
                VerticalDivider(
                  color: HexColor('#f1f1f1'),
                  thickness: 2,
                ),
                GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      sizeModel.qty++;
                      customizeScreenController.sizeList.refresh();
                    },
                    child: Icon(Icons.add, size: 25, color: HexColor('#5a5a5a'))
                        .paddingAll(10))
              ],
            ),
          ),
        ),
      ],
    ).marginOnly(bottom: 15);
  }

  // productBottomSheet() {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (builder) {
  //         return Container(
  //           padding: EdgeInsets.only(
  //               bottom: MediaQuery.of(context).viewInsets.bottom),
  //           height: 350.0,
  //           child: Container(
  //               padding: const EdgeInsets.all(15),
  //               decoration: const BoxDecoration(
  //                   color: Colors.white,
  //                   borderRadius: BorderRadius.only(
  //                       topLeft: Radius.circular(10.0),
  //                       topRight: Radius.circular(10.0))),
  //               child: SingleChildScrollView(
  //                 child: Column(
  //                   children: [
  //                     const SizedBox(
  //                       height: 5,
  //                     ),
  //                     TextFormField(
  //                         style: const TextStyle(color: Colors.white),
  //                         decoration: InputDecoration(
  //                             labelText: "Search",
  //                             labelStyle: TextStyle(color: HexColor("#969897")),
  //                             fillColor: Colors.white,
  //                             hintText: "Search",
  //                             hintStyle: TextStyle(color: HexColor("#969897")),
  //                             isDense: true,
  //                             focusedBorder: OutlineInputBorder(
  //                               borderRadius: BorderRadius.circular(15),
  //                               borderSide: const BorderSide(
  //                                 color: Colors.blue,
  //                               ),
  //                             ),
  //                             enabledBorder: OutlineInputBorder(
  //                               borderRadius: BorderRadius.circular(15),
  //                               borderSide: BorderSide(
  //                                 color: HexColor("#969897"),
  //                                 width: 2.0,
  //                               ),
  //                             ),
  //                             prefixIcon: const Icon(Icons.search))),
  //                     const SizedBox(
  //                       height: 15,
  //                     ),
  //                     GridView(
  //                       physics: const NeverScrollableScrollPhysics(),
  //                       shrinkWrap: true,
  //                       gridDelegate:
  //                           const SliverGridDelegateWithFixedCrossAxisCount(
  //                               crossAxisCount: 3,
  //                               childAspectRatio: (1 / 1),
  //                               crossAxisSpacing: 15,
  //                               mainAxisSpacing: 15),
  //                       children: List.generate(
  //                           customizeScreenController.stickerList.length,
  //                           (index) => Card(
  //                                 shape: const RoundedRectangleBorder(
  //                                   borderRadius:
  //                                       BorderRadius.all(Radius.circular(15)),
  //                                 ),
  //                                 child: Column(
  //                                   crossAxisAlignment:
  //                                       CrossAxisAlignment.start,
  //                                   children: [
  //                                     Padding(
  //                                       padding: const EdgeInsets.all(5),
  //                                       child: GestureDetector(
  //                                         onTap: () async {
  // final ByteData bytes =
  //     await rootBundle.load(
  //         customizeScreenController
  //             .stickerList[index]);
  // final Uint8List list =
  //     bytes.buffer.asUint8List();
  // customizeScreenController.layer[0] =
  //     BackgroundLayerData(
  //         image: ImageItem.fromJson(
  //             {'image': list}));
  //                                           // customizeScreenController.layer
  //                                           // .refresh();
  //                                           Get.back();
  //                                         },
  //                                         child: ClipRRect(
  //                                           borderRadius:
  //                                               const BorderRadius.vertical(
  //                                                   top: Radius.circular(15)),
  //                                           child: Image.asset(
  //                                             customizeScreenController
  //                                                     .stickerList[index] ??
  //                                                 "",
  //                                             // height: 100,
  //                                             fit: BoxFit.contain,
  //                                             width: double.infinity,
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ),
  //                                   ],
  //                                 ),
  //                               )),
  //                     ),
  //                   ],
  //                 ),
  //               )),
  //         );
  //       });
  // }

  // textBottomSheet() {
  //   showModalBottomSheet(
  //       context: context,
  //       isScrollControlled: true,
  //       builder: (builder) {
  //         return Padding(
  //           padding: EdgeInsets.only(
  //               bottom: MediaQuery.of(context).viewInsets.bottom),
  //           child: Container(
  //               padding: const EdgeInsets.all(15),
  //               decoration: const BoxDecoration(
  //                   color: Colors.white,
  //                   borderRadius: BorderRadius.only(
  //                       topLeft: Radius.circular(10.0),
  //                       topRight: Radius.circular(10.0))),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   const SizedBox(
  //                     height: 5,
  //                   ),
  //                   TextFormField(
  //                       controller: textEditingController,
  //                       autofocus: true,
  //                       decoration: InputDecoration(
  //                           labelText: "Enter Text",
  //                           labelStyle: TextStyle(color: HexColor("#969897")),
  //                           // fillColor: Colors.white,
  //                           hintText: "Text",
  //                           hintStyle: TextStyle(color: HexColor("#969897")),
  //                           isDense: true,
  //                           focusedBorder: OutlineInputBorder(
  //                             borderRadius: BorderRadius.circular(15),
  //                             borderSide: const BorderSide(
  //                               color: Colors.blue,
  //                             ),
  //                           ),
  //                           enabledBorder: OutlineInputBorder(
  //                             borderRadius: BorderRadius.circular(15),
  //                             borderSide: BorderSide(
  //                               color: HexColor("#969897"),
  //                               width: 2.0,
  //                             ),
  //                           ),
  //                           prefixIcon: const Icon(Icons.search))),
  //                   const SizedBox(
  //                     height: 15,
  //                   ),
  //                   Row(
  //                     children: [
  //                       Expanded(
  //                         child: SizedBox(
  //                             height: 50,
  //                             width: double.infinity,
  //                             child: ElevatedButton(
  //                               style: ElevatedButton.styleFrom(
  //                                   backgroundColor: Colors.white,
  //                                   shape: RoundedRectangleBorder(
  //                                     borderRadius: BorderRadius.circular(12),
  //                                   )),
  //                               onPressed: () {
  //                                 Navigator.pop(context);
  //                               },
  //                               child: Text(
  //                                 "Cancel",
  //                                 style: TextStyle(
  //                                     fontSize: 18, color: HexColor("#4b5153")),
  //                               ),
  //                             )),
  //                       ),
  //                       const SizedBox(
  //                         width: 10,
  //                       ),
  //                       Expanded(
  //                         child: SizedBox(
  //                             height: 50,
  //                             width: double.infinity,
  //                             child: ElevatedButton(
  //                               style: ElevatedButton.styleFrom(
  //                                   backgroundColor: Colors.white,
  //                                   shape: RoundedRectangleBorder(
  //                                     borderRadius: BorderRadius.circular(12),
  //                                   )),
  //                               onPressed: () {
  //                                 customizeScreenController.layer.add(
  //                                     TextLayerData(
  //                                         text: textEditingController.text,
  //                                         size: 20,
  //                                         offset: const Offset(50, 50),
  //                                         rotation: 0.0));
  //                                 textEditingController.clear();
  //                                 Navigator.pop(context);
  //                               },
  //                               child: Text(
  //                                 "Done",
  //                                 style: TextStyle(
  //                                     fontSize: 18, color: HexColor("#4b5153")),
  //                               ),
  //                             )),
  //                       )
  //                     ],
  //                   )
  //                 ],
  //               )),
  //         );
  //       });
  // }

  productBottomSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        builder: (builder) {
          return Container(
              padding: const EdgeInsets.all(15),
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.8,
              ),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0))),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: 80,
                      child: Divider(
                        color: HexColor('#e8e8e8'),
                        thickness: 4,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Product",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(Icons.close)),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 30,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 2, color: Colors.black))),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: const Row(
                                    children: [
                                      Icon(Icons.man_rounded),
                                      Text(
                                        "Men",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ).paddingSymmetric(horizontal: 8),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: const Row(
                                  children: [
                                    Icon(Icons.woman_rounded),
                                    Text(
                                      "Women",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ).paddingSymmetric(horizontal: 8),
                              GestureDetector(
                                onTap: () {},
                                child: const Row(
                                  children: [
                                    Icon(Icons.child_care_rounded),
                                    Text(
                                      "Kids",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ).paddingSymmetric(horizontal: 8),
                              GestureDetector(
                                onTap: () {},
                                child: const Row(
                                  children: [
                                    Icon(Icons.shopping_bag_outlined),
                                    Text(
                                      "Other",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ).paddingSymmetric(horizontal: 8)
                            ])),
                    const SizedBox(
                      height: 15,
                    ),
                    GridView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: (1 / 1),
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15),
                      children: List.generate(
                          customizeScreenController.productList.length,
                          (index) => Card(
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: GestureDetector(
                                        onTap: () async {
                                          final ByteData bytes =
                                              await rootBundle.load(
                                                  customizeScreenController
                                                      .productList[index]);
                                          final Uint8List list =
                                              bytes.buffer.asUint8List();
                                          customizeScreenController.layer[0] =
                                              BackgroundLayerData(
                                                  image: ImageItem.fromJson(
                                                      {'image': list}));
                                          Get.back();
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              const BorderRadius.vertical(
                                                  top: Radius.circular(15)),
                                          child: Image.asset(
                                            customizeScreenController
                                                    .productList[index] ??
                                                "",
                                            // height: 100,
                                            fit: BoxFit.contain,
                                            width: double.infinity,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                    ),
                  ],
                ),
              ));
        });
  }

  stickerBottomSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        builder: (builder) {
          return Container(
              padding: const EdgeInsets.all(15),
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.7),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0))),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: 80,
                      child: Divider(
                        color: HexColor('#e8e8e8'),
                        thickness: 4,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Design",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(Icons.close)),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            labelText: "Search",
                            labelStyle: TextStyle(color: HexColor("#969897")),
                            fillColor: Colors.white,
                            hintText: "Search",
                            hintStyle: TextStyle(color: HexColor("#969897")),
                            isDense: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: HexColor("#e8e8e8"),
                                width: 1.0,
                              ),
                            ),
                            prefixIcon: const Icon(Icons.search))),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 30,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              TypeListItem(label: "Surf", onTap: () {}),
                              TypeListItem(label: "Space", onTap: () {}),
                              TypeListItem(label: "Climate", onTap: () {}),
                              TypeListItem(label: "Ocean", onTap: () {}),
                              TypeListItem(label: "World", onTap: () {}),
                              TypeListItem(label: "Tree", onTap: () {}),
                            ])),
                    const SizedBox(
                      height: 5,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Men's Basic T-shirt",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Certified organic Cotton",
                        style: TextStyle(color: HexColor("#6d6d6d")),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GridView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: (1 / 1),
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15),
                      children: List.generate(
                          customizeScreenController.stickerList.length,
                          (index) => Card(
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: GestureDetector(
                                        onTap: () async {
                                          if (index == 0) {
                                            Get.back();
                                            uploadBottomSheet();
                                          } else {
                                            final ByteData bytes =
                                                await rootBundle.load(
                                                    customizeScreenController
                                                        .stickerList[index]);
                                            final Uint8List list =
                                                bytes.buffer.asUint8List();
                                            customizeScreenController.layer.add(
                                                ImageLayerData(
                                                    image: ImageItem.fromJson({
                                                      'image': list,
                                                      'width': 100,
                                                      'height': 100
                                                    }),
                                                    offset: const Offset(
                                                        -15, -15)));
                                            customizeScreenController
                                                    .selectedLayer.value =
                                                customizeScreenController
                                                        .layer.length -
                                                    1;
                                            Get.back();
                                          }
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              const BorderRadius.vertical(
                                                  top: Radius.circular(15)),
                                          child: Image.asset(
                                            customizeScreenController
                                                    .stickerList[index] ??
                                                "",
                                            // height: 100,
                                            fit: BoxFit.contain,
                                            width: double.infinity,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                    ),
                  ],
                ),
              ));
        });
  }

  textBottomSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        builder: (builder) {
          return Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.7),
            child: Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0))),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 80,
                        child: Divider(
                          color: HexColor('#e8e8e8'),
                          thickness: 4,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Text",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: const Icon(Icons.close)),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelText: "Search",
                              labelStyle: TextStyle(color: HexColor("#969897")),
                              fillColor: Colors.white,
                              hintText: "Search",
                              hintStyle: TextStyle(color: HexColor("#969897")),
                              isDense: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                  color: Colors.blue,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  color: HexColor("#e8e8e8"),
                                  width: 1.0,
                                ),
                              ),
                              prefixIcon: const Icon(Icons.search))),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 30,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                TypeListItem(label: "Surf", onTap: () {}),
                                TypeListItem(label: "Space", onTap: () {}),
                                TypeListItem(label: "Climate", onTap: () {}),
                                TypeListItem(label: "Ocean", onTap: () {}),
                                TypeListItem(label: "World", onTap: () {}),
                                TypeListItem(label: "Tree", onTap: () {}),
                              ])),
                      const SizedBox(
                        height: 15,
                      ),
                      GridView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: (1 / 1),
                                crossAxisSpacing: 15,
                                mainAxisSpacing: 15),
                        children: List.generate(
                            customizeScreenController.textList.length,
                            (index) => Card(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: GestureDetector(
                                          onTap: () async {
                                            final ByteData bytes =
                                                await rootBundle.load(
                                                    customizeScreenController
                                                        .textList[index]);
                                            final Uint8List list =
                                                bytes.buffer.asUint8List();
                                            customizeScreenController.layer.add(
                                                ImageLayerData(
                                                    image: ImageItem.fromJson({
                                              'image': list,
                                              'width': 100,
                                              'height': 100
                                            })));
                                            Get.back();
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.vertical(
                                                    top: Radius.circular(15)),
                                            child: Image.asset(
                                              customizeScreenController
                                                      .textList[index] ??
                                                  "",
                                              // height: 100,
                                              fit: BoxFit.contain,
                                              width: double.infinity,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                      ),
                    ],
                  ),
                )),
          );
        });
  }

  orderBottomSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        builder: (builder) {
          return Container(
            padding: const EdgeInsets.all(15),
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.85,
            ),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0))),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 80,
                    child: Divider(
                      color: HexColor('#e8e8e8'),
                      thickness: 4,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(Icons.close)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Custom printed basic T-shirt",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Certified organic cotton basic t-shirt. High quality digital print. Standard speedy service estimated time 2-5 days.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  StreamBuilder<Object>(
                      stream: customizeScreenController.sizeList.stream,
                      builder: (context, snapshot) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.password_rounded,
                              size: 20,
                            ),
                            const Text(
                              "Sizing",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            for (SizeModel sizeModel
                                in customizeScreenController.sizeList)
                              SizingSelection(sizeModel)
                          ],
                        ).paddingAll(15);
                      }),
                  Text(
                    "0 @ \$16.67 each + VAT",
                    style: TextStyle(color: HexColor("#e8e8e8")),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.thumb_up_alt),
                      Text(
                        "Add 5 more to save 10.00% (Discount info)",
                        style: TextStyle(fontSize: 14),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: HexColor("#77b900"),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            )),
                        onPressed: () {
                          Get.back();
                          Get.toNamed(Routes.cart);
                        },
                        child: const Text(
                          "Add To Bag",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      )),
                ],
              ),
            ),
            // child:
          );
        });
  }

  uploadBottomSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        builder: (builder) {
          return Container(
              padding: const EdgeInsets.all(15),
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.7),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0))),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: 80,
                      child: Divider(
                        color: HexColor('#e8e8e8'),
                        thickness: 4,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Design",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(Icons.close)),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    StreamBuilder<Object>(
                        stream:
                            customizeScreenController.isAgreeUploading.stream,
                        builder: (context, snapshot) {
                          return customizeScreenController
                                  .isAgreeUploading.value
                              ? DottedBorder(
                                  color: Colors.black,
                                  strokeWidth: 1,
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () async {
                                      final ImagePicker picker = ImagePicker();
                                      // Pick an image.
                                      final XFile? image =
                                          await picker.pickImage(
                                              source: ImageSource.gallery);
                                      if (image != null) {
                                        final bytes = await image.readAsBytes();
                                        final Uint8List list =
                                            bytes.buffer.asUint8List();
                                        customizeScreenController.layer.add(
                                            ImageLayerData(
                                                image: ImageItem.fromJson({
                                          'image': list,
                                          'width': 150,
                                          'height': 150
                                        })));
                                      }
                                      Get.back();
                                    },
                                    child: const Column(
                                      children: [
                                        Icon(
                                          Icons.file_upload_outlined,
                                          size: 50,
                                        ),
                                        Text(
                                          "Upload an image",
                                          style: TextStyle(fontSize: 18),
                                        )
                                      ],
                                    ).paddingSymmetric(
                                        horizontal: 50, vertical: 40),
                                  ),
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Uploading Images",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const Text(
                                        "By uploading an image to Teemill you confirm that you either own or have obtained all needed licenses and authorisations to display, reproduce, print and/or sell the design, images, text, logos and other copy right/trademark protected materials contained within, in accordance with the Terms and Conditions."),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    SizedBox(
                                        height: 50,
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  HexColor("#77b900"),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              )),
                                          onPressed: () {
                                            customizeScreenController
                                                .isAgreeUploading.value = true;
                                          },
                                          child: const Text(
                                            "I Agree",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white),
                                          ),
                                        )),
                                  ],
                                );
                        }),
                    const SizedBox(
                      height: 15,
                    ),
                    ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          UploadListItem(
                              image: Assets.home6,
                              title: "High Res",
                              description:
                                  "Make sure your image are high res. For best results use PNG24 images around 2500px by 3500px(sRGB)"),
                          UploadListItem(
                              image: Assets.home7,
                              title: "Saturation",
                              description:
                                  "Colours may vary a little from on screen. Neon colours won't be as vibrant"),
                          UploadListItem(
                              image: Assets.home8,
                              title: "Copyright",
                              description:
                                  "If you upload a design, you must have obtained all relevant rights and permission as per the T&CS"),
                          UploadListItem(
                              image: Assets.home16,
                              title: "Scale",
                              description:
                                  "Make sure your lines are at lease 2mm wide. Microscopic text ot hair-width lines may not resolve or may appear broken")
                        ]),
                  ],
                ),
              ));
        });
  }

  Widget TextLayer(TextLayerData layer) {
    return Positioned(
      left: layer.offset.dx,
      top: layer.offset.dy,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
            ),
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) {
              return TextLayerOverlay(
                  index: customizeScreenController.layer.indexOf(layer),
                  layer: layer,
                  onUpdate: () {
                    customizeScreenController.layer.refresh();
                  },
                  onRemoveLayer: () {
                    customizeScreenController.layer.remove(layer);
                  });
            },
          );
        },
        onScaleUpdate: (detail) {
          if (detail.pointerCount == 1) {
            layer.offset = Offset(
              layer.offset.dx + detail.focalPointDelta.dx,
              layer.offset.dy + detail.focalPointDelta.dy,
            );
          } else if (detail.pointerCount == 2) {
            layer.size = 26 + detail.scale * (detail.scale > 1 ? 1 : -1);
            layer.rotation = detail.rotation;
          }
          customizeScreenController.layer.refresh();
        },
        child: Transform.rotate(
          angle: layer.rotation,
          child: Container(
            padding: const EdgeInsets.all(5),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: layer.background.withOpacity(layer.backgroundOpacity),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                layer.text,
                // textAlign: widget.layerData.align,
                style: TextStyle(
                  color: layer.color,
                  fontSize: layer.size,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget StickerLayer(ImageLayerData layer, index) {
    return Positioned(
      left: layer.offset.dx,
      top: layer.offset.dy,
      child: GestureDetector(
        onDoubleTap: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
            ),
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) {
              return ImageLayerOverlay(
                  index: customizeScreenController.layer.indexOf(layer),
                  layerData: layer,
                  onUpdate: () {
                    customizeScreenController.layer.refresh();
                  },
                  onRemoveLayer: () {
                    customizeScreenController.layer.remove(layer);
                  });
            },
          );
        },
        onTap: () {
          if (customizeScreenController.selectedLayer.value != index) {
            customizeScreenController.selectedLayer.value = index;
          } else {
            customizeScreenController.selectedLayer.value = 0;
          }
          customizeScreenController.selectedLayer.refresh();
        },
        onScaleUpdate: (detail) {
          if (detail.pointerCount == 1) {
            layer.offset = Offset(
              layer.offset.dx + detail.focalPointDelta.dx,
              layer.offset.dy + detail.focalPointDelta.dy,
            );
          } else if (detail.pointerCount == 2) {
            // layer.scale = detail.scale;
            // layer.scale = layer.lastScale *
            //     math.min(detail.horizontalScale, detail.verticalScale);
          }
          customizeScreenController.layer.refresh();
        },
        child: Transform(
          transform: Matrix4(
            1,
            0,
            0,
            0,
            0,
            1,
            0,
            0,
            0,
            0,
            1,
            0,
            layer.offset.dx,
            layer.offset.dy,
            0,
            1 / layer.scale,
          )..rotateY(layer.flip),
          // transform: Matrix4.rotationY(layer.flip)..scale(layer.scale),
          // origin: const Offset(-50, -50),
          alignment: FractionalOffset.center,
          child: StreamBuilder<Object>(
              stream: customizeScreenController.selectedLayer.stream,
              builder: (context, snapshot) {
                return Container(
                  constraints:
                      const BoxConstraints(maxHeight: 200, maxWidth: 200),
                  // color: Colors.white,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color:
                              customizeScreenController.selectedLayer.value ==
                                      index
                                  ? Colors.red
                                  : Colors.transparent)),
                  width: (layer.image.width ?? 50).toDouble(),
                  height: (layer.image.height ?? 50).toDouble(),
                  child: ClipOval(
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        layer.image
                            .color, // Change this color to the desired color
                        BlendMode
                            .color, // You can use different blend modes as needed
                      ),
                      child: Image.memory(
                        layer.image.bytes,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }

  Widget TypeListItem({String label = "", Function? onTap}) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    ).paddingSymmetric(horizontal: 8);
  }

  Widget UploadListItem(
      {String image = "", String title = "", String description = ""}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          image,
          height: 60,
          width: 60,
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      description,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ).paddingSymmetric(vertical: 5);
  }
}
