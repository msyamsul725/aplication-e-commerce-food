import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:get/get.dart';

class DashboardFood extends StatelessWidget {
  const DashboardFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              //bodyrow

              const SizedBox(
                height: 70.0,
              ),
              Row(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: const BoxDecoration(
                          color: Color(0xffe84393),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              16.0,
                            ),
                          ),
                        ),
                        child: const Icon(
                          Icons.restaurant_menu,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 16.0),
                            decoration: const BoxDecoration(),
                            child: const Text(
                              "Hello, Sem !",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 155.0),
                        width: 40.0,
                        height: 40.0,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              16.0,
                            ),
                          ),
                        ),
                        child: const Icon(
                          Icons.notifications,
                          size: 30.0,
                          color: Color(0xffe84393),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 40.0,
              ),
              Container(
                margin: const EdgeInsets.only(right: 14.0),
                width: 370.0,
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey[400]!,
                  ),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.search),
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: null,
                        decoration: const InputDecoration.collapsed(
                          filled: true,
                          fillColor: Colors.transparent,
                          hintText: "Search",
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.sort,
                          color: Color(0xffe84393),
                          size: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection("promo").snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) return const Text("Error");
                  if (snapshot.data == null) return Container();
                  if (snapshot.data!.docs.isEmpty) {
                    return const Text("No Data");
                  }
                  final data = snapshot.data!;
                  return SizedBox(
                    height: 200.0,
                    child: ListView.builder(
                      itemCount: data.docs.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var item = (data.docs[index].data() as Map);
                        item["id"] = data.docs[index].id;
                        return Container(
                          margin: const EdgeInsets.only(right: 10.0),
                          width: 360,
                          height: 200.0,
                          decoration: BoxDecoration(
                            color: Colors.red[200],
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                16.0,
                              ),
                            ),
                          ),
                          child: SizedBox(
                            height: 100.0,
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                    left: 26.0,
                                  ),
                                  height: 160.0,
                                  width: 160.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        item["products_food"]["picture"],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(16.0),
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(6.0),
                                        margin: const EdgeInsets.all(8.0),
                                        decoration: const BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              12.0,
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          "Diskon : ${item["discount"]}",
                                          style: const TextStyle(
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
                                              bottomRight:
                                                  Radius.circular(16.0),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                item["products_food"]
                                                    ["product_name"],
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontSize: 11.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                "${item["products_food"]["price"]}",
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  fontSize: 11.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                "${item["finalHarga"]}",
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 20.0),
                                  height: 160.0,
                                  width: 146.0,
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4.0),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: const Text(
                                          "Special Dear For",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4.0),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: const Text(
                                          "Oktober",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                      Container(
                                        width: 120.0,
                                        height: 40.0,
                                        decoration: const BoxDecoration(),
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            backgroundColor: Colors.orange[900],
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: const Text(
                                            "Buy Now",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: const Text(
                      "Populer Menu",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.to(const PopulerRestoView()),
                    child: const Text(
                      "See All",
                      style: TextStyle(
                        color: Color(0xffe84393),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),

              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("products_food")
                    .where("rating", isEqualTo: 5)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) return const Text("Error");
                  if (snapshot.data == null) return Container();
                  if (snapshot.data!.docs.isEmpty) {
                    return const Text("No Data");
                  }
                  final data = snapshot.data!;
                  return SizedBox(
                    height: 140.0,
                    child: ListView.builder(
                      itemCount: data.docs.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var item = (data.docs[index].data() as Map);
                        item["id"] = data.docs[index].id;
                        return Container(
                          height: 100.0,
                          width: 140,
                          margin: const EdgeInsets.only(right: 10.0),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(item["picture"]),
                              fit: BoxFit.cover,
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
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      12.0,
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  "Populer",
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

              const SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: const Text(
                      "Updated Menu",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.to(const PopulerMenuView()),
                    child: const Text(
                      "See All",
                      style: TextStyle(
                        color: Color(0xffe84393),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("products_food")
                    .orderBy("created_at", descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) return const Text("Error");
                  if (snapshot.data == null) return Container();
                  if (snapshot.data!.docs.isEmpty) {
                    return const Text("No Data");
                  }
                  final data = snapshot.data!;
                  return SizedBox(
                    height: 140.0,
                    child: ListView.builder(
                      itemCount: data.docs.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var item = (data.docs[index].data() as Map);
                        item["id"] = data.docs[index].id;
                        return Container(
                          height: 100.0,
                          width: 140,
                          margin: const EdgeInsets.only(right: 10.0),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(item["picture"]),
                              fit: BoxFit.cover,
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
                                decoration: const BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      12.0,
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  "New",
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
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                width: MediaQuery.of(context).size.width,
                child: const Text(
                  "New Product",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
              SizedBox(
                height: 140.0,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 140,
                      margin: const EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: NetworkImage(
                            "https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=710&q=80",
                          ),
                          fit: BoxFit.cover,
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
                              child: const Text(
                                "Avocado and Eeg Toast",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 11.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
