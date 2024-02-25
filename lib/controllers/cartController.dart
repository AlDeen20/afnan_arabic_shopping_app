// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/model/products_model.dart';
import 'package:shopping_app/routes.dart';

class CartController extends GetxController {
  List<ProductsModel> cartItems = <ProductsModel>[];

  void insertProductToCart(ProductsModel productsModel, int quantity) {
    bool alreadyAdded =
        cartItems.any((element) => element.id == productsModel.id);
    if (alreadyAdded) {
      cartItems[
              cartItems.indexWhere((element) => element.id == productsModel.id)]
          .quantity++;
      snackbarNewAdd();
      update();
    } else {
      cartItems.add(productsModel);
      snackbarNewAdd();
      update();
    }
  }

  void plusProductToCart(ProductsModel productsModel) {
    cartItems[cartItems.indexOf(productsModel)].quantity++;
    update();
  }

  void removeProductsFromCart(ProductsModel productsModel) {
    if (cartItems[cartItems.indexOf(productsModel)].quantity > 1) {
      cartItems[cartItems.indexOf(productsModel)].quantity--;
      update();
    } else {
      cartItems.remove(productsModel);
      update();
    }
  }

  void deleteProductFromCart(ProductsModel productsModel) {
    cartItems[cartItems.indexOf(productsModel)].quantity = 1;
    cartItems.remove(productsModel);
    update();
  }

  get productsTotal => cartItems.fold(
      0, (sum, product) => sum + (int.parse(product.price) * product.quantity));

  void snackbarNewAdd() {
    Get.snackbar(
      '',
      '',
      onTap: (snack) => Get.back(),
      titleText: const Text(
        'تنبية',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      messageText: const Text(
        'تم أضافة المنتج الى السلة',
        style: TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),
      ),
      icon: const Icon(Icons.done, color: Colors.white),
      borderRadius: 5.0,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      backgroundColor: kPrimaryColor,
      mainButton: TextButton(
        onPressed: () {
          Get.back();
          if (Get.currentRoute == '/subcategories') {
            Get.offNamed(AppRoutes.shoppingcart);
          } else {
            Get.toNamed(AppRoutes.shoppingcart);
          }
        },
        child: const Text(
          'فتح السلة',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
