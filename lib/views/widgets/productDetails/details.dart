import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/controllers/productDetailsController.dart';

class Details extends GetView<ProductDetailsController> {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
              text: TextSpan(children: [
            const TextSpan(
              text: 'العنوان:  ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: controller.product['title'].toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ])),
          const Divider(),
          const SizedBox(height: 10.0),
          RichText(
              text: TextSpan(children: [
            const TextSpan(
              text: 'الوصف:  ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: controller.product['des'].toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ])),
          const Divider(),
          const SizedBox(height: 10.0),
          RichText(
              text: TextSpan(children: [
            const TextSpan(
              text: 'السعر:  ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: '${controller.product['price'].toString()} د.ع',
              style: const TextStyle(
                color: kSecondaryColor,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ])),
        ],
      ),
    );
  }
}
