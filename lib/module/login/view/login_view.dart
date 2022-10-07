import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/shared/widget/textfield/textfield.dart';
import '../controller/login_controller.dart';

import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  //body
                  Column(
                    children: [
                      const SizedBox(
                        height: 60.0,
                      ),
                      SizedBox(
                        height: 200.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 70.0,
                              height: 60.0,
                              decoration: const BoxDecoration(
                                color: Color(0xffe84393),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                              ),
                              child: const Icon(
                                Icons.restaurant,
                                color: Colors.white,
                                size: 32.0,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const SizedBox(
                              height: 50.0,
                              child: Text(
                                "FoodFav",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color(0xffe84393),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 80.0),
                        width: MediaQuery.of(context).size.width,
                        child: const Text(
                          "Sign in to your account",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      SizedBox(
                        height: 250.0,
                        child: Column(
                          children: [
                            const ExTextField(
                              id: "email",
                              label: "Email",
                            ),
                            const ExTextField(
                                id: "password", label: "Password"),
                            SizedBox(
                              height: 40.0,
                              child: SizedBox(
                                height: 100.0,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 14.0,
                                      margin: const EdgeInsets.only(left: 10.0),
                                      width: 14.0,
                                      color: const Color(0xffe84393),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 10.0),
                                      width: 100.0,
                                      child: const Text(
                                        "Remember me",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 50.0,
                        width: 360.0,
                        decoration: const BoxDecoration(),
                        child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: const Color(0xffe84393),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: () {},
                            child: const Text(
                              "Sign In",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 130.0),
                        width: MediaQuery.of(context).size.width,
                        child: const Text(
                          "or continue with",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 60.0,
                              width: 170.0,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.0,
                                  color: Colors.grey[200]!,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 26.0),
                                    height: 30,
                                    width: 30.0,
                                    child: Image.asset(
                                      "assets/icon/fb.webp",
                                      width: 64.0,
                                      height: 64.0,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    width: 100,
                                    child: const Text(
                                      "Facebook",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 60.0,
                              width: 160.0,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.0,
                                  color: Colors.grey[200]!,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                              ),
                              child: SizedBox(
                                height: 100.0,
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 26.0),
                                      width: 30.0,
                                      height: 30.0,
                                      child: Image.network(
                                        "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/768px-Google_%22G%22_Logo.svg.png",
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () => controller.googleLogin(),
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(left: 10.0),
                                        width: 50.0,
                                        child: const Text(
                                          "Google",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(color: Colors.grey),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Container();
                                },
                              ),
                            );
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Color(0xffe84393),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
