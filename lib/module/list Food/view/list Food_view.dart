import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';

import 'package:get/get.dart';

class ListFoodView extends StatelessWidget {
  const ListFoodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListFoodController>(
      init: ListFoodController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
              backgroundColor: const Color(0xffe84393),
              title: const Text("ListFood"),
              actions: [
                InkWell(
                  onTap: () => Get.to(const FoodFormView()),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.add),
                  ),
                ),
              ]),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                //body
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("products_food")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) return const Text("Error");
                      if (snapshot.data == null) return Container();
                      if (snapshot.data!.docs.isEmpty) {
                        return const Text("No Data");
                      }
                      final data = snapshot.data!;
                      return SizedBox(
                        height: 100.0,
                        child: ListView.builder(
                          itemCount: data.docs.length,
                          itemBuilder: (context, index) {
                            var item = (data.docs[index].data() as Map);
                            item["id"] = data.docs[index].id;
                            return Card(
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () =>
                                        Get.to(DetailPromoView(item: item)),
                                    child: SizedBox(
                                      width: 270.0,
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          backgroundColor: Colors.grey[200],
                                          backgroundImage:
                                              NetworkImage(item["picture"]),
                                        ),
                                        title: Text(item["product_name"]),
                                        subtitle: Text("\$${item["price"]}"),
                                        trailing: IconButton(
                                          onPressed: () {
                                            FirebaseFirestore.instance
                                                .collection("products_food")
                                                .doc(item["id"])
                                                .delete();
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  ElevatedButton.icon(
                                    icon: const Icon(
                                      Icons.add,
                                      size: 12,
                                    ),
                                    label: const Text(
                                      "Promo",
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xffe84393),
                                    ),
                                    onPressed: () => Get.to(DetailPromoView(
                                      item: item,
                                    )),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
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
