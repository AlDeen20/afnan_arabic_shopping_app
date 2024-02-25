// ignore_for_file: file_names

import 'package:shopping_app/appLinks.dart';
import 'package:shopping_app/class/crud.dart';

class ProductDetailsData {
  Crud crud;
  ProductDetailsData(this.crud);

  getData(int productID) async {
    var res =
        await crud.getData(AppLinks.productDetails + productID.toString(), {});
    return res.fold((l) => l, (r) => r);
  }
}
