import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shopify_app/GetXPackage/Controllers/product_controllers.dart';
import 'package:get/get.dart';
import 'package:shopify_app/widgets/products_tile.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
              const Text(
                "Shopify",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.shopping_cart))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text("Welcome Home Bitches"),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Obx(() {
              if (productController.isLoading.isTrue) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return AlignedGridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    itemCount: productController.productList.length,
                    itemBuilder: (context, index) {
                      return ProductTile(
                          product: productController.productList[index]);
                    });
              }
            }),
          )
        ]),
      ),
    );
  }
}
