import 'package:biggi_pop/CommonComponents/app_bar_custom.dart';
import 'package:biggi_pop/CommonComponents/drawer_custom.dart';
import 'package:biggi_pop/CommonFiles/assets.dart';
import 'package:biggi_pop/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const DrawerCustom(),
      appBar: AppBarCustom(
        isMenu: true,
        scaffoldKey: scaffoldKey,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.home1),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  top: 130,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Custom t-shirts & more",
                                style: TextStyle(
                                    fontSize: 35,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Design a custom t-shirt, jumper, hoodie, and more.",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Create a personalized design that's authentically you.",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                            height: 45,
                            width: 200,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  )),
                              onPressed: () {
                                Get.toNamed(Routes.dashboard, arguments: "Men");
                              },
                              child: const Text(
                                "Design For Men",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            height: 45,
                            width: 200,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  )),
                              onPressed: () {
                                Get.toNamed(Routes.dashboard,
                                    arguments: "Women");
                              },
                              child: const Text(
                                "Design For Women",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            )),
                      ],
                    ).marginSymmetric(horizontal: 25),
                  )),
            ]),
            Container(
              color: HexColor("#f7f8fa"),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Make your mark and design your own t-shirt, sweatshirt, hoodie plus much more.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      Expanded(
                        child: Text(
                            "All using our Remill organic cotton material and printed the same day in our renewable energy powered by factory.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "What will you create?",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Get.toNamed(Routes.dashboard, arguments: "Men");
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width - 80,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      padding: const EdgeInsets.all(15),
                      child: const Center(
                        child: Text(
                          "Design For Men",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Get.toNamed(Routes.dashboard, arguments: "Women");
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width - 80,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      padding: const EdgeInsets.all(15),
                      child: const Center(
                        child: Text(
                          "Design For Women",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ),
                  )
                ],
              ).paddingSymmetric(horizontal: 20, vertical: 50),
            ),
            Container(
              color: Colors.white,
              child: Column(children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "How it works",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(Assets.home2),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Step one",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const Text(
                  "Choose the product you'd like to customize",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(Assets.home3),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Step two",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const Text(
                  "Upload your artwork or choose from our library and add type to your design",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(Assets.home4),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Step three",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const Text(
                  "Order your new custom product. Discounts available on bulk orders.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 50,
                ),
              ]).paddingSymmetric(horizontal: 15),
            ),
            Container(
                color: HexColor("#f7f8fa"),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Design your own t-shirt, and a whole lot more.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(15)),
                              child: Image.asset(
                                Assets.image3,
                                height: 225,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "T-shirt",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                const Text(
                                  "\$400",
                                  style: TextStyle(
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
                      ).paddingSymmetric(vertical: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(15)),
                              child: Image.asset(
                                Assets.image4,
                                height: 225,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "T-shirt",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                const Text(
                                  "\$500",
                                  style: TextStyle(
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
                      ).paddingSymmetric(vertical: 10),
                    ])).paddingSymmetric(horizontal: 25, vertical: 20),
            Container(
                color: Colors.white,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    const Text("Why choose us?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(Assets.home5),
                            const Text(
                              "Fill-colour",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ).paddingOnly(bottom: 5),
                            const Text(
                              "Water-based inks and digital printing technology for quality, full colour custom printing.",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(Assets.home6),
                            const Text(
                              "Bulk discount",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ).paddingOnly(bottom: 5),
                            const Text(
                              "Enjoy bulk discount on custom printed t-shirts, and more.",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(Assets.home7),
                            const Text(
                              "Plastic-free packaging",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ).paddingOnly(bottom: 5),
                            const Text(
                              "Custom prints are shipped in our rip-stop paper packaging.",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(Assets.home8),
                            const Text(
                              "Sustainable printing",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ).paddingOnly(bottom: 5),
                            const Text(
                              "Personalized prints are made in our CA-based factory powered by renewable energy.",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )),
                      ],
                    )
                  ],
                ).paddingAll(15)),
            Container(
              color: HexColor("#f7f8fa"),
              child: Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "What will you create?",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "It couldn't be simpler to make your own t-shirt and we love seeing what you make so please tag us when your products arrive. you can design on your phone, and we'll print what you see on screen in full colour. Custom printed clothing made easy.",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    Assets.home1,
                    height: 500,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Great custom printing",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "\"I designed a custom T-shirt (with some fairly fine detail) and was blown away ny the quality of the printing. Plus is ordered it Friday night in December, and had it in my hands the following Thursday morning as expected. Definitely recommend!\"\n-Phillip",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                ],
              ).paddingSymmetric(horizontal: 15),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "Brands using Custom",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    children: [
                      Expanded(child: Image.asset(Assets.home9)),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(child: Image.asset(Assets.home10)),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(child: Image.asset(Assets.home11)),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(child: Image.asset(Assets.home12)),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ).paddingSymmetric(horizontal: 25),
            ),
            Container(
              color: HexColor("#f7f8fa"),
              child: Column(children: [
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Helpful hints and tips",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(Assets.home13),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Design Your Own Custom Hoodie",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(child: Image.asset(Assets.home14)),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(child: Image.asset(Assets.home15))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Our free t-shirt design app (for Android)",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(Assets.home16),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Create Personalized Christmas Gifts In Seconds",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 25,
                )
              ]),
            ).paddingSymmetric(horizontal: 15),
            Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "Frequently asked questions",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    frequentlyAskedQuestion(
                        "How do I create a custom t-shirt?"),
                    frequentlyAskedQuestion(
                        "What's the minimum order for the custom products?"),
                    frequentlyAskedQuestion(
                        "When will i receive my custom clothing?"),
                    frequentlyAskedQuestion(
                        "What is the quality of the print?"),
                    frequentlyAskedQuestion(
                        "How should i prepare my artwork for printing?"),
                    frequentlyAskedQuestion("What is your return policy?")
                  ],
                ).paddingSymmetric(horizontal: 15))
          ],
        ),
      ),
    );
  }

  Widget frequentlyAskedQuestion(String title) {
    return Column(
      children: [
        Divider(
          color: HexColor('#e8e8e8'),
          thickness: 2,
        ),
        const SizedBox(
          height: 10,
        ),
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            textColor: Colors.black,
            collapsedIconColor: Colors.black,
            iconColor: Colors.black,
            expandedAlignment: Alignment.centerLeft,
            childrenPadding:
                const EdgeInsetsDirectional.symmetric(horizontal: 15),
            children: [Text(title)],
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
