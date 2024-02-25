// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/class/statusRequest.dart';
import 'package:shopping_app/data/datasource/remote/citiesData.dart';
import 'package:shopping_app/functions/handlingData.dart';

class CitiesController extends GetxController {
  List cititesMapData = [];
  String city = '';
  int deliveryPrice = 0;
  late StatusRequest statusRequest;
  CitiesData citiesData = CitiesData(Get.find());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  getCities() async {
    statusRequest = StatusRequest.loading;
    var res = await citiesData.getData();
    statusRequest = handlingData(res);
    if (StatusRequest.success == statusRequest) {
      if (res['status'] == "success") {
        cititesMapData = res['data'];
        city = res['data'][0]['city_name'];
        deliveryPrice = int.parse(res['data'][0]['delivery_price'].toString());
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  void updateCity(String val) {
    city = val;
    update();
  }

  void updateDeliveryPrice(int val) {
    deliveryPrice = val;
    update();
  }

  @override
  void onInit() {
    getCities();
    super.onInit();
  }
}
