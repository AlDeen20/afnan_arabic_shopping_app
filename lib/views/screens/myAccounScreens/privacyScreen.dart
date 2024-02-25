// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/views/widgets/backButton.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('سياسة الخصوصية'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        leading: const BackButtonWidget(),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(0),
              minLeadingWidth: 0.0,
              horizontalTitleGap: 8.0,
              leading: Icon(
                Icons.circle,
                size: 15,
                color: kPrimaryColor,
              ),
              title: Text(
                'جميع المعلومات الخاصة بك مؤمنة',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              minLeadingWidth: 0.0,
              horizontalTitleGap: 8.0,
              leading: Icon(
                Icons.circle,
                size: 15,
                color: kPrimaryColor,
              ),
              title: Text(
                'بمجرد تسجيلك سوف يتم حفظ معلومات التسجيل لدينا',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              minLeadingWidth: 0.0,
              horizontalTitleGap: 8.0,
              leading: Icon(
                Icons.circle,
                size: 15,
                color: kPrimaryColor,
              ),
              title: Text(
                'لايتم مشاركة اي معلومات خاصة بك مع طرف ثالث',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
