// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:shopping_app/class/statusRequest.dart';
import 'package:shopping_app/data/datasource/remote/orderData.dart';
import 'package:shopping_app/functions/handlingData.dart';
import 'package:shopping_app/main.dart';

class MyOrdersController extends GetxController {
  List orders = [];
  late StatusRequest statusRequest;
  OrderData orderData = OrderData(Get.find());

  Future<void> getOrders() async {
    statusRequest = StatusRequest.loading;
    final userData = databox!.get("userData");
    int userID = userData['userId'];
    var res = await orderData.getData(userID.toString());
    statusRequest = handlingData(res);
    if (StatusRequest.success == statusRequest) {
      if (res['status'] == "success") {
        orders = res['orders'];
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  Future<void> deleteOrder(String orderID) async {
    statusRequest = StatusRequest.loading;
    update();
    var res = await orderData.deleteData(orderID.toString());
    statusRequest = handlingData(res);
    onInit();
    refresh();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
