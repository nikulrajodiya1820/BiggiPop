import 'package:biggi_pop/CommonFiles/assets.dart';
import 'package:biggi_pop/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          // color: HexColor("#272f32"),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.backgroundImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: SizedBox(
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: Card(
              margin: EdgeInsets.zero,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topRight: Radius.circular(50)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Get involved with people and events around you.",
                    style: TextStyle(fontSize: 17, color: HexColor("#525759")),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: HexColor("#272e32"),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            )),
                        onPressed: () {
                          Get.toNamed(Routes.home);
                        },
                        child: const Text(
                          "Sign in",
                          style: TextStyle(fontSize: 18),
                        ),
                      )),
                  const SizedBox(
                    height: 25,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Or Create Account",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.arrow_forward_rounded)
                    ],
                  )
                ]),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
