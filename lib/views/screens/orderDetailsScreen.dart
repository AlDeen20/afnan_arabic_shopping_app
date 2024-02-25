// ignore_for_file: file_names, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/controllers/ordersDetailsController.dart';
import 'package:shopping_app/views/widgets/backButton.dart';
import 'package:shopping_app/views/widgets/orderDetails/orderTable.dart';
import 'package:shopping_app/views/widgets/orderDetails/orderTracking.dart';
import 'package:shopping_app/views/widgets/orderDetails/showOrderStatusDetails.dart';

class OrderDetailsScreen extends GetView<OrdersDetailsController> {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int orderNumber = Get.arguments['orderNumber'];
    final int orderStatus = Get.arguments['orderStatus'];
    final String orderAddress = Get.arguments['orderAddress'];
    final int totalPrice = Get.arguments['totalPrice'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('رقم الطلب ${orderNumber.toString()}'),
        titleTextStyle: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        centerTitle: true,
        leading: const BackButtonWidget(),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.onInit();
          controller.refresh();
        },
        child: ListView(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // toatal price
                  Container(
                    color: kPrimaryColor.withOpacity(0.3),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 3.0),
                          decoration: const BoxDecoration(
                            border: Border(
                              left: BorderSide(color: Colors.white, width: 2),
                            ),
                          ),
                          child: const SizedBox(
                            width: 100,
                            child: Center(
                              child: Text(
                                'السعر الاجمالي',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Text(
                          '${totalPrice.toString()}  دينار عراقي',
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
                    color: kPrimaryColor.withOpacity(0.3),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 3.0),
                          decoration: const BoxDecoration(
                            border: Border(
                              left: BorderSide(color: Colors.white, width: 2),
                            ),
                          ),
                          child: const SizedBox(
                            width: 100,
                            child: Center(
                              child: Text(
                                'عنوان التوصيل',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Text(
                          orderAddress,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  // order status
                  Container(
                    color: kPrimaryColor.withOpacity(0.3),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 3.0),
                          decoration: const BoxDecoration(
                            border: Border(
                              left: BorderSide(color: Colors.white, width: 2),
                            ),
                          ),
                          child: const SizedBox(
                            width: 100,
                            child: Center(
                              child: Text(
                                'حالة الطلب',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        showOrderStatusDetails(orderStatus),
                      ],
                    ),
                  ),
                  OrderTracking(orderStatus: orderStatus),
                  const OrderTable(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
