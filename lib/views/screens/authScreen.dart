// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shopping_app/index.dart';
import 'package:shopping_app/main.dart';
import 'package:shopping_app/views/screens/onBoardingScreen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return databox!.get("userData") != null
        ? const IndexScreen()
        : const OnBoardingScreen();
  }
}
