// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/routes.dart';
import 'package:shopping_app/views/widgets/MyAccountButton.dart';

class MyAccountButtons extends StatelessWidget {
  const MyAccountButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 75.0,
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(250.0),
                bottomRight: Radius.circular(250.0),
              ),
            ),
          ),
          Positioned(
            top: 35,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyAccountButton(
                  text: 'طلباتي',
                  icon: const Icon(Icons.delivery_dining_outlined),
                  onClick: () {
                    Get.toNamed(AppRoutes.orders);
                  },
                ),
                MyAccountButton(
                  text: 'السلة',
                  icon: const Icon(Icons.shopping_bag_outlined),
                  onClick: () {
                    Get.toNamed(AppRoutes.shoppingcart);
                  },
                ),
                MyAccountButton(
                  text: 'البروفايل',
                  icon: const Icon(Icons.person_2_outlined),
                  onClick: () {
                    Get.toNamed(AppRoutes.myProfile);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
