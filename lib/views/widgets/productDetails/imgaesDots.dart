// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/controllers/productDetailsController.dart';

class ImagesDots extends StatelessWidget {
  const ImagesDots({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(builder: (controller) {
      return controller.productsImages.length > 1
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    controller.productsImages.length,
                    (index) => AnimatedContainer(
                          margin: const EdgeInsets.only(right: 5.0),
                          duration: const Duration(milliseconds: 900),
                          width: controller.currentIndex == index ? 20 : 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                        )),
              ],
            )
          : const Text('');
    });
  }
}
