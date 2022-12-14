import 'package:flutter/material.dart';
import '../controller/resto Page_controller.dart';

import 'package:get/get.dart';

class RestoPageView extends StatelessWidget {
  const RestoPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestoPageController>(
      init: RestoPageController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("RestoPage"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: const [
                  //body
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}