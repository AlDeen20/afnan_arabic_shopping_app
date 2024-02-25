// ignore_for_file: file_names

import 'dart:io';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shopping_app/class/handlingDataView.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/controllers/shareControler.dart';
import 'package:shopping_app/views/widgets/backButton.dart';
// import 'package:share_plus/share_plus.dart';

class ShareScreen extends StatelessWidget {
  const ShareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ShareController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('مشاركة التطبيق'),
        titleTextStyle: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        centerTitle: true,
        leading: const BackButtonWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<ShareController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: controller.data.isNotEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BarcodeWidget(
                        color: kPrimaryColor,
                        width: MediaQuery.of(context).size.width * 0.65,
                        height: MediaQuery.of(context).size.width * 0.65,
                        data: Platform.isAndroid
                            ? controller.data[0]['link']
                            : controller.data[1]['link'],
                        barcode: Barcode.qrCode(),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'AFNAN MALL',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // GestureDetector(
                          //   onTap: () {
                          //     // Share.share('www.afnanmall.cloud');
                          //     Clipboard.setData(
                          //       ClipboardData(
                          //           text: Platform.isAndroid
                          //               ? controller.data[0]['link']
                          //               : controller.data[1]['link']),
                          //     );
                          //     Get.snackbar(
                          //       '',
                          //       '',
                          //       titleText: const Text(
                          //         'تنبية',
                          //         style: TextStyle(
                          //           fontSize: 16,
                          //           fontWeight: FontWeight.bold,
                          //           color: Colors.white,
                          //         ),
                          //       ),
                          //       messageText: const Text(
                          //         'تم نسخ الرابط بنجاح',
                          //         style: TextStyle(
                          //           fontSize: 14,
                          //           color: Colors.white,
                          //         ),
                          //       ),
                          //       backgroundColor: kPrimaryColor,
                          //       snackPosition: SnackPosition.BOTTOM,
                          //     );
                          //   },
                          //   child: Container(
                          //     padding: const EdgeInsets.symmetric(
                          //         vertical: 10, horizontal: 10),
                          //     decoration: BoxDecoration(
                          //       color: kPrimaryColor,
                          //       borderRadius: BorderRadius.circular(4),
                          //     ),
                          //     child: const Text(
                          //       'مشاركة رابط التطبيق',
                          //       style: TextStyle(
                          //         color: Colors.white,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              Clipboard.setData(
                                ClipboardData(
                                    text: Platform.isAndroid
                                        ? controller.data[0]['link']
                                        : controller.data[1]['link']),
                              );

                              Get.snackbar(
                                '',
                                '',
                                titleText: const Text(
                                  'تنبية',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                messageText: const Text(
                                  'تم نسخ الرابط بنجاح',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                                backgroundColor: kPrimaryColor,
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text(
                                'نسخ رابط التطبيق',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : const Text(''),
          ),
        ),
      ),
    );
  }
}
