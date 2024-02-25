// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:shopping_app/main.dart';

class MyProfileController extends GetxController {
  String fullName = '';
  String phone = '';

  void getData() {
    if (databox!.get("userData") != null) {
      final userData = databox!.get("userData");
      fullName = userData['name'];
      phone = userData['phone'];
      update();
    }
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
