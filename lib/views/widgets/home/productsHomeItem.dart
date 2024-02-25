// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/controllers/cartController.dart';
import 'package:shopping_app/controllers/homeController.dart';
import 'package:shopping_app/model/products_model.dart';
import 'package:shopping_app/routes.dart';

class ProductsHomeItem extends GetView<HomeController> {
  final int productID;
  final String productTitle;
  final int productPrice;
  final ProductsModel productsModel;
  const ProductsHomeItem(
      this.productID, this.productTitle, this.productPrice, this.productsModel,
      {super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    return InkWell(
      onTap: () {
        Get.toNamed(
          AppRoutes.productsdetails,
          arguments: {
            'productID': productID,
            'productsModel': productsModel,
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(4.0),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              spreadRadius: 0.5,
              blurRadius: 0.5,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: Image.network(
                  controller.showProductImage(productID),
                  fit: BoxFit.fill,
                  height: 120.0,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                productTitle,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${productPrice.toString()} د.ع',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      cartController.insertProductToCart(productsModel, 1);
                    },
                    icon: const Icon(Icons.shopping_cart),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
