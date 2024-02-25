// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:shopping_app/appLinks.dart';
import 'package:shopping_app/class/statusRequest.dart';
import 'package:shopping_app/data/datasource/remote/productsInCartData.dart';
import 'package:shopping_app/functions/handlingData.dart';
import 'package:shopping_app/main.dart';

class ShoppingCartController extends GetxController {
  List productsInCart = [];
  List productImagesInCart = [];
  late StatusRequest statusRequest;
  ProductsInCartData productsInCartData = ProductsInCartData(Get.find());

  int fubTootalPrice() {
    late int tootalPrice;
    if (databox!.get("totalPrice") != null) {
      final getTotalPrice = databox!.get("totalPrice");
      tootalPrice = getTotalPrice['total_price'];
    } else {
      tootalPrice = 0;
    }
    return tootalPrice;
  }

  Future<String> getAmountInCart(int productID) async {
    Map<String, dynamic> listroductsAmount = await cartBox!.getAllValues();
    String amount =
        listroductsAmount[productID.toString()]['amount'].toString();
    return amount;
  }

  Future updateAmountInCart(int productID, int amount, int price) async {
    await cartBox!.put(productID.toString(),
        {'product_id': productID, 'amount': amount, 'product_price': price});
    update();
  }

  int amount(int amount) {
    update();
    return amount;
  }

  int shoAmount(int amount) {
    return amount;
  }

  getProducts() async {
    productsInCart.clear();
    productImagesInCart.clear();
    statusRequest = StatusRequest.loading;
    List productIds = await cartBox!.getAllKeys();
    var res = await productsInCartData.getData(productIds);
    statusRequest = handlingData(res);
    if (StatusRequest.success == statusRequest) {
      if (res['status'] == "success") {
        productsInCart = res['products'];
        productImagesInCart = res['images'];
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  String showProductImage(int productID) {
    List productImages = productImagesInCart
        .where((image) => image['product_id'] == productID)
        .toList();
    String imageUrl = AppLinks.productImageUrl + productImages[0]['imageUrl'];
    return imageUrl;
  }

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }
}
