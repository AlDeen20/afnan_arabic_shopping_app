// ignore_for_file: file_names, invalid_use_of_protected_member

import 'package:shopping_app/appLinks.dart';
import 'package:shopping_app/class/handlingDataView.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/controllers/categoriesController.dart';
import 'package:shopping_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/views/widgets/backButton.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesController);
    return Scaffold(
      appBar: AppBar(
        leading:
            Get.currentRoute == '/categories' ? const BackButtonWidget() : null,
        title: const Text(
          'الفئات',
        ),
        titleTextStyle: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        centerTitle: true,
        toolbarHeight: 40.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
        child: GetBuilder<CategoriesController>(
          builder: (controller) => RefreshIndicator(
            onRefresh: () async {
              controller.refresh();
              controller.onInit();
            },
            child: ListView(
              children: [
                HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.data.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15.0,
                        mainAxisSpacing: 15.0,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.toNamed(
                              AppRoutes.subcategories,
                              arguments: {
                                'categoryID': controller.data[index]['id']
                              },
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: kSecondaryColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10.0)),
                              image: DecorationImage(
                                image: NetworkImage(
                                    '${AppLinks.categoriesImageUrl}/${controller.data[index]['imageUrl']}'),
                                fit: BoxFit.fill,
                                opacity: 0.75,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Text(
                                controller.data[index]['title'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
