// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:shopping_app/appLinks.dart';
import 'package:shopping_app/class/statusRequest.dart';
import 'package:shopping_app/data/datasource/remote/searchData.dart';
import 'package:shopping_app/functions/handlingData.dart';
import 'package:shopping_app/model/products_model.dart';

class CustomSearchController extends GetxController {
  List<ProductsModel> products = [];
  List productImagesInHome = [];
  late StatusRequest statusRequest;
  SearchData searchData = SearchData(Get.find());

  Future<void> getData() async {
    statusRequest = StatusRequest.loading;
    var res = await searchData.getData();
    statusRequest = handlingData(res);
    if (StatusRequest.success == statusRequest) {
      if (res['status'] == "success") {
        final List<dynamic> productsList = res['products'];
        products.addAll(productsList
            .map((product) => ProductsModel.fromJson(product))
            .toList());
        productImagesInHome = res['images'];
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  String showProductImage(int productID) {
    List productImages = productImagesInHome
        .where((image) => image['product_id'] == productID)
        .toList();
    String imageUrl = AppLinks.productImageUrl + productImages[0]['imageUrl'];
    return imageUrl;
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
