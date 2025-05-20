import 'package:biggi_pop/CommonFiles/assets.dart';
import 'package:biggi_pop/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class AppBarCustom extends StatefulWidget implements PreferredSizeWidget {
  bool isMenu;
  var scaffoldKey;
  AppBarCustom({super.key, this.isMenu = false,this.scaffoldKey});

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      // elevation: 0,
      leading: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: (){
          if(widget.isMenu){
            widget.scaffoldKey.currentState.openDrawer();
          }else{
            Get.back();
          }
        },
        child: Icon(
          widget.isMenu ? Icons.menu : Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      title: Image.asset(
        Assets.logo,
        height: 50,
      ),
      centerTitle: true,
      actions: [
        GestureDetector(
          onTap: (){
            Get.toNamed(Routes.cart);
          },
          child: const Icon(
            Icons.shopping_bag_outlined,
            size: 25,
            color: Colors.black,
          ).marginOnly(right: 10),
        )
      ],
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: HexColor('#000000').withOpacity(0),
        statusBarIconBrightness: Brightness.dark
      ),
    );
  }
}
