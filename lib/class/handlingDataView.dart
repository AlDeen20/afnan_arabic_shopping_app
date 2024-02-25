// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping_app/class/statusRequest.dart';
import 'package:shopping_app/constants.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataView({
    Key? key,
    required this.statusRequest,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buildStatusWidget(),
    );
  }

  Widget _buildStatusWidget() {
    switch (statusRequest) {
      case StatusRequest.loading:
        return _loadingWidget();
      case StatusRequest.offlineFailure:
        return const Text("غير متصل في الانترنت");
      case StatusRequest.serverFailure:
        return const Text("خطأ الاتصال في السيرفر");
      case StatusRequest.failure:
        return const Text("لاتوجد بيانات");
      default:
        return widget;
    }
  }

  Widget _loadingWidget() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          child: ColorFiltered(
            colorFilter: const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
            child: Lottie.asset('images/animation_lneljy6l.json'),
          ),
        ),
        const Positioned(
          top: 55,
          child: Text(
            'يتم التحميل...',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF7C7C7C),
            ),
          ),
        ),
      ],
    );
  }
}
