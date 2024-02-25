// ignore_for_file: file_names

import 'package:shopping_app/class/statusRequest.dart';

handlingData(res) {
  if (res is StatusRequest) {
    return res;
  } else {
    return StatusRequest.success;
  }
}
