import 'dart:io';

import 'package:biggi_pop/CommonFiles/assets.dart';
import 'package:biggi_pop/Models/entity.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<CartModel> cartList = <CartModel>[
    CartModel(image: Assets.image1,label: "T-Shirt",price: "\$400"),
    CartModel(image: Assets.image2,label: "T-Shirt 1",price: "\$400"),
    CartModel(image: Assets.image3,label: "T-Shirt 2",price: "\$400"),
    CartModel(image: Assets.image4,label: "T-Shirt 3",price: "\$400"),
    CartModel(image: Assets.image5,label: "T-Shirt 4",price: "\$400")
  ].obs;
}