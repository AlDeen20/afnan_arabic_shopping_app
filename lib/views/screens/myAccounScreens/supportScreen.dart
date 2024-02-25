// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/views/widgets/backButton.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الدعم'),
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
                  'اذا كان لديك استفسار او طلب الدعم يمكنك الاتصال على الرقم',
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
                  '07707625432',
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
