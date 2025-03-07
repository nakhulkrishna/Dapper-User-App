import 'dart:developer';

import 'package:dapper_user/data/models/cart/cart_model.dart';
import 'package:dapper_user/utils/constants/keys/api.dart';
import 'package:dio/dio.dart';

class CartProductsProvider {
  final Dio dio;

  CartProductsProvider({required this.dio});
  static const String addtocart = Api.authUser;

  //* Add to cart function
  Future<void> addToCart(int productId, int quantity, String token) async {
    try {
      final response = await dio.post(
        "${addtocart}add_cart/",
        data: {
          'id': productId,
          'quantity': quantity,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        log('Product added to cart successfully.');
      } else {
        throw Exception('Failed to add product to cart');
      }
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw Exception('Error adding product to cart: $e');
    }
  }

  //* Fetch cart products function
  Future<List<CartModel>> fetchCartProducts(String token) async {
    try {
      final response = await dio.get(
        "${addtocart}add_cart/",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<CartModel> cartProducts =
            data.map((cartJson) => CartModel.fromJson(cartJson)).toList();
        return cartProducts;
      } else {
        throw Exception('Failed to fetch cart products');
      }
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw Exception('Error fetching cart products: $e');
    }
  }

  Future<void> deleteFromCart(int productId, String token) async {
    // log("token from deletion cart $token");
    // log("product id is $productId");

    try {
      final response = await dio.delete(
        "${addtocart}add_cart/$productId",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      // log('Response status: ${response.statusCode}');
      // log('Response data: ${response.data}');

      if (response.statusCode == 200) {
        log("Product successfully deleted from cart");
      } else {
        throw Exception(
            "Failed to delete product: Status Code ${response.statusCode}");
      }
    } catch (e, stack) {
      log("Error deleting product from cart: $e", stackTrace: stack);
      throw Exception('Error deleting product from cart: $e');
    }
  }
}
