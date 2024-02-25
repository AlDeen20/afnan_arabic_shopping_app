// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shopping_app/constants.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String text;
  final Icon icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType textInputType;
  final int maxLength;


  const TextFormFieldWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.controller,
    required this.validator,
    required this.textInputType,
    required this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        controller: controller,
        maxLength: maxLength,
        validator: validator,
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintText: text,
          border: InputBorder.none,
          prefixIcon: icon,
          prefixIconColor: const Color(0xFF000000),
        ),
      ),
    );
  }
}
