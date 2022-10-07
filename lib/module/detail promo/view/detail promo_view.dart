import 'package:flutter/material.dart';
import '../controller/detail promo_controller.dart';

import 'package:get/get.dart';

class DetailPromoView extends StatelessWidget {
  final Map item;
  const DetailPromoView({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailPromoController>(
      init: DetailPromoController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.blueGrey,
                  size: 24.0,
                ),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.all(20.0),
            height: 90.0,
            child: ElevatedButton.icon(
                icon: const Icon(Icons.shopify),
                label: const Text("Save Diskon"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffe84393),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16), // <-- Radius
                  ),
                ),
                onPressed: () {
                  controller.doSavePromo();
                }),
          ),
          body: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              children: [
                SizedBox(
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2.6,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              item["picture"],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              right: 0.0,
                              bottom: 0.0,
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.download,
                                      color: Colors.blueGrey,
                                      size: 24.0,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.favorite,
                                      color: Colors.blueGrey,
                                      size: 24.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 2.6,
                        decoration: const BoxDecoration(
                          color: Colors.black12,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              item["theme_list"],
                              style: const TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                          Text(
                            "${item["rating"]}",
                            style: const TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          item["product_name"],
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            width: 140.0,
                            child: const Text(
                              "Harga Awal : ",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          Text(
                            "Rp ${item["price"]}",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 24.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        width: MediaQuery.of(context).size.width,
                        child: const Text(
                          "Tambah Diskon",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 14.0),
                        height: 48.0,
                        child: ListView.builder(
                          itemCount: controller.discountList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            var data = controller.discountList[index];
                            return Obx(
                              () {
                                return InkWell(
                                  onTap: () {
                                    var value = data['tags'];
                                    var valueDiscount = data['value'];

                                    controller.selectedDiscount.value = value;
                                    controller.promo = value;
                                    controller.valueDiscount = valueDiscount;
                                    controller.addmenu();
                                    controller.simpanDiskon();
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          border: (controller
                                                      .selectedDiscount.value ==
                                                  null)
                                              ? null
                                              : (controller
                                                      .selectedDiscount.value!
                                                      .contains(data['tags']
                                                          .toString()))
                                                  ? Border.all(
                                                      width: 2,
                                                      color: Colors.red)
                                                  : null,
                                        ),
                                        child: Center(
                                          child: Text(
                                            data["tags"].toString(),
                                            style: TextStyle(
                                              color: (controller
                                                          .selectedDiscount
                                                          .value ==
                                                      null)
                                                  ? Colors.white
                                                  : (controller.selectedDiscount
                                                          .value!
                                                          .contains(data['tags']
                                                              .toString()))
                                                      ? Colors.blue
                                                      : Colors.white,
                                              fontSize: 11.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            width: 140.0,
                            child: const Text(
                              "Harga Diskon :",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          Text(
                            controller.finalHarga.toString(),
                            style: const TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
