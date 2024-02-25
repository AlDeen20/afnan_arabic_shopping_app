// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/controllers/onBoardingController.dart';
import 'package:shopping_app/routes.dart';
import 'package:shopping_app/views/widgets/onBoarding/customButton.dart';
import 'package:shopping_app/views/widgets/onBoarding/customDotsController.dart';
import 'package:shopping_app/views/widgets/onBoarding/customSlider.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0.0,
        toolbarHeight: 40.0,
        actions: [
          GestureDetector(
            onTap: () => Get.offNamed(AppRoutes.siginin),
            child: const Row(
              children: [
                Text(
                  'تخطي',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Icon(
                  Icons.keyboard_double_arrow_left,
                  color: Colors.white,
                )
              ],
            ),
          ),
          const SizedBox(width: 10.0),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: Column(
          children: [
            Expanded(
              child: CustomSliderOnBoarding(),
            ),
            Column(
              children: [
                CustomDotsControllerOnBoarding(),
                CustomButtonOnBoarding(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
