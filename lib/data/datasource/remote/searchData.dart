// ignore_for_file: file_names

import 'package:shopping_app/appLinks.dart';
import 'package:shopping_app/class/crud.dart';

class SearchData {
  Crud crud;
  SearchData(this.crud);

  getData() async {
    var res = await crud.getData(AppLinks.search, {});
    return res.fold((l) => l, (r) => r);
  }
}
