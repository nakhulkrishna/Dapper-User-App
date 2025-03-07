import 'dart:developer';
import 'package:dapper_user/data/models/products/productsmodel.dart';
import 'package:dapper_user/data/providers/products_providers.dart';

class ProductsRepository {
  final ProductsProviders productsProviders;

  ProductsRepository({required this.productsProviders});

  //* Fetch products through repository
  Future<List<ProductModel>> fetchProducts() async {
    try {
      List<ProductModel> products = await productsProviders.fetchProducts();
      log("Products fetched through provider: ${products.length}");
      return products;
    } catch (e) {
      log('Error fetching products in provider: $e');
      throw Exception('Error fetching products');
    }
  }
}
