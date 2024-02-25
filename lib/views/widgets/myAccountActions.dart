// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MyAccountActions extends StatelessWidget {
  const MyAccountActions({
    super.key,
    required this.text,
    required this.onClick,
    required this.icon,
  });
  final String text;
  final Function() onClick;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: double.infinity,
        height: 40.0,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        margin: const EdgeInsets.only(bottom: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 10.0),
            Text(text),
            const Spacer(),
            Icon(
              Icons.arrow_back_ios_new,
              size: 18,
              color: Colors.grey.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }
}
