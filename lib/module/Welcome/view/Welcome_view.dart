import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';

import 'package:get/get.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      init: WelcomeController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          body: Stack(
            children: [
              //body
              const LoginBlurBackground(),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 24.0),
                    child: Column(
                      children: [
                        const Text("FoodFav",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                            )),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Text(
                          "the Best Food ordering and Delivery app of the century",
                          style:
                              TextStyle(color: Colors.white54, fontSize: 12.0),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          width: 360,
                          height: 50,
                          decoration: const BoxDecoration(),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: const Color(0xffe84393),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () => Get.to(const LoginView()),
                            child: const Text(
                              "Next",
                              style: TextStyle(
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
