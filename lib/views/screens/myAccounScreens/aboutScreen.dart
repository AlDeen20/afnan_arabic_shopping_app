// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/views/widgets/backButton.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('عن التطبيق'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        leading: const BackButtonWidget(),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
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
                  'تطبيق عراقي يهدف الى الوصول الى جميع العملاء في كل انحاء العراق',
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
                  'نتميز في التوصيل الى كافة مناطق العراق',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
