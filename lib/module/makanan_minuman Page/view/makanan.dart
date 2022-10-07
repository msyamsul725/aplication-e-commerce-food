import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../controller/resto Page_controller.dart';

import 'package:get/get.dart';

class makananView extends StatelessWidget {
  const makananView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestoPageController>(
      init: RestoPageController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  //body
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("products_food")
                        .where("theme_list", isEqualTo: "Makanan")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) return const Text("Error");
                      if (snapshot.data == null) return Container();
                      if (snapshot.data!.docs.isEmpty) {
                        return const Text("No Data");
                      }
                      final data = snapshot.data!;
                      return SizedBox(
                        height: 700.0,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 6,
                            mainAxisSpacing: 16,
                            childAspectRatio: 0.8,
                          ),
                          itemCount: data.docs.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            var item = (data.docs[index].data() as Map);
                            item["id"] = data.docs[index].id;
                            return Container(
                              width: 10,
                              margin: const EdgeInsets.only(right: 10.0),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(item["picture"]),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(16.0),
                                ),
                                color: Colors.blue[400],
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(6.0),
                                    margin: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      color: Colors.green[800],
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(
                                          12.0,
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      "PROMO",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 8.0,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      padding: const EdgeInsets.all(12.0),
                                      decoration: const BoxDecoration(
                                        color: Colors.black38,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(16.0),
                                          bottomRight: Radius.circular(16.0),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            item["product_name"],
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 11.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "${item["rating"]}",
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 11.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
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
