import 'dart:developer';

import 'package:dapper_user/data/models/products/productsmodel.dart';
import 'package:dapper_user/data/providers/products_providers.dart';
import 'package:dapper_user/logic/products/products_event.dart';
import 'package:dapper_user/logic/products/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//* Products Fecthing bloc
class ProductsBloc extends Bloc<FetchProductsEvent, ProductState> {
  final ProductsProviders productsProviders;
  ProductsBloc(this.productsProviders) : super(ProductInitial()) {
    on<FetchProductsEvent>(_onFecthProducts);
  }

  Future<void> _onFecthProducts(
      FetchProductsEvent event, Emitter<ProductState> emit) async {
    try {
      emit(ProductLoading());
      List<ProductModel> products = await productsProviders.fetchProducts();
      emit(ProductLoaded(products: products));
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      await Future.delayed(Duration(seconds: 2));
      emit(ProductError(e.toString()));
    }
  }
}
