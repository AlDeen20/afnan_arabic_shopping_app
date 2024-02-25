// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/controllers/signinController.dart';

class PasswordFieldSignIn extends StatelessWidget {
  final String text;
  final TextEditingController textController;
  final String? Function(String?)? validator;

  const PasswordFieldSignIn({
    super.key,
    required this.text,
    required this.textController,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SigninController>(
      builder: (controller) => Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextFormField(
          controller: textController,
          validator: validator,
          obscureText: controller.isVisible,
          decoration: InputDecoration(
            hintText: text,
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: controller.isVisible
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
              onPressed: () {
                controller.isVisibleChanged(!controller.isVisible);
              },
            ),
            prefixIconColor: const Color(0xFF000000),
          ),
        ),
      ),
    );
  }
}
