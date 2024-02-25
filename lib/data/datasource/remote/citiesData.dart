// ignore_for_file: file_names

import 'package:shopping_app/appLinks.dart';
import 'package:shopping_app/class/crud.dart';

class CitiesData {
  Crud crud;
  CitiesData(this.crud);

  getData() async {
    var res = await crud.getData(AppLinks.cities, {});
    return res.fold((l) => l, (r) => r);
  }
}
