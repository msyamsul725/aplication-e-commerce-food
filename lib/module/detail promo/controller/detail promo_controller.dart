import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../view/detail promo_view.dart';

class DetailPromoController extends GetxController {
  DetailPromoView? view;
  Rxn<String> selectedDiscount = Rxn<String>();

  double finalHarga = 0;
  double valueDiscount = 0;
  String promo = "";
  List discountList = [
    {
      'tags': '10 %',
      'value': 10 / 100,
    },
    {
      'tags': '20 %',
      'value': 20 / 100,
    },
    {
      'tags': '30 %',
      'value': 30 / 100,
    },
    {
      'tags': '40 %',
      'value': 40 / 100,
    },
    {
      'tags': '50 %',
      'value': 50 / 100,
    },
  ];

  final totalDiskon = 0.0.obs;

  doSavePromo() async {
    await FirebaseFirestore.instance.collection("promo").add({
      "discount": selectedDiscount.value,
      "products_food": view!.item,
      "finalHarga": finalHarga,
    });
    Get.back();
  }

  changeTotalDiskon() {
    totalDiskon.value = double.parse(view!.item["price"].toString()) *
        double.parse(view!.item["price"].toString());
  }

  void addmenu() {
    update();
  }

  simpanDiskon() {
    var hargaAwal = double.parse(view!.item["price"].toString());
    var discount = valueDiscount;
    var discontprice = (hargaAwal * discount);
    var newharga = hargaAwal - discontprice;
    finalHarga = newharga;
    update();
  }
}
