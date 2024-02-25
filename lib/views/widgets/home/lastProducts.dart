// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/controllers/homeController.dart';
import 'package:shopping_app/routes.dart';
import 'package:shopping_app/views/widgets/home/productsHomeItem.dart';

class LastProducts extends StatelessWidget {
  const LastProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'أحدث المنتجات',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 3,
                    color: kPrimaryColor,
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Get.toNamed(
                    AppRoutes.categories,
                  );
                },
                child: const Text(
                  'المزيد',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        GetBuilder<HomeController>(
          builder: (controller) => GridView.builder(
            itemCount: controller.products.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.69,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            itemBuilder: (context, index) {
              return ProductsHomeItem(
                controller.products[index].id,
                controller.products[index].title,
                int.parse(
                  controller.products[index].price.toString(),
                ),
                controller.products[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
