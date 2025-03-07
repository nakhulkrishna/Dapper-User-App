import 'package:dapper_user/data/models/products/productsmodel.dart';

//* Products States
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductModel> products;
  ProductLoaded({required this.products});
}

class ProductError extends ProductState {
  final String errorMessage;
  ProductError(this.errorMessage);
}
