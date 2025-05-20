import 'package:biggi_pop/CommonFiles/assets.dart';
import 'package:biggi_pop/Screen/Login/login_controller.dart';
import 'package:biggi_pop/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Stack(
          children: [
            Container(
              color: HexColor("#272f32"),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Positioned(
              top: 0,
              child: SizedBox(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  margin: EdgeInsets.zero,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(50)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(
                              Icons.arrow_back_rounded,
                              size: 35,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Welcome",
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: HexColor("#303639")),
                          ),
                          Text(
                            "Back",
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: HexColor("#303639")),
                          ),
                          Text(
                            "Continue your adventure.",
                            style: TextStyle(
                                fontSize: 16, color: HexColor("#303639")),
                          )
                        ]),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 270,
              child: SizedBox(
                // height: MediaQuery.of(context).size.height - 250,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(image: AssetImage(Assets.biggiPopWhite),height: 80,),
                        const SizedBox(
                          height:35,
                        ),
                        TextFormField(
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                          labelText: "Enter Email",
                          labelStyle: TextStyle(color: HexColor("#969897")),
                          fillColor: Colors.white,
                          hintText: "Email",
                          hintStyle: TextStyle(color: HexColor("#969897")),
                          isDense: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: HexColor("#969897"),
                              width: 2.0,
                            ),
                          ),
                        )),
                        const SizedBox(
                          height: 15,
                        ),
                        StreamBuilder<Object>(
                          stream: loginController.showPassword.stream,
                          builder: (context, snapshot) {
                            return TextFormField(
                                obscureText: !loginController.showPassword.value,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  labelText: "Enter Password",
                                  labelStyle: TextStyle(color: HexColor("#969897")),
                                  fillColor: Colors.white,
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: HexColor("#969897")),
                                  isDense: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      color: HexColor("#969897"),
                                      width: 2.0,
                                    ),
                                  ),
                                  suffixIcon: IconButton(
                                      icon: Icon(
                                        loginController.showPassword.value
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        loginController.showPassword.value =
                                            !loginController.showPassword.value;
                                      }),
                                ));
                          }
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        StreamBuilder<Object>(
                            stream: loginController.rememberMe.stream,
                            builder: (context, snapshot) {
                              return Row(
                                children: [
                                  SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Checkbox(
                                      value: loginController.rememberMe.value,
                                      onChanged: (value) {
                                        loginController.rememberMe.value =
                                            value!;
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      side: MaterialStateBorderSide.resolveWith(
                                        (states) => const BorderSide(
                                            width: 1.5, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  GestureDetector(
                                    onTap: () {
                                      loginController.rememberMe.value =
                                          !loginController.rememberMe.value;
                                    },
                                    child: Text(
                                      "Remember me",
                                      style: TextStyle(
                                          color: HexColor("#969897"),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              );
                            }),
                        const SizedBox(
                          height: 35,
                        ),
                        SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  )),
                              onPressed: () {
                                Get.toNamed(Routes.home);
                              },
                              child: Text(
                                "Sign in",
                                style: TextStyle(
                                    fontSize: 18, color: HexColor("#4b5153")),
                              ),
                            )),
                        const SizedBox(
                          height: 25,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        )
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
