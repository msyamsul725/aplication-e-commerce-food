import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:flutter_hyper_ui/module/makanan_minuman%20Page/view/makanan.dart';
import 'package:flutter_hyper_ui/module/makanan_minuman%20Page/view/minuman.dart';
import '../controller/Populer Menu_controller.dart';

import 'package:get/get.dart';

class Mytab extends GetxController with SingleGetTickerProviderMixin {
  late TabController controller;
  final List<Tab> myTabs = <Tab>[
    const Tab(
      text: "Makanan",
    ),
    const Tab(
      text: "Minuman",
    ),
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    controller = TabController(length: 2, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    controller.dispose();
    super.onClose();
  }
}

class PopulerMenuView extends StatelessWidget {
  const PopulerMenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopulerMenuController>(
      init: PopulerMenuController(),
      builder: (controller) {
        controller.view = this;
        final Mytab _tabs = Get.put(Mytab());

        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xffe84393),
            title: const Text("PopulerMenu"),
            bottom: TabBar(
              controller: _tabs.controller,
              tabs: _tabs.myTabs,
            ),
          ),
          body: TabBarView(
            controller: _tabs.controller,
            children: const [
              makananView(),
              minumanView(),
            ],
          ),
        );
      },
    );
  }
}
