// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/appLinks.dart';
import 'package:shopping_app/controllers/productDetailsController.dart';
import 'package:shopping_app/views/widgets/productDetails/imgaesDots.dart';

class ProductImages extends GetView<ProductDetailsController> {
  const ProductImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: controller.productsImages.map((item) {
            return Container(
              margin: const EdgeInsets.all(5.0),
              child: Image.network(
                AppLinks.productImageUrl + item['imageUrl'],
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: 300.0,
            // autoPlay: true,
            // autoPlayInterval: const Duration(seconds: 3),
            autoPlayCurve: Curves.easeInOut,
            enlargeCenterPage: true,
            viewportFraction: 1,
            // viewportFraction: 0.8,
            onPageChanged: (index, reason) {
              controller.updateCurrentIndex(index);
            },
          ),
        ),
        const Positioned(
          bottom: 40.0,
          right: 0,
          left: 0,
          child: ImagesDots(),
        ),
      ],
    );
  }
}
