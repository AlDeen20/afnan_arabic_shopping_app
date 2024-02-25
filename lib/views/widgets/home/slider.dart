import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderHome extends StatelessWidget {
  const SliderHome({super.key});

  @override
  Widget build(BuildContext context) {
    List imageList = [
      'images/baner2.png',
      'images/baner1.jpg',
    ];
    return CarouselSlider(
      items: imageList.map((item) {
        return Image.asset(
          item,
          // fit: BoxFit.cover,
          width: double.infinity,
          height: 140,
          fit: BoxFit.fill,
        );
      }).toList(),
      options: CarouselOptions(
        height: 140.0,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayCurve: Curves.easeInOut,
        enlargeCenterPage: true, // Enable center image enlargement
        viewportFraction: 1, // Fraction of the viewport to show
        onPageChanged: (index, reason) {
          // controller.currentIndex.value = index;
        },
      ),
    );
  }
}
