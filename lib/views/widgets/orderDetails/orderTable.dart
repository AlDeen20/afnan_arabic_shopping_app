// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/class/handlingDataView.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/controllers/ordersDetailsController.dart';

class OrderTable extends StatelessWidget {
  const OrderTable({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersDetailsController());
    return GetBuilder<OrdersDetailsController>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: Column(
          children: [
            const Row(
              children: [
                Icon(
                  Icons.circle,
                  size: 15,
                  color: kPrimaryColor,
                ),
                SizedBox(width: 5),
                Text(
                  'المنتجات',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Table(
              border: TableBorder.all(),
              children: [
                TableRow(
                  children: [
                    TableCell(
                      child: Container(
                        color: kPrimaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: const Center(
                            child: Text(
                          'الاسم',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        color: kPrimaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: const Center(
                            child: Text(
                          'السعر',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        color: kPrimaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: const Center(
                            child: Text(
                          'الكمية',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        color: kPrimaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: const Center(
                            child: Text(
                          'السعر الاجمالي',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
                for (int index = 0; index < controller.products.length; index++)
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          child: Center(
                              child: Text(
                                  controller.productsTitle[index]['title'])),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          child: Center(
                              child: Text(
                                  controller.products[index]['product_price'])),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          child: Center(
                              child:
                                  Text(controller.products[index]['amount'])),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          child: Center(
                            child: Text((int.parse(
                                        controller.products[index]['amount']) *
                                    int.parse(controller.products[index]
                                        ['product_price']))
                                .toString()),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
