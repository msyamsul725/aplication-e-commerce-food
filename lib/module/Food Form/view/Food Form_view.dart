import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/shared/widget/image_picker/image_picker.dart';
import 'package:flutter_hyper_ui/shared/widget/location_picker/location_picker.dart';
import 'package:flutter_hyper_ui/shared/widget/rating/rating.dart';
import 'package:flutter_hyper_ui/shared/widget/textfield/textfield.dart';
import '../controller/Food Form_controller.dart';

import 'package:get/get.dart';

class FoodFormView extends StatelessWidget {
  const FoodFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodFormController>(
      init: FoodFormController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xffe84393),
            title: const Text("FoodForm"),
            actions: [
              InkWell(
                onTap: () => controller.loadData(),
                child: const Padding(
                    padding: EdgeInsets.all(20.0), child: Text('Save')),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  //body
                  const ExTextField(
                    id: "place_name",
                    label: "Restaurant Name",
                  ),
                  const ExLocationPicker(
                    id: "product_address",
                    label: "Product Addres",
                  ),
                  const ExTextField(
                    id: "product_name",
                    label: "Product Name",
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 40.0),
                    height: 28.0,
                    child: ListView.builder(
                      itemCount: controller.themeList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var data = controller.themeList[index];
                        return Obx(
                          () {
                            return InkWell(
                              onTap: () =>
                                  controller.selectedTheme.value = data,
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 4),
                                decoration: BoxDecoration(
                                  color: const Color(0xffe84393),
                                  borderRadius: BorderRadius.circular(16.0),
                                  border:
                                      (controller.selectedTheme.value == null)
                                          ? null
                                          : (controller.selectedTheme.value!
                                                  .contains(data))
                                              ? Border.all(
                                                  width: 2, color: Colors.red)
                                              : null,
                                ),
                                child: Center(
                                  child: Text(
                                    data,
                                    style: TextStyle(
                                      color: (controller.selectedTheme.value ==
                                              null)
                                          ? Colors.white
                                          : (controller.selectedTheme.value!
                                                  .contains(data))
                                              ? Colors.blue
                                              : Colors.white,
                                      fontSize: 11.0,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  const ExImagePicker(
                    id: "picture",
                    label: "Picture Product",
                  ),
                  const ExTextField(
                    id: "price",
                    label: 'price',
                    keyboardType: TextInputType.number,
                    value: "0",
                  ),
                  const ExRating(
                    id: "rating",
                    label: "Rating",
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
