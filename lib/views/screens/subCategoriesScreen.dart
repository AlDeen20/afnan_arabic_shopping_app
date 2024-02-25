// ignore_for_file: file_names, invalid_use_of_protected_member

import 'package:lottie/lottie.dart';
import 'package:shopping_app/class/handlingDataView.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/controllers/subCategoriesController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/views/widgets/backButton.dart';
import 'package:shopping_app/views/widgets/products/productContainer.dart';
import 'package:shopping_app/views/widgets/subCategories/categoryItem.dart';

class SubCategoriesScreen extends GetView<SubCategoriesController> {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SubCategoriesController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButtonWidget(),
          title: const Text('الأقسام'),
          titleTextStyle: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          centerTitle: true,
          toolbarHeight: 40.0,
        ),
        body: GetBuilder<SubCategoriesController>(
          builder: (controller) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: RefreshIndicator(
              onRefresh: () async {
                controller.onInit();
                controller.refresh();
              },
              child: ListView(
                children: [
                  HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: controller.data.isNotEmpty
                        ? Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Wrap(
                                    spacing: 10.0,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          controller.updateSubcategoryID(0);
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              bottom: 10.0),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 5.0),
                                          decoration: BoxDecoration(
                                              color: controller.subcateID == 0
                                                  ? Colors.grey
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.grey)),
                                          child: const Text(
                                            'عرض الكل',
                                            style: TextStyle(fontSize: 14.0),
                                          ),
                                        ),
                                      ),
                                      for (int index = 0;
                                          index < controller.data.length;
                                          index++)
                                        CategoryItem(index),
                                    ],
                                  ),
                                ),
                                const ProductContainer(),
                              ],
                            ),
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
        ),
      ),
    );
  }
}
