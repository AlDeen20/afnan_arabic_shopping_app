// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/controllers/subCategoriesController.dart';
import 'package:shopping_app/views/widgets/products/productItem.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubCategoriesController>(
      builder: (controller) => controller.showProducts.isNotEmpty
          ? GridView.builder(
              itemCount: controller.showProducts.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.69,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemBuilder: (context, index) {
                return ProductsItem(
                  controller.showProducts[index].id,
                  controller.showProducts[index].title,
                  int.parse(controller.showProducts[index].price.toString()),
                  controller.showProducts[index],
                );
              },
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                Lottie.asset('images/1.json', width: 200),
                const SizedBox(height: 10),
                const Text(
                  'لاتوجد منتجات',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
    );
  }
}
