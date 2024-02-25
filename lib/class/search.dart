import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/controllers/searchController.dart';
import 'package:get/get.dart';
import 'package:shopping_app/model/products_model.dart';
import 'package:shopping_app/views/widgets/home/productsHomeItem.dart';

class CustomSearch extends SearchDelegate {
  @override
  TextStyle? get searchFieldStyle => const TextStyle(fontSize: 16);

  @override
  List<Widget>? buildActions(BuildContext context) {
    Get.put(CustomSearchController());

    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.close)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(
        Icons.arrow_back_ios,
        size: 16,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchDataWidget(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return query != ''
        ? SearchDataWidget(query: query)
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('images/1.json', width: 200),
                const SizedBox(height: 10),
                const Text(
                  'لاتوجد بيانات',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          );
  }
}

class SearchDataWidget extends StatelessWidget {
  final String query;

  const SearchDataWidget({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GetBuilder<CustomSearchController>(builder: (controller) {
        List<ProductsModel> searchProducts = controller.products;

        // Filter the products based on the query
        List<ProductsModel> filteredProducts = searchProducts.where((product) {
          String title = product.title.toString().toLowerCase();
          return title.contains(query.toLowerCase());
        }).toList();

        return filteredProducts.isNotEmpty && query != ''
            ? GridView.builder(
                itemCount: filteredProducts.length,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  return ProductsHomeItem(
                    filteredProducts[index].id,
                    filteredProducts[index].title,
                    int.parse(filteredProducts[index].price.toString()),
                    filteredProducts[index],
                  );
                },
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset('images/1.json', width: 200),
                    const SizedBox(height: 10),
                    const Text(
                      'لاتوجد بيانات',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              );
      }),
    );
  }
}
