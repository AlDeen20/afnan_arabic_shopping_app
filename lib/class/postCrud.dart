// ignore_for_file: file_names

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shopping_app/class/statusRequest.dart';
import 'package:shopping_app/functions/checkInternet.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app/main.dart';

class PostCrud {
  Future<Either<StatusRequest, Map>> getData(String url, Map data) async {
    try {
      if (await checkInternet()) {
        final userData = databox!.get("userData");
        String authToken = userData['token'];
        Map<String, String> headers = {
          'Content-Type': 'application/json',
          'authorization': authToken,
        };

        var res = await http.post(
          Uri.parse(url),
          headers: headers,
          body: json.encode({'product_ids': data['product_ids']}),
        );
        if (res.statusCode == 200) {
          Map responseBody = jsonDecode(res.body);
          return right(responseBody);
        } else {
          return left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      return left(StatusRequest.serverFailure);
    }
  }
}
