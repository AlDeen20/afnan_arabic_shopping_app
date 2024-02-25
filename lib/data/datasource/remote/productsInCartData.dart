// ignore_for_file: file_names

import 'package:shopping_app/appLinks.dart';
import 'package:shopping_app/class/postCrud.dart';

class ProductsInCartData {
  PostCrud postCrud;
  ProductsInCartData(this.postCrud);

  getData(List productIds) async {
    var res = await postCrud
        .getData(AppLinks.productsInCart, {'product_ids': productIds});
    return res.fold((l) => l, (r) => r);
  }
}
