import 'package:biggi_pop/CommonComponents/app_bar_custom.dart';
import 'package:biggi_pop/CommonFiles/assets.dart';
import 'package:biggi_pop/Screen/Checkout/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  var checkoutController = Get.put(CheckoutController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Your Bag",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                 Row(
                  children: [
                    const Icon(
                      Icons.fire_truck_outlined,
                      size: 20,
                    ).paddingOnly(right: 5),
                    const Text("Orders over \$60 qualify for Free UPS Shipping"),
                  ],
                ).paddingOnly(bottom: 20),
                Row(children: [
                  SizedBox(
                      height: 120,
                      child:
                          Image.asset(checkoutController.checkoutItem.image)),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            checkoutController.checkoutItem.label,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.shopify_sharp,
                                size: 20,
                              ),
                              Text(
                                checkoutController.checkoutItem.price,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5))),
                            padding: const EdgeInsets.all(8),
                            child: const Text("Check out"),
                          )
                        ],
                      ))
                ])
              ],
            ).paddingAll(15),
            Container(
                color: HexColor("#f2f2f2"),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Checkout Now ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ).paddingOnly(top: 10),
                    const SizedBox(
                      height: 15,
                    ),
                    Divider(
                      color: HexColor('#e8e8e8'),
                      thickness: 2,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Row(
                      children: [
                        Expanded(child: Text("Do you have a Coupon Code?")),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ).paddingAll(10),
                    const Row(
                      children: [
                        Expanded(
                            child: Text(
                          "Sub Total",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "\$20.00",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: [
                        Expanded(
                            child: Text(
                          "Total",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "\$20.00",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                        child: Image.asset(
                      Assets.paypal,
                      height: 50,
                    )),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: HexColor('#e8e8e8'),
                            thickness: 2,
                          ),
                        ),
                        const Text("OR").paddingSymmetric(horizontal: 15),
                        Expanded(
                          child: Divider(
                            color: HexColor('#e8e8e8'),
                            thickness: 2,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
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
                            // Get.toNamed(Routes.home);
                          },
                          child: const Text(
                            "Pay By Card",
                            style: TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                        )),
                        const SizedBox(height: 15,),
                        const Text("Quick help",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        const SizedBox(height: 10,),
                         Row(
                          children: [
                            const Icon(Icons.info_outline).paddingOnly(right: 10),
                            const Text("Free returns")
                          ],
                        ),
                        const SizedBox(height: 10,),
                       Row(
                          children: [
                            const Icon(Icons.info_outline).paddingOnly(right: 10),
                            const Text("Normal sizing")
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            const Icon(Icons.info_outline).paddingOnly(right: 10),
                            const Text("Secure checkout")
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            const Icon(Icons.info_outline).paddingOnly(right: 10),
                            const Text("Organic quality")
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            const Icon(Icons.info_outline).paddingOnly(right: 10),
                            const Text("Data privacy")
                          ],
                        ),
                        const SizedBox(height: 10,)
                  ],
                ).paddingAll(15)),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Menu",style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Text("Women",),
                    SizedBox(height: 10,),
                     Text("Men",),
                    SizedBox(height: 10,),
                     Text("Gifts",),
                    SizedBox(height: 10,),
                     Text("Stories",),
                    SizedBox(height: 10,),
                     Text("Journey",),
                    SizedBox(height: 10,),
                  ],
                ).paddingAll(15)
          ],
        ),
      ),
    );
  }
}
