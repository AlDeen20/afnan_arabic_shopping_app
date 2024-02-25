// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:shopping_app/class/statusRequest.dart';
import 'package:shopping_app/data/datasource/remote/shareData.dart';
import 'package:shopping_app/functions/handlingData.dart';

class ShareController extends GetxController {
  ShareData shareData = ShareData(Get.find());
  List data = [];
  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var res = await shareData.getData();
    statusRequest = handlingData(res);
    if (StatusRequest.success == statusRequest) {
      if (res['status'] == "success") {
        data.addAll(res['data']);
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
