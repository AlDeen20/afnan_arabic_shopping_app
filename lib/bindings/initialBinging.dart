// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:shopping_app/class/crud.dart';
import 'package:shopping_app/class/postCrud.dart';
import 'package:shopping_app/controllers/cartController.dart';
import 'package:shopping_app/controllers/categoriesController.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PostCrud());
    Get.lazyPut(() => Crud(), fenix: true);
    Get.lazyPut(() => CartController(), fenix: true);
    Get.lazyPut(() => CategoriesController(), fenix: true);
  }
}
