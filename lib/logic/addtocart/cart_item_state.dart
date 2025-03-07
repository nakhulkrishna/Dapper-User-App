import 'package:dapper_user/data/models/cart/cart_model.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartAddedSuccess extends CartState {
  final List<CartModel> cartProducts;

  CartAddedSuccess(this.cartProducts);
}

class ShowProductAlreadyInCartSnackbar extends CartState {
  final String message;
  ShowProductAlreadyInCartSnackbar(this.message);
}

class CartLoadedSuccess extends CartState {
  final List<CartModel> cartProducts;

  CartLoadedSuccess(this.cartProducts);
}

class CartError extends CartState {
  final String error;

  CartError(this.error);
}
