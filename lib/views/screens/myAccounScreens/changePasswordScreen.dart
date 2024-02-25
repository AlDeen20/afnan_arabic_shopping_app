// ignore_for_file: file_names, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/controllers/changePasswordController.dart';
import 'package:shopping_app/views/widgets/backButton.dart';
import 'package:shopping_app/views/widgets/changePassword/passwordField.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    Get.put(ChangePasswordController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('تغيير كلمة المرور'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        leading: const BackButtonWidget(),
      ),
      body: GetBuilder<ChangePasswordController>(
        builder: (controller) => ModalProgressHUD(
          inAsyncCall: controller.inAsyncCall,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                        child: Text(
                      'تغيير كلمة المرور',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
                    const SizedBox(height: 20),
                    PasswordFieldChange(
                      text: 'ادخل كلمة المرور الجديدة',
                      textController: controller.passwordController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return ' كلمة المرور لايجب ان تكون فارغة';
                        } else if (value.trim().length < 4) {
                          return 'كلمة المرور يجب ان لاتقل عن 4 احرف';
                        }
                        return null;
                      },
                    ),
                    PasswordFieldChange(
                      text: 'تأكيد كلمة المرور',
                      textController: controller.confirmPasswordController,
                      validator: (value) {
                        if (value != controller.passwordController.text) {
                          return 'كلمة المرور غير متطابقة';
                        }
                        return null;
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          controller.updatePassword();
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 25),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Center(
                            child: Text(
                          'تعديل',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        )),
                      ),
                    ),
                    controller.msg != ''
                        ? Center(
                            child: Text(
                              controller.msg,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : const Text(''),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
