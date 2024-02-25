// ignore_for_file: file_names, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/class/handlingDataView.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/controllers/homeController.dart';
import 'package:shopping_app/routes.dart';
import 'package:shopping_app/views/widgets/home/lastProducts.dart';
import 'package:shopping_app/views/widgets/home/search.dart';
import 'package:shopping_app/views/widgets/home/shoopingBadge.dart';
import 'package:shopping_app/views/widgets/home/slider.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'images/logo.png',
          height: 55,
        ),
        actions: const [
          SearchHomePage(),
          ShoopingBadge(),
        ],
      ),
      body: GetBuilder<HomeController>(builder: (controller) {
        return RefreshIndicator(
          onRefresh: () async {
            controller.refresh();
            controller.onInit();
          },
          child: ListView(children: [
            const SliderHome(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'الفئات',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            width: 25,
                            height: 3,
                            color: kPrimaryColor,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.categories.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              AppRoutes.subcategories,
                              arguments: {
                                'categoryID': controller.categories[index]['id']
                              },
                            );
                          },
                          child: Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5.0),
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            child: Text(
                              controller.categories[index]['title'].toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const LastProducts(),
                  ],
                ),
              ),
            ),
          ]),
        );
      }),
    );
  }
}
