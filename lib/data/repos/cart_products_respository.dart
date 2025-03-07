import 'dart:developer';

import 'package:dapper_user/data/models/cart/cart_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CartProductsRespository {
  final CartProductsRespository cartProductsRespository;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  CartProductsRespository({required this.cartProductsRespository});
  //* Add to cart through repository
  Future<void> addToCart(int productId, int quantity) async {
    try {
      String? token = await _secureStorage.read(key: 'auth_token');

      if (token == null) {
        throw Exception("User is not logged in. Token missing.");
      }

      await cartProductsRespository.addToCart(
        productId,
        quantity,
      );
      // log('Product added to cart through provider.');
    } catch (e) {
      log('Error adding product to cart in provider: $e');
      throw Exception('Error adding product to cart');
    }
  }

  //* Fetch cart products through repository
  Future<List<CartModel>> fetchCartProducts() async {
    try {
      String? token = await _secureStorage.read(key: 'auth_token');

      if (token == null) {
        throw Exception("User is not logged in. Token missing.");
      }

      List<CartModel> cartProducts =
          await cartProductsRespository.fetchCartProducts();
      // log("Cart products fetched through provider: ${cartProducts.length}");
      return cartProducts;
    } catch (e) {
      log('Error fetching cart products in provider: $e');
      throw Exception('Error fetching cart products');
    }
  }

  Future<void> deleteFromCart(int productId) async {
    try {
      String? token = await _secureStorage.read(key: 'auth_token');
      // log("product id $productId");
      if (token == null) {
        throw Exception("User is not logged in. Token missing.");
      }

      await cartProductsRespository.deleteFromCart(productId);
      log('Product deleted from cart through repository.');
    } catch (e) {
      log('Error deleting product from cart in repository: $e');
      throw Exception('Error deleting product from cart');
    }
  }
}
