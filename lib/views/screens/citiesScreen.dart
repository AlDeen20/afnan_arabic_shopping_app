// ignore_for_file: invalid_use_of_protected_member, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/class/handlingDataView.dart';
import 'package:shopping_app/controllers/CitiesController.dart';
import 'package:shopping_app/views/widgets/backButton.dart';
import 'package:shopping_app/views/widgets/cities/citiesButton.dart';

class CitiesScreen extends StatelessWidget {
  const CitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CitiesController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('المدينة والعنوان'),
        titleTextStyle: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        centerTitle: true,
        leading: const BackButtonWidget(),
      ),
      body: GetBuilder<CitiesController>(builder: (controller) {
        return RefreshIndicator(
          onRefresh: () async {
            controller.onInit();
            controller.refresh();
          },
          child: ListView(
            children: [
              HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: controller.cititesMapData.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 20.0),
                        child: Form(
                            key: controller.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('رقم الهاتف'),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: TextFormField(
                                    controller: controller.phoneController,
                                    decoration: const InputDecoration(
                                      hintText: 'ادخل رقم الهاتف',
                                      border: InputBorder.none,
                                    ),
                                    keyboardType: TextInputType.number,
                                    maxLength: 11,
                                    validator: (value) {
                                      if (value!.trim().isEmpty) {
                                        return 'رقم الهاتف لايجب ان يكون فارغا';
                                      } else if (value.length < 11) {
                                        return 'أدخل رقم هاتف صحيح';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const Text('العنوان الكامل'),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: TextFormField(
                                    controller: controller.addressController,
                                    decoration: const InputDecoration(
                                      hintText: 'ادخل العنوان الكامل ',
                                      border: InputBorder.none,
                                    ),
                                    validator: (value) {
                                      if (value!.trim().isEmpty) {
                                        return ' العنوان لايجب ان يكون فارغا';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const Text('المدينة'),
                                const SizedBox(height: 10.0),
                                DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.grey[300],
                                      border: InputBorder.none,
                                    ),
                                    dropdownColor: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(5.0),
                                    value: controller.cititesMapData[0]
                                            ['city_name']
                                        .toString(),
                                    onChanged: (String? newValue) {
                                      controller.updateCity(newValue!);
                                    },
                                    menuMaxHeight: 200,
                                    items: [
                                      for (int index = 0;
                                          index <
                                              controller.cititesMapData.length;
                                          index++)
                                        DropdownMenuItem(
                                            value: controller
                                                .cititesMapData[index]
                                                    ['city_name']
                                                .toString(),
                                            onTap: () {
                                              controller.updateDeliveryPrice(
                                                  int.parse(controller
                                                      .cititesMapData[index]
                                                          ['delivery_price']
                                                      .toString()));
                                            },
                                            child: Text(controller
                                                .cititesMapData[index]
                                                    ['city_name']
                                                .toString())),
                                    ]),
                                CitiesButton(
                                  city: controller.city,
                                  deliveryPrice: controller.deliveryPrice,
                                ),
                              ],
                            )),
                      )
                    : const Text(''),
              ),
            ],
          ),
        );
      }),
    );
  }
}
