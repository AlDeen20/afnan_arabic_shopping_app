// ignore_for_file: file_names

import 'package:shopping_app/appLinks.dart';
import 'package:shopping_app/class/crud.dart';

class OrderProducts {
  Crud crud;
  OrderProducts(this.crud);

  getData(String orderID) async {
    var res = await crud.getData(AppLinks.orderProducts + orderID, {});
    return res.fold((l) => l, (r) => r);
  }
}
