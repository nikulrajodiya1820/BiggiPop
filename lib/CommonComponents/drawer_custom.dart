import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DrawerCustom extends StatefulWidget {
  const DrawerCustom({super.key});

  @override
  DrawerCustom_state createState() {
    // TODO: implement createState
    return DrawerCustom_state();
  }
}

class DrawerCustom_state extends State<DrawerCustom> {
  late AssetImage _imageToShow;
  late final List<String> products;
  late AssetImage _imageToShow1;
  late AssetImage _imageToShow2;
  late AssetImage _imageToShow3;
  @override
  void initState() {
    super.initState();
    products = List<String>.generate(10, (i) => "Product List: $i");
    _imageToShow = const AssetImage('assets/images/visa.png');
    _imageToShow1 = const AssetImage('assets/images/mastercard.png');
    _imageToShow2 = const AssetImage('assets/images/amex.png');
    _imageToShow3 = const AssetImage('assets/images/Paypal1.png');
  }

  bool isSwitched = false;
  var textValue = 'Switch is OFF';
  // GlobalKey<ScaffoldState> scaffolKey = GlobalKey<ScaffoldState>();

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (con) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to exit an App'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Drawer(
      width: MediaQuery.of(context).size.width * 1,
      backgroundColor: const Color(0xffFFFFFF),
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          const SizedBox(
            height: 45.0,
          ),
          ListTile(
            title: const Text('Woman',
                style: TextStyle(color: Color(0xff000000), fontSize: 16)),
            onTap: () {},
          ),
          const Divider(
            height: 1.0,
            color: Colors.black12,
          ),
          ListTile(
            title: const Text('Man',
                style: TextStyle(color: Color(0xff000000), fontSize: 16)),
            onTap: () {},
          ),
          const Divider(
            height: 1.0,
            color: Colors.black12,
          ),
          ListTile(
            title: const Text('Gifts',
                style: TextStyle(color: Color(0xff000000), fontSize: 16)),
            onTap: () {},
          ),
          const Divider(
            height: 1.0,
            color: Colors.black12,
          ),
          ListTile(
            title: const Text('Custom',
                style: TextStyle(color: Color(0xff000000), fontSize: 16)),
            onTap: () {},
          ),
          const Divider(
            height: 1.0,
            color: Colors.black12,
          ),
          ListTile(
            title: const Text('Stories',
                style: TextStyle(color: Color(0xff000000), fontSize: 16)),
            onTap: () {},
          ),
          const Divider(
            height: 1.0,
            color: Colors.black12,
          ),
          ListTile(
            title: const Text('Journey',
                style: TextStyle(color: Color(0xff000000), fontSize: 16)),
            onTap: () {},
          ),
          const SizedBox(
            height: 5.0,
          ),
          const Divider(
            height: 2.0,
            color: Colors.black12,
          ),
          ListTile(
            title: const Text('Terms',
                style: TextStyle(color: Color(0xff000000), fontSize: 16)),
            onTap: () {},
          ),
          const Divider(
            height: 1.0,
            color: Colors.black12,
          ),
          ListTile(
            title: const Text('Delivery',
                style: TextStyle(color: Color(0xff000000), fontSize: 16)),
            onTap: () {},
          ),
          const Divider(
            height: 1.0,
            color: Colors.black12,
          ),
          ListTile(
            title: const Text('Return & Exchanges',
                style: TextStyle(color: Color(0xff000000), fontSize: 16)),
            onTap: () {},
          ),
          const Divider(
            height: 1.0,
            color: Colors.black12,
          ),
          ListTile(
            title: const Text('Sizing',
                style: TextStyle(color: Color(0xff000000), fontSize: 16)),
            onTap: () {},
          ),
          const Divider(
            height: 1.0,
            color: Colors.black12,
          ),
          ListTile(
            title: const Text('Report Trademark Infringement',
                style: TextStyle(color: Color(0xff000000), fontSize: 16)),
            onTap: () {},
          ),
          const Divider(
            height: 1.0,
            color: Colors.black12,
          ),
          ListTile(
            title: const Text('Privacy Policy',
                style: TextStyle(color: Color(0xff000000), fontSize: 16)),
            onTap: () {},
          ),
          const Divider(
            height: 1.0,
            color: Colors.black12,
          ),
          ListTile(
            title: const Text('Terms of Use',
                style: TextStyle(color: Color(0xff000000), fontSize: 16)),
            onTap: () {},
          ),
          const Divider(
            height: 1.0,
            color: Colors.black12,
          ),
          ListTile(
            title: const Text('Terms of sales',
                style: TextStyle(color: Color(0xff000000), fontSize: 16)),
            onTap: () {},
          ),
          const SizedBox(
            height: 5.0,
          ),
          const Divider(
            height: 1.0,
            color: Colors.black12,
          ),
          ListTile(
            title: const Text('Pay with confidence',
                style: TextStyle(color: Color(0xff000000), fontSize: 16)),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
                'Our products are made from organic cotton and printed in the CA in a renewable energy powered factory.',
                style: TextStyle(color: Color(0xff000000), fontSize: 16)),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
                'Our cart is protected by reCAPTCHA and the Google Privacy Policy and terms of service apply.',
                style: TextStyle(color: Color(0xff000000), fontSize: 16)),
            onTap: () {},
          ),
          Row(
            children: [
              const SizedBox(
                width: 10.0,
              ),
              Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  height: 60,
                  margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                  width: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: _imageToShow,
                      alignment: Alignment.topCenter,
                    ),
                  )),
              Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  height: 60,
                  margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                  width: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: _imageToShow1,
                      alignment: Alignment.topCenter,
                    ),
                  )),
              Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  height: 60,
                  margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                  width: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: _imageToShow2,
                      alignment: Alignment.topCenter,
                    ),
                  )),
              Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  height: 60,
                  margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                  width: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: _imageToShow3,
                      alignment: Alignment.topCenter,
                    ),
                  )),
            ],
          ),
          const SizedBox(
            height: 50.0,
          ),
          Container(
            color: const Color(0xff474948),
            child: const Column(
              children: [
                SizedBox(
                  height: 25.0,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Text('Contact',
                          style: TextStyle(
                              color: Color(0xffFFFFFF), fontSize: 16)),
                    ),
                    Expanded(
                      child: Text('Careers',
                          style: TextStyle(
                              color: Color(0xffFFFFFF), fontSize: 16)),
                    ),
                    Expanded(
                      child: Text('Affilliates',
                          style: TextStyle(
                              color: Color(0xffFFFFFF), fontSize: 16)),
                    ),
                    Expanded(
                      child: Text('Site Map',
                          style: TextStyle(
                              color: Color(0xffFFFFFF), fontSize: 16)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.0,
                ),
                Text('Terms',
                    style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16)),
                SizedBox(
                  height: 25.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
