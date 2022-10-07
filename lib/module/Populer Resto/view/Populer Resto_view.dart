import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';

import 'package:get/get.dart';

class Mytabs extends GetxController with SingleGetTickerProviderMixin {
  late TabController controller;
  final List<Tab> myTabs = <Tab>[
    const Tab(
      text: "Favorite",
    ),
    const Tab(
      text: "Terdekat",
    )
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

class PopulerRestoView extends StatelessWidget {
  const PopulerRestoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopulerRestoController>(
      init: PopulerRestoController(),
      builder: (controller) {
        controller.view = this;
        final Mytabs _tabs = Get.put(Mytabs());

        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xffe84393),
            title: const Text("Populer Resto"),
            actions: const [],
            bottom: TabBar(controller: _tabs.controller, tabs: _tabs.myTabs),
          ),
          body: TabBarView(
            controller: _tabs.controller,
            children: const [
              RestoPageView(),
              MenuRestoPageView(),
            ],
          ),
        );
      },
    );
  }
}
