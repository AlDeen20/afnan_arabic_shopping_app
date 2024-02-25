// ignore_for_file: file_names

import 'package:shopping_app/appLinks.dart';
import 'package:shopping_app/class/crud.dart';

class ShareData {
  Crud crud;
  ShareData(this.crud);

  getData() async {
    var res = await crud.getData(AppLinks.share, {});
    return res.fold((l) => l, (r) => r);
  }
}
