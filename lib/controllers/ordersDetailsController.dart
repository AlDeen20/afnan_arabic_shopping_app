// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:shopping_app/class/statusRequest.dart';
import 'package:shopping_app/data/datasource/remote/orderProducts.dart';
import 'package:shopping_app/functions/handlingData.dart';

class OrdersDetailsController extends GetxController {
  List products = [];
  List productsTitle = [];
  late StatusRequest statusRequest;
  OrderProducts orderProducts = OrderProducts(Get.find());

  getProducts() async {
    statusRequest = StatusRequest.loading;
    final int orderID = Get.arguments['orderID'];
    var res = await orderProducts.getData(orderID.toString());
    statusRequest = handlingData(res);
    if (StatusRequest.success == statusRequest) {
      if (res['status'] == "success") {
        products = res['products'];
        productsTitle = res['products_title'];
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }
}
