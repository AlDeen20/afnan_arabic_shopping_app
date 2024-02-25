// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app/appLinks.dart';
import 'package:shopping_app/main.dart';
import 'package:shopping_app/routes.dart';

class SignupController extends GetxController {
  bool isVisible = true;
  bool inAsyncCall = false;
  String errMsg = '';

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void isVisibleChanged(bool value) {
    isVisible = value;
    update();
  }

  Future signup() async {
    String endPoint = 'users/signup';
    String url = '${AppLinks.apiServer}/$endPoint';
    String name = nameController.text;
    String phone = phoneController.text;
    String password = passwordController.text;
    inAsyncCall = true;
    update();

    try {
      var res = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: json
              .encode({'name': name, 'phone': phone, 'password': password}));
      if (res.statusCode == 200) {
        final responseData = jsonDecode(res.body);
        final userData = responseData['newUser'];
        final token = responseData['token'];

        databox!.put('userData', {
          "name": userData['name'],
          "phone": userData['phone'],
          "userId": userData['id'],
          "token": token
        });
        inAsyncCall = false;
        Get.offAllNamed(AppRoutes.auth);

        update();
      } else if (res.statusCode == 404) {
        inAsyncCall = false;
        errMsg = res.body;
        clearController();
        update();
      } else {
        errMsg = res.body;
        inAsyncCall = false;
        clearController();
        update();
      }
    } catch (err) {
      inAsyncCall = false;
      errMsg = 'حدث خطأ ما';
      update();
    }
  }

  void clearController() {
    nameController.clear();
    phoneController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
