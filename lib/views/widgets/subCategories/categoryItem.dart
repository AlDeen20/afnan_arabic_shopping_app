// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/subCategoriesController.dart';

class CategoryItem extends GetView<SubCategoriesController> {
  final int index;
  const CategoryItem(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.updateSubcategoryID(controller.data[index]['id']);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        decoration: BoxDecoration(
          color: controller.subcateID == controller.data[index]['id']
              ? Colors.grey
              : Colors.transparent,
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(width: 1, color: Colors.grey),
        ),
        child: Text(
          controller.data[index]['title'].toString(),
          style: const TextStyle(fontSize: 14.0),
        ),
      ),
    );
  }
}
