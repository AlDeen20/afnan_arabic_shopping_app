// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MyAccountButton extends StatelessWidget {
  const MyAccountButton({
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
        width: 65.0,
        height: 75.0,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            icon,
            Text(text),
          ],
        ),
      ),
    );
  }
}
