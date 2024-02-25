// ignore_for_file: invalid_use_of_protected_member, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/controllers/cartController.dart';
import 'package:shopping_app/views/widgets/backButton.dart';
import 'package:shopping_app/views/widgets/shoopingCart/orderButton.dart';
import 'package:shopping_app/views/widgets/shoopingCart/productItemInShoppingCart.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('سلة المشتريات'),
        titleTextStyle: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        centerTitle: true,
        leading: Get.currentRoute == '/shoppingcart'
            ? const BackButtonWidget()
            : null,
      ),
      body: GetBuilder<CartController>(
        init: cartController,
        builder: (controller) => RefreshIndicator(
          onRefresh: () async {
            controller.refresh();
            controller.onInit();
          },
          child: Column(
            children: [
              Expanded(
                child: controller.cartItems.isNotEmpty
                    ? Container(
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 20.0),
                        child: ListView.builder(
                          itemCount: cartController.cartItems.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ProductItemInShoppingCart(
                              productsModel:
                                  controller.cartItems.toList()[index],
                              index: index,
                              quantity:
                                  controller.cartItems.toList()[index].quantity,
                            );
                          },
                        ),
                      )
                    : Center(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height - 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Lottie.asset('images/1.json', width: 200),
                              const SizedBox(height: 10),
                              const Text(
                                'لاتوجد بيانات',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
              if (controller.cartItems.isNotEmpty)
                const OrderButton()
              else
                Container(),
            ],
          ),
        ),
      ),
    );
  }
}
