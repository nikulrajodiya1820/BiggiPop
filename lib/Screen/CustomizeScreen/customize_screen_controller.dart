import 'package:biggi_pop/CommonFiles/assets.dart';
import 'package:biggi_pop/Screen/CustomizeScreen/layer.dart';
import 'package:get/get.dart';

class CustomizeScreenController extends GetxController {
  RxBool isAgreeUploading = false.obs;
  RxList<Layer> layer = <Layer>[].obs;
  RxList stickerList = [
    Assets.upload,
    Assets.sticker1,
    Assets.sticker2,
    Assets.sticker3,
    Assets.sticker4,
    Assets.sticker5,
    Assets.sticker6,
    Assets.sticker7,
    Assets.sticker8,
    Assets.sticker9,
    Assets.sticker10,
    Assets.sticker11,
    Assets.sticker12,
  ].obs;

  RxList productList = [
    Assets.product1,
    Assets.product2,
    Assets.product3,
    Assets.product4,
    Assets.product5,
    Assets.product6,
    Assets.product7,
  ].obs;

  RxList textList = [
    Assets.sticker1,
    Assets.sticker2,
    Assets.sticker3,
    Assets.sticker4,
    Assets.sticker5,
    Assets.sticker6,
    Assets.sticker7,
    Assets.sticker8
  ].obs;

  RxList<SizeModel> sizeList = <SizeModel>[
    SizeModel(label: "XS", qty: 0),
    SizeModel(label: "S", qty: 0),
    SizeModel(label: "M", qty: 0),
    SizeModel(label: "L", qty: 0),
    SizeModel(label: "XL", qty: 0),
  ].obs;

  RxInt selectedLayer = 0.obs;
  RxBool showColorBar = false.obs;
}
