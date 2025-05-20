import 'package:biggi_pop/CommonComponents/app_bar_custom.dart';
import 'package:biggi_pop/Screen/Cart/cart_controller.dart';
import 'package:biggi_pop/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  var cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(),
      body: StreamBuilder<Object>(
          stream: cartController.cartList.stream,
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: cartController.cartList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Get.toNamed(Routes.checkout);
                  },
                  child: Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Row(children: [
                      SizedBox(
                          height: 120,
                          child: Image.asset(
                              cartController.cartList[index].image)),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cartController.cartList[index].label,
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
                                    cartController.cartList[index].price,
                                  ),
                                ],
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
                                child: const Text("Check out"),
                              )
                            ],
                          ))
                    ]).paddingAll(10),
                  ).paddingAll(5),
                );
              },
            ).marginAll(10);
          }),
    );
  }
}
