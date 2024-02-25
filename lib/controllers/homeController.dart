// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:shopping_app/appLinks.dart';
import 'package:shopping_app/class/statusRequest.dart';
import 'package:shopping_app/data/datasource/remote/homeData.dart';
import 'package:shopping_app/functions/handlingData.dart';
import 'package:shopping_app/model/products_model.dart';

class HomeController extends GetxController {
  List categories = [];
  List<ProductsModel> products = [];
  List productImagesInHome = [];
  late StatusRequest statusRequest;
  HomeData homeData = HomeData(Get.find());

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    categories.clear();
    products.clear();
    productImagesInHome.clear();
    statusRequest = StatusRequest.loading;
    var res = await homeData.getData();
    statusRequest = handlingData(res);
    if (StatusRequest.success == statusRequest) {
      if (res['status'] == "success") {
        categories.addAll(res['categories']);
        final List<dynamic> productsList = res['products'];
        products.addAll(productsList
            .map((product) => ProductsModel.fromJson(product))
            .toList());
        productImagesInHome.addAll(res['images']);
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
}
