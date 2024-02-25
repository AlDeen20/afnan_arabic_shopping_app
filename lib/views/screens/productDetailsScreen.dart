// ignore_for_file: file_names

import 'package:shopping_app/class/handlingDataView.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/controllers/productDetailsController.dart';
import 'package:shopping_app/views/widgets/backButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/views/widgets/productDetails/addToCart.dart';
import 'package:shopping_app/views/widgets/productDetails/details.dart';
import 'package:shopping_app/views/widgets/productDetails/productAmount.dart';
import 'package:shopping_app/views/widgets/productDetails/productImages.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsController());
    return Scaffold(
      appBar: AppBar(
        leading: const Row(
          children: [
            BackButtonWidget(),
            Text(
              'رجوع',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
          ],
        ),
        leadingWidth: 100,
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(
        //       Icons.favorite_border_outlined,
        //     ),
        //   ),
        //   const SizedBox(width: 15),
        // ],
      ),
      body: GetBuilder<ProductDetailsController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductImages(),
                      SizedBox(
                        height: 40.0,
                      ),
                      Details(),
                      SizedBox(height: 10),
                      ProductAmount(),
                    ],
                  ),
                ),
              ),
              AddToCart(
                id: Get.arguments['productID'],
                productsModel: Get.arguments['productsModel'],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
