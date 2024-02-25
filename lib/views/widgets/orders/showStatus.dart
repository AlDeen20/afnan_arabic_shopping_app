// ignore_for_file: file_names

import 'package:flutter/material.dart';

Widget showOrderStatus(int orderStatus) {
  String orderStatusText = 'في  انتظار الموافقة';
  Color bgColor = Colors.orange;
  Color fontColor = Colors.black;

  if (orderStatus == 0) {
    orderStatusText = 'في  انتظار الموافقة';
    bgColor = Colors.orange;
    fontColor = Colors.white;
  }

  if (orderStatus == 1) {
    orderStatusText = 'في انتظار التوصيل';
    bgColor = Colors.blue;
    fontColor = Colors.white.withOpacity(0.9);
  }
  if (orderStatus == 2) {
    orderStatusText = 'تم التسليم';
    bgColor = Colors.green;
    fontColor = Colors.white.withOpacity(0.9);
  }

  return Container(
    margin: const EdgeInsets.only(top: 10.0),
    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: Text(
      orderStatusText,
      style: TextStyle(
        color: fontColor,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
