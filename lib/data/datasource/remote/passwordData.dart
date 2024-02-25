// ignore_for_file: file_names

import 'package:shopping_app/appLinks.dart';
import 'package:shopping_app/class/crud.dart';

class PasswordData {
  Crud crud;
  PasswordData(this.crud);

  updateData(String password, String userID) async {
    var res = await crud.updateData(AppLinks.updatePassword,
        {'userID': userID, 'password': password});
    return res.fold((l) => l, (r) => r);
  }
}
