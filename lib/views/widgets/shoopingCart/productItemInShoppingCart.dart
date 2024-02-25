// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/appLinks.dart';
import 'package:shopping_app/controllers/cartController.dart';
import 'package:shopping_app/model/products_model.dart';

class ProductItemInShoppingCart extends StatelessWidget {
  final int quantity;
  final ProductsModel productsModel;
  final int index;
  const ProductItemInShoppingCart({
    super.key,
    required this.productsModel,
    required this.index,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    return Container(
      margin: const EdgeInsets.only(bottom: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Row(
          children: [
            Image.network(
              AppLinks.productImageUrl + productsModel.imageUrl,
              width: 60.0,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productsModel.title,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${(int.parse(productsModel.price)) * (quantity)} د.ع',
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () async {
                    cartController.deleteProductFromCart(productsModel);
                  },
                  icon: const Icon(
                    Icons.delete,
                    size: 25.0,
                    color: Colors.red,
                  ),
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.zero,
                ),
                // amount
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        cartController.plusProductToCart(productsModel);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: const Offset(0, -1),
                              ),
                            ],
                          ),
                          child: const Icon(Icons.add)),
                    ),
                    const SizedBox(width: 5.0),
                    Text(
                      quantity.toString(),
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 5.0),
                    InkWell(
                      onTap: () {
                        cartController.removeProductsFromCart(productsModel);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: const Offset(0, -1),
                            ),
                          ],
                        ),
                        child: const Icon(Icons.remove),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
