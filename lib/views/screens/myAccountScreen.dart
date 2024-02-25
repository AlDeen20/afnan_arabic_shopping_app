// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/main.dart';
import 'package:shopping_app/routes.dart';
import 'package:shopping_app/views/widgets/MyAccountActions.dart';
import 'package:shopping_app/views/widgets/myaccount/MyAccountButtons.dart';

class MyaccountScreen extends StatelessWidget {
  const MyaccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        toolbarHeight: 75.0,
        backgroundColor: kPrimaryColor,
        title: const Text('حسابي'),
        centerTitle: true,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: Column(
        children: [
          const MyAccountButtons(),
          const SizedBox(height: 60.0),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    MyAccountActions(
                      text: 'الشروط والاحكام',
                      icon: const Icon(
                        Icons.label_outline,
                        size: 18,
                        color: kPrimaryColor,
                      ),
                      onClick: () {
                        Get.toNamed(AppRoutes.conditions);
                      },
                    ),
                    // MyAccountActions(
                    //   text: 'سياسة الخصوصية',
                    //   icon: const Icon(
                    //     Icons.privacy_tip_outlined,
                    //     size: 18,
                    //     color: kPrimaryColor,
                    //   ),
                    //   onClick: () async {
                    //     final Uri url = Uri.parse(
                    //         'https://docs.google.com/document/d/e/2PACX-1vRyNSl2pCBuL4IYNutuUq8z_euj8z4TqgnNnd7d0jhmmDbF99yTXaf1j7-6UZU3JguRJVSzF6gKfCY1/pub');
                    //     if (!await launchUrl(
                    //       url,
                    //       mode: LaunchMode.externalApplication,
                    //     )) {
                    //       throw Exception('Could not launch $url');
                    //     }
                    //     // Get.toNamed(AppRoutes.privacy);
                    //   },
                    // ),
                    MyAccountActions(
                      text: 'الدعم',
                      icon: const Icon(
                        Icons.contact_support_outlined,
                        size: 18,
                        color: kPrimaryColor,
                      ),
                      onClick: () {
                        Get.toNamed(AppRoutes.support);
                      },
                    ),
                    MyAccountActions(
                      text: 'عن التطبيق',
                      icon: const Icon(
                        Icons.info_outline,
                        size: 18,
                        color: kPrimaryColor,
                      ),
                      onClick: () {
                        Get.toNamed(AppRoutes.about);
                      },
                    ),
                    MyAccountActions(
                      text: 'تغيير كلمة المرور',
                      icon: const Icon(
                        Icons.lock_clock_outlined,
                        size: 18,
                        color: kPrimaryColor,
                      ),
                      onClick: () {
                        Get.toNamed(AppRoutes.changepasword);
                      },
                    ),
                    MyAccountActions(
                      text: 'مشاركة التطبيق',
                      icon: const Icon(
                        Icons.share,
                        size: 18,
                        color: kPrimaryColor,
                      ),
                      onClick: () {
                        Get.toNamed(AppRoutes.share);
                      },
                    ),
                    MyAccountActions(
                      text: 'تسجيل خروج',
                      icon: const Icon(
                        Icons.logout,
                        size: 18,
                        color: kPrimaryColor,
                      ),
                      onClick: () async {
                        await cartBox!.clear();
                        await databox!.clear();
                        Get.offAllNamed(AppRoutes.auth);
                      },
                    ),
                    const Text(
                      'By Afnan',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    const SizedBox(height: 40.0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
