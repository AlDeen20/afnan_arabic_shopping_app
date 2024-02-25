// ignore_for_file: file_names

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/routes.dart';
import 'package:shopping_app/views/widgets/TextFormFieldWidget.dart';
import 'package:shopping_app/controllers/signinController.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shopping_app/views/widgets/singin/passwordField.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SigninController());
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0.0,
        backgroundColor: Colors.white,
      ),
      body: GetBuilder<SigninController>(
        builder: (controller) => ModalProgressHUD(
          inAsyncCall: controller.inAsyncCall,
          progressIndicator: Center(
            child: Container(
              width: double.infinity,
              height: 80,
              color: Colors.white,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('أنتظر لحضة'),
                  CircularProgressIndicator(),
                ],
              ),
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            'images/logo.png',
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high,
                            width: 200,
                          ),
                        ),
                        const SizedBox(height: 40),
                        TextFormFieldWidget(
                          text: 'رقم الهاتف',
                          icon: const Icon(Icons.phone),
                          controller: controller.phoneController,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return 'رقم الهاتف لايجب ان يكون فارغا';
                            } else if (value.length < 11) {
                              return 'أدخل رقم هاتف صحيح';
                            }
                            return null;
                          },
                          textInputType: TextInputType.number,
                          maxLength: 11,
                        ),
                        PasswordFieldSignIn(
                          text: 'كلمة المرور',
                          textController: controller.passwordController,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return ' كلمة المرور لايجب ان تكون فارغة';
                            }
                            return null;
                          },
                        ),
                        controller.errMsg.isNotEmpty
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 8.0),
                                child: Text(
                                  controller.errMsg,
                                  style: const TextStyle(
                                      color: Colors.red,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            : const Text(''),
                        SizedBox(
                          width: double.infinity,
                          height: 50.0,
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                controller.signin();
                              } else {
                                controller.errMsg = '';
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kPrimaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            child: const Text('تسجيل الدخول',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: 'لا تمتلك حساب؟',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.75))),
                            TextSpan(
                                text: '  انشاء حساب',
                                style: const TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.offAllNamed(AppRoutes.siginup);
                                  }),
                          ])),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
