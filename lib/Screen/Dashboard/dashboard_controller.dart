import 'package:biggi_pop/CommonFiles/assets.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  List sliderImages = [Assets.customeImg1,Assets.customeImg2,Assets.customeImg3];
  RxInt selectedIndex = 0.obs;
  RxList mensDesignList = [
    {"Image":Assets.image1,"Price":"\$500","Name":"T-Shirt"},
    {"Image":Assets.image2,"Price":"\$400","Name":"T-Shirt"},
    {"Image":Assets.image3,"Price":"\$550","Name":"T-Shirt"},
    {"Image":Assets.image4,"Price":"\$450","Name":"T-Shirt"},
    {"Image":Assets.image5,"Price":"\$530","Name":"T-Shirt"},
    {"Image":Assets.image6,"Price":"\$600","Name":"T-Shirt"},
    {"Image":Assets.image7,"Price":"\$700","Name":"T-Shirt"},
  ].obs;
   RxList womensDesignList = [
    {"Image":Assets.image1,"Price":"\$500","Name":"T-Shirt1"},
    {"Image":Assets.image2,"Price":"\$400","Name":"T-Shirt"},
    {"Image":Assets.image3,"Price":"\$550","Name":"T-Shirt"},
    {"Image":Assets.image4,"Price":"\$450","Name":"T-Shirt"},
    {"Image":Assets.image5,"Price":"\$530","Name":"T-Shirt"},
    {"Image":Assets.image6,"Price":"\$600","Name":"T-Shirt"},
    {"Image":Assets.image7,"Price":"\$700","Name":"T-Shirt"},
  ].obs;
}