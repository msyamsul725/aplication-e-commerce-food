import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../../shared/util/input/input.dart';
import '../view/Food Form_view.dart';

class FoodFormController extends GetxController {
  FoodFormView? view;
  Rxn<String> selectedTheme = Rxn<String>();

  List themeList = ['Makanan', 'Minuman'];

  doSave() async {
    var namaResto = Input.get("place_name");
    var alamatResto = Input.get("product_address");
    var namaMakanan = Input.get("product_name");
    var harga = Input.get("price");
    var gambar = Input.get("picture");
    var rating = Input.get("rating");

    await FirebaseFirestore.instance.collection("products_food").add({
      "place_name": namaResto,
      "product_addres": alamatResto,
      "product_name": namaMakanan,
      "price": harga,
      "theme_list": selectedTheme.value,
      "picture": gambar,
      "rating": rating,
      "created_at": Timestamp.now(),
    });

    Get.back();
  }

  List products = [];

  @override
  void onInit() async {
    super.onInit();
    await loadData();
  }

  loadData() async {
    var snapshot = await FirebaseFirestore.instance.collection("new").get();

    for (var doc in snapshot.docs) {
      var d = doc.data();
      products.add({
        "id": doc.id,
        "place_name": d["place_name"],
        "product_addres": d["product_addres"],
        "price": d["price"],
        "product_name": d["product_name"],
        "theme_list": d["theme_list"],
        "picture": d["picture"],
        "rating": d["rating"],
        "created_at": Timestamp.now(),
      });
    }

    update();
  }
}
