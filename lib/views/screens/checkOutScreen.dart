// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/controllers/CheckOutController.dart';
import 'package:shopping_app/controllers/cartController.dart';
import 'package:shopping_app/views/widgets/backButton.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    final String address = Get.arguments['address'];
    final String phone = Get.arguments['phone'];
    final String city = Get.arguments['city'];
    final int deliveryPrice = Get.arguments['deliveryPrice'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('تنفيذ الطلب'),
        titleTextStyle: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        centerTitle: true,
        leading: const BackButtonWidget(),
      ),
      body: GetBuilder<CheckOutController>(
          init: CheckOutController(),
          builder: (controller) {
            int sumPrice = deliveryPrice +
                int.parse(cartController.productsTotal.toString());
            return ModalProgressHUD(
              inAsyncCall: controller.inAsyncCall,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // phone
                      Container(
                        color: kPrimaryColor.withOpacity(0.45),
                        child: Row(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 3.0),
                              decoration: const BoxDecoration(
                                border: Border(
                                  left:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                              ),
                              child: const SizedBox(
                                width: 100,
                                child: Center(
                                  child: Text(
                                    'رقم الهاتف',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Text(
                              phone,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      // address
                      Container(
                        color: kPrimaryColor.withOpacity(0.45),
                        child: Row(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 3.0),
                              decoration: const BoxDecoration(
                                border: Border(
                                  left:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                              ),
                              child: const SizedBox(
                                width: 100,
                                child: Center(
                                  child: Text(
                                    'عنوان التوصيل',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Text(
                              '$city/ $address',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 8.0),

                      //delivery price
                      Container(
                        color: kPrimaryColor.withOpacity(0.45),
                        child: Row(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 3.0),
                              decoration: const BoxDecoration(
                                border: Border(
                                  left:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                              ),
                              child: const SizedBox(
                                width: 100,
                                child: Center(
                                  child: Text(
                                    'مبلغ التوصيل',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Text(
                              '${deliveryPrice.toString()} د.ع',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 8.0),
                      //order price
                      Container(
                        color: kPrimaryColor.withOpacity(0.45),
                        child: Row(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 3.0),
                              decoration: const BoxDecoration(
                                border: Border(
                                  left:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                              ),
                              child: const SizedBox(
                                width: 100,
                                child: Center(
                                  child: Text(
                                    'مبلغ الطلبية',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Text(
                              '${cartController.productsTotal.toString()} د.ع',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 8.0),
                      //total price
                      Container(
                        color: kPrimaryColor.withOpacity(0.45),
                        child: Row(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 3.0),
                              decoration: const BoxDecoration(
                                border: Border(
                                  left:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                              ),
                              child: const SizedBox(
                                width: 100,
                                child: Center(
                                  child: Text(
                                    'المبلغ الكلي',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Text(
                              '${sumPrice.toString()} د.ع',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          controller.insertToOrders({
                            'delivery_price': deliveryPrice.toString(),
                            'user_phone': phone,
                            'user_address': address,
                            'user_city': city,
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(vertical: 20.0),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 15.0),
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: const Center(
                            child: Text(
                              'تنفيذ الطلب',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
