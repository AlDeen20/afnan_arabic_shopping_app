// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/class/statusRequest.dart';
import 'package:shopping_app/data/datasource/remote/passwordData.dart';
import 'package:shopping_app/functions/handlingData.dart';
import 'package:shopping_app/main.dart';

class ChangePasswordController extends GetxController {
  bool isVisible = true;
  bool inAsyncCall = false;
  String msg = '';
  late StatusRequest statusRequest;
  PasswordData passwordData = PasswordData(Get.find());
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void isVisibleChanged(bool value) {
    isVisible = value;
    update();
  }

  Future<void> updatePassword() async {
    inAsyncCall = true;
    update();
    statusRequest = StatusRequest.loading;
    final userData = await databox!.get("userData");
    var res = await passwordData.updateData(
        passwordController.text.toString(), userData['userId'].toString());
    statusRequest = handlingData(res);
    if (StatusRequest.success == statusRequest) {
      if (res['status'] == "success") {
        msg = 'تم تحديث كلمة المرور بنجاح';
        inAsyncCall = false;
        update();
      } else {
        msg = 'حدث خطأ ما';
        inAsyncCall = false;
        update();
        statusRequest = StatusRequest.failure;
      }
    }
  }

  //   Future<void> updatePassword() async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var res = await passwordData.updateData(passwordController.text.toString());
  //   statusRequest = handlingData(res);
  //   onInit();
  //   refresh();
  // }
}
