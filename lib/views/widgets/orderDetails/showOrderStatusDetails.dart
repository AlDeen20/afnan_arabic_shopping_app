// ignore_for_file: file_names

import 'package:flutter/material.dart';

Widget showOrderStatusDetails(int orderStatus) {
  String orderStatusText = 'في  انتظار الموافقة';
  Color fontColor = Colors.black;

  if (orderStatus == 0) {
    orderStatusText = 'قيد الانتظار';
    fontColor = Colors.blue;
  }

  if (orderStatus == 1) {
    orderStatusText = 'في انتظار التوصيل';
    fontColor = Colors.orange;
  }
  if (orderStatus == 2) {
    orderStatusText = 'تم التوصيل';
    fontColor = Colors.green;
  }

  return Text(
    orderStatusText,
    style: TextStyle(
      color: fontColor,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
  );
}
