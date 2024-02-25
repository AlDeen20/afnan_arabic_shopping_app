// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/controllers/cartController.dart';
import 'package:shopping_app/routes.dart';

class OrderButton extends StatelessWidget {
  const OrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 150.0,
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const Text(
                'السعر الكلي:',
                style: TextStyle(
                  fontSize: 16,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              GetBuilder<CartController>(
                init: cartController,
                builder: (controller) => Text(
                  '${controller.productsTotal} د.ع',
                  style: const TextStyle(
                    fontSize: 16,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.citiesScreen),
            child: Container(
                width: double.infinity,
                height: 50.0,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: const Center(
                  child: Text(
                    'اطلب الان',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                )),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
