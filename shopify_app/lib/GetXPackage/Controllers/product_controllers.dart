import 'package:get/get.dart';

import 'package:shopify_app/model/products_model.dart';
import 'package:shopify_app/services/remote_services.dart';

class ProductController extends GetxController {
  var productList = <Product>[].obs;

  Future<void> fetchProducts() async {
    var products = await RemoteServices.fetchProducts();
    //after we have fetched th products:
    if (products != null) {
      productList.value = products;
    }
  }
}
