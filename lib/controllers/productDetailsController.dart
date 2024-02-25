// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:shopping_app/class/statusRequest.dart';
import 'package:shopping_app/data/datasource/remote/productDetailsData.dart';
import 'package:shopping_app/functions/handlingData.dart';

class ProductDetailsController extends GetxController {
  ProductDetailsData productDetailsData = ProductDetailsData(Get.find());
  Map product = {};
  List productsImages = [];
  int currentIndex = 0;
  int amount = 1;
  late StatusRequest statusRequest;
  int productID = Get.arguments['productID'];

  getData() async {
    statusRequest = StatusRequest.loading;
    var res = await productDetailsData.getData(productID);
    statusRequest = handlingData(res);
    if (StatusRequest.success == statusRequest) {
      if (res['status'] == "success") {
        product.addAll(res['product']);
        productsImages.addAll(res['images']);
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  void updateCurrentIndex(int index) {
    currentIndex = index;
    update();
  }

  void plusAmount() {
    amount++;
    update();
  }

  void minusAmount() {
    if (amount > 1) {
      amount--;
      update();
    }
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
