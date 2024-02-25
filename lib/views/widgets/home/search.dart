import 'package:flutter/material.dart';
import 'package:shopping_app/class/search.dart';

class SearchHomePage extends StatelessWidget {
  const SearchHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35.0,
      height: 35.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          showSearch(context: context, delegate: CustomSearch());
        },
        child: const Icon(
          Icons.search,
          size: 28.0,
        ),
      ),
    );
  }
}
