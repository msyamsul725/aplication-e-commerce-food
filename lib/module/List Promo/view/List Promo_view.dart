import 'package:flutter/material.dart';
import '../controller/List Promo_controller.dart';

import 'package:get/get.dart';

class ListPromoView extends StatelessWidget {
  const ListPromoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListPromoController>(
      init: ListPromoController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("ListPromo"),
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