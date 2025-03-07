import 'dart:developer';
import 'package:dapper_user/data/models/products/productsmodel.dart';
import 'package:dapper_user/utils/constants/keys/api.dart';
import 'package:dio/dio.dart';

class ProductsProviders {
  final Dio dio;
  ProductsProviders({required this.dio});

  static const String baseurl = Api.products;

  //* Fetch products function
  Future<List<ProductModel>> fetchProducts() async {
    try {
      Response response = await dio.get(baseurl);

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<ProductModel> products = data
            .map((productJson) => ProductModel.fromJson(productJson))
            .toList();
        log("Products fetched: ${products.length}");
        return products;
      } else {
        throw Exception('Failed to fetch products');
      }
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw Exception('Error fetching products: $e');
    }
  }
}
