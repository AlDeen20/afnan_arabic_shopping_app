// ignore_for_file: file_names

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app/appLinks.dart';
import 'package:shopping_app/model/products_model.dart';

class ProductsController extends GetxController {
  RxInt subcateid = 0.obs;

  Future<List> getData() async {
    String endPoint = 'products?subcategory_id=$subcateid';
    String url = '${AppLinks.apiServer}/$endPoint';
    var res = await http.get(Uri.parse(url));
    List resBody = jsonDecode(res.body);
    final List<dynamic> productsList = resBody;
    return productsList
        .map((product) => ProductsModel.fromJson(product))
        .toList();
  }

  Future<String> getProductImage(int productID) async {
    String endPoint = 'images/specific?product_id=$productID';
    String url = '${AppLinks.apiServer}/$endPoint';
    var res = await http.get(Uri.parse(url));
    final resBodyImages = json.decode(res.body);
    String imageUrl = AppLinks.productImageUrl + resBodyImages[0]['imageUrl'];
    return imageUrl;
  }
}
