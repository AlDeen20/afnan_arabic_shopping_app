// ignore_for_file: invalid_use_of_protected_member, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping_app/class/handlingDataView.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/controllers/MyOrdersController.dart';
import 'package:shopping_app/routes.dart';
import 'package:shopping_app/views/widgets/backButton.dart';
import 'package:shopping_app/views/widgets/orders/showStatus.dart';
import 'package:timeago/timeago.dart' as timeago;

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyOrdersController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('طلباتي'),
        titleTextStyle: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        centerTitle: true,
        leading: const BackButtonWidget(),
      ),
      body: GetBuilder<MyOrdersController>(
        builder: (controller) => RefreshIndicator(
          onRefresh: () async {
            controller.onInit();
            controller.refresh();
          },
          child: ListView(
            children: [
              HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: controller.orders.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 20.0),
                        child: ListView.builder(
                            itemCount: controller.orders.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              DateTime dateTime = DateTime.parse(
                                  controller.orders[index]['createdAt']);
                              String timeAgo =
                                  timeago.format(dateTime, locale: 'ar');

                              return GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.orderdetails,
                                      arguments: {
                                        'orderID': controller.orders[index]
                                            ['id'],
                                        'orderNumber': index + 1,
                                        'orderStatus': int.parse(controller
                                            .orders[index]['order_status']),
                                        'orderAddress':
                                            '${controller.orders[index]['user_city']} / ${controller.orders[index]['user_address']}',
                                        'totalPrice': int.parse(controller
                                            .orders[index]['order_price']
                                            .toString())
                                      });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 15.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.15),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: const Offset(0, -2),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 5.0),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'طلب رقم ${index + 1} ',
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(height: 10.0),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.access_time,
                                                  size: 15,
                                                  color: Colors.grey,
                                                ),
                                                const SizedBox(width: 5.0),
                                                Text(
                                                  timeAgo,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey,
                                                  ),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            showOrderStatus(int.parse(
                                                controller.orders[index]
                                                    ['order_status'])),
                                            int.parse(controller.orders[index]
                                                        ['order_status']) ==
                                                    0
                                                ? GestureDetector(
                                                    onTap: () {
                                                      controller.deleteOrder(
                                                          controller
                                                              .orders[index]
                                                                  ['id']
                                                              .toString());
                                                    },
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              top: 10.0),
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 5.0,
                                                          horizontal: 10.0),
                                                      decoration: BoxDecoration(
                                                        color: Colors.red,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                      child: const Text(
                                                        'الغاء الطلب',
                                                        style: TextStyle(
                                                          color: Colors.white70,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : const Text(''),
                                            const SizedBox(height: 10.0),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )
                    : Center(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height - 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Lottie.asset('images/1.json', width: 200),
                              const SizedBox(height: 10),
                              const Text(
                                'لاتوجد بيانات',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
