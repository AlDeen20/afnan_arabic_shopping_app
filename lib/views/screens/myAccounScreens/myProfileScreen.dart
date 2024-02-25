// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/controllers/myProfileController.dart';
import 'package:shopping_app/views/widgets/backButton.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyProfileController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('البروفايل الشخصي'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        leading: const BackButtonWidget(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: GetBuilder<MyProfileController>(
            builder: (controller) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: kPrimaryColor.withOpacity(0.5),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                    minLeadingWidth: 0.0,
                    horizontalTitleGap: 8.0,
                    leading: const Icon(
                      Icons.person_2,
                      size: 20,
                    ),
                    title: const Text(
                      'الاسم الكامل',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      controller.fullName,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 20,
                    ),
                  ),
                ),
                Container(
                  color: kPrimaryColor.withOpacity(0.5),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                    minLeadingWidth: 0.0,
                    horizontalTitleGap: 8.0,
                    leading: const Icon(
                      Icons.phone,
                      size: 20,
                    ),
                    title: const Text(
                      'رقم الهاتف',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      controller.phone,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
