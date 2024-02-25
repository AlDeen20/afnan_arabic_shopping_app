// ignore_for_file: file_names

import 'package:shopping_app/appLinks.dart';
import 'package:shopping_app/class/crud.dart';

class OrderData {
  Crud crud;
  OrderData(this.crud);

  getData(String userID) async {
    var res = await crud.getData(AppLinks.orders + userID, {});
    return res.fold((l) => l, (r) => r);
  }

  deleteData(String orderID) async {
    var res = await crud.deleteData(AppLinks.ordersDelete + orderID, {});
    return res.fold((l) => l, (r) => r);
  }
}
