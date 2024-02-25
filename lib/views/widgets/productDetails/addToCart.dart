// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/controllers/cartController.dart';
import 'package:shopping_app/controllers/productDetailsController.dart';
import 'package:shopping_app/model/products_model.dart';

class AddToCart extends StatelessWidget {
  final int id;
  final ProductsModel productsModel;

  const AddToCart({
    super.key,
    required this.id,
    required this.productsModel,
  });

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    final productDetailsController = Get.find<ProductDetailsController>();

    return GetBuilder<ProductDetailsController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50.0,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              child: InkWell(
                onTap: () async {
                  cartController.insertProductToCart(
                      productsModel, productDetailsController.amount);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'أضافة الى السلة',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            Text(
              '${productsModel.price.toString()} د.ع',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
