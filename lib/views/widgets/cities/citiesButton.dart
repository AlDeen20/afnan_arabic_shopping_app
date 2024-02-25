// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/controllers/CitiesController.dart';
import 'package:shopping_app/routes.dart';

class CitiesButton extends GetView<CitiesController> {
  final String city;
  final int deliveryPrice;
  const CitiesButton({
    super.key,
    required this.city,
    required this.deliveryPrice,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (controller.formKey.currentState!.validate()) {
          controller.formKey.currentState!.save();
          Get.toNamed(AppRoutes.checkout, arguments: {
            'address': controller.addressController.text,
            'phone': controller.phoneController.text,
            'city': city,
            'deliveryPrice': deliveryPrice,
          });
        }
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(5.0)),
        child: const Center(
          child: Text(
            'متابعة',
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
