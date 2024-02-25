// ignore_for_file: file_names

import 'package:shopping_app/appLinks.dart';
import 'package:shopping_app/class/crud.dart';

class SubcategoriesData {
  Crud crud;
  SubcategoriesData(this.crud);

  getData(int categoryID) async {
    var res = await crud
        .getData(AppLinks.subcategoriesUrl + categoryID.toString(), {});
    return res.fold((l) => l, (r) => r);
  }
}
