// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app/appLinks.dart';
import 'package:shopping_app/main.dart';
import 'package:shopping_app/routes.dart';

class SigninController extends GetxController {
  String errMsg = '';
  bool inAsyncCall = false;
  bool isVisible = true;

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void isVisibleChanged(bool value) {
    isVisible = value;
    update();
  }

  Future signin() async {
    String endPoint = 'users/signin';
    String url = '${AppLinks.apiServer}/$endPoint';
    String phone = phoneController.text;
    String password = passwordController.text;
    inAsyncCall = true;
    update();

    try {
      var res = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: json.encode({'phone': phone, 'password': password}));
      if (res.statusCode == 200) {
        final responseData = jsonDecode(res.body);
        final userData = responseData['user'];
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
        inAsyncCall = false;
        errMsg = res.body;
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
    phoneController.clear();
    passwordController.clear();
  }
}
