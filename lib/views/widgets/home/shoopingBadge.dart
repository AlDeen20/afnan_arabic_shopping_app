// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/cartController.dart';
import 'package:shopping_app/routes.dart';

class ShoopingBadge extends StatelessWidget {
  const ShoopingBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    return Container(
      width: 35.0,
      height: 35.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          Get.toNamed(AppRoutes.shoppingcart);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Icon(
              Icons.shopping_bag_outlined,
              size: 28.0,
            ),
            GetBuilder<CartController>(builder: (controller) {
              if (controller.cartItems.isNotEmpty) {
                return Positioned(
                  top: 8.0,
                  right: 0.0,
                  child: Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text(
                        cartController.cartItems.length < 10
                            ? cartController.cartItems.length.toString()
                            : '+9',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return Container();
              }
            }),

            // GetBuilder<HomeController>(builder: (controller) {
            //   return FutureBuilder<int>(
            //     future: controller.getProductInCartLenght(),
            //     builder: (context, snapshot) {
            //       if (snapshot.hasData && snapshot.data != null) {
            //         if (snapshot.data! > 0) {
            //           return Positioned(
            //             top: 8.0,
            //             right: 0.0,
            //             child: Container(
            //               width: 20.0,
            //               height: 20.0,
            //               decoration: BoxDecoration(
            //                 color: Colors.red,
            //                 borderRadius: BorderRadius.circular(50),
            //               ),
            //               child: Center(
            //                 child: Text(
            //                   snapshot.data! < 10
            //                       ? snapshot.data!.toString()
            //                       : '9+',
            //                   style: const TextStyle(
            //                     color: Colors.white,
            //                     fontSize: 10,
            //                     fontWeight: FontWeight.bold,
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           );
            //         } else {
            //           return const Text('');
            //         }
            //       } else if (snapshot.hasError) {
            //         // Handle error state
            //         return const Text('');
            //       } else {
            //         // Handle loading state
            //         return const Text(' ');
            //       }
            //     },
            //   );
            // }),
          ],
        ),
      ),
    );
  }
}
