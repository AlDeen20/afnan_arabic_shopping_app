// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/cartController.dart';
import 'package:shopping_app/controllers/productsController.dart';
import 'package:shopping_app/model/products_model.dart';
import 'package:shopping_app/routes.dart';
import 'package:shopping_app/views/widgets/backButton.dart';

class ProductsScreen extends StatelessWidget {
  final ProductsModel productsModel;
  ProductsScreen({super.key, required this.id, required this.productsModel});
  final int id;
  final controller = Get.put(ProductsController());
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    controller.subcateid.value = id;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonWidget(),
        title: const Text(
          'المنتجات',
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: true,
        toolbarHeight: 40.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: FutureBuilder<List>(
          future: controller.getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Text('حدث خطأ');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text('لا توجد بيانات'),
              );
            } else {
              return GridView.builder(
                itemCount: snapshot.data!.length,
                padding: const EdgeInsets.all(10.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.675,
                ),
                itemBuilder: (context, index) {
                  return _buildProductItem(snapshot.data![index]);
                },
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildProductItem(Map<String, dynamic> productData) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          AppRoutes.productsdetails,
          arguments: {
            'productID': productData['id'],
            'productsModel': productsModel,
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              spreadRadius: 1,
              blurRadius: 1,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: _buildProductImage(productData['id']),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                productData['title'],
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                productData['des'],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${productData['price']} د.ع',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        cartController.insertProductToCart(productsModel, 1);
                      },
                      icon: const Icon(Icons.shopping_cart)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder<String> _buildProductImage(int productId) {
    return FutureBuilder<String>(
      future: controller.getProductImage(productId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Text('Error loading image');
        } else if (!snapshot.hasData) {
          return const Text('No image data');
        } else {
          return Image.network(
            snapshot.data!,
            fit: BoxFit.cover,
            height: 100.0,
          );
        }
      },
    );
  }
}
