import 'package:flutter/material.dart';
import '../controller/form Promo_controller.dart';

import 'package:get/get.dart';

class FormPromoView extends StatelessWidget {
  const FormPromoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormPromoController>(
      init: FormPromoController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("FormPromo"),
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