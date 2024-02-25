// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:shopping_app/appLinks.dart';
import 'package:shopping_app/class/statusRequest.dart';
import 'package:shopping_app/data/datasource/remote/subcategoriesData.dart';
import 'package:shopping_app/functions/handlingData.dart';
import 'package:shopping_app/model/products_model.dart';

class SubCategoriesController extends GetxController {
  SubcategoriesData subcategoriesData = SubcategoriesData(Get.find());
  List data = [];
  List<ProductsModel> products = [];
  List productsImages = [];
  late StatusRequest statusRequest;
  int categoryID = Get.arguments['categoryID'];
  int subcateID = 0;

  updateSubcategoryID(int id) {
    subcateID = id;
    update();
  }

  Future<void> getData() async {
    statusRequest = StatusRequest.loading;
    var res = await subcategoriesData.getData(categoryID);
    products.clear();
    statusRequest = handlingData(res);
    if (StatusRequest.success == statusRequest) {
      if (res['status'] == "success") {
        data = res['data'];
        productsImages = res['images'];
        final List<dynamic> productsList = res['products'];
        products.addAll(productsList
            .map((product) => ProductsModel.fromJson(product))
            .toList());
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  List<ProductsModel> get showProducts {
    if (subcateID == 0) {
      return products;
    } else {
      return products
          .where((product) => product.subcategoryId == subcateID)
          .toList();
    }
  }

  String showProductImage(int productID) {
    List productImages = productsImages
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
