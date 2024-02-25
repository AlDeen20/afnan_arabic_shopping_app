// ignore_for_file: file_names

import 'dart:convert';
import 'package:get/get.dart';
import 'package:shopping_app/appLinks.dart';
import 'package:shopping_app/controllers/cartController.dart';
import 'package:shopping_app/main.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app/routes.dart';

class CheckOutController extends GetxController {
  final cartController = Get.find<CartController>();
  bool inAsyncCall = false;
  void showProgress(bool value) {
    inAsyncCall = value;
    update();
  }

  Future<void> insertToOrders(Map data) async {
    showProgress(true);
    String endPoint = 'orders/insert';
    String url = '${AppLinks.apiServer}/$endPoint';
    final userData = databox!.get("userData");
    String authToken = userData['token'];
    int userId = userData['userId'];

    var res = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'authorization': authToken,
      },
      body: json.encode({
        'productsData': cartController.cartItems,
        'delivery_price': data['delivery_price'],
        'totalProducts_price':  int.parse(cartController.productsTotal.toString()),
        'order_price': int.parse(data['delivery_price'].toString()) +
            int.parse(cartController.productsTotal.toString()),
        'user_phone': data['user_phone'],
        'user_address': data['user_address'],
        'user_city': data['user_city'],
        'user_id': userId,
      }),
    );

    if (res.statusCode == 200) {
      showProgress(false);
      cartController.cartItems.clear();
      Get.offAllNamed(AppRoutes.successfuly);
    }
  }
}
