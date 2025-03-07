import 'package:dapper_user/data/providers/cart_products_provider.dart';
import 'package:dapper_user/logic/addtocart/cart_item_event.dart';
import 'package:dapper_user/logic/addtocart/cart_item_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartProductsProvider cartProductsProvider;
  final _storeage = FlutterSecureStorage();

  CartBloc({
    required this.cartProductsProvider,
  }) : super(CartInitial()) {
    //* Handling AddToCartEvent
    on<AddToCartEvent>((event, emit) async {
      String? token = await _storeage.read(key: 'auth_token');
      emit(CartLoading());

      try {
        // Fetch the current cart products
        final cartProducts =
            await cartProductsProvider.fetchCartProducts(token!);

        // Check if the product already exists in the cart
        bool productExists =
            cartProducts.any((product) => product.id == event.productId);

        if (productExists) {
          // Emit a state to show a snackbar in the UI
          emit(ShowProductAlreadyInCartSnackbar(
              'Product already added in cart!'));
        } else {
          // If the product is not in the cart, proceed to add it
          await cartProductsProvider.addToCart(
            event.productId,
            event.quantity,
            token,
          );

          // Fetch the updated cart after adding the product
          final updatedCartProducts =
              await cartProductsProvider.fetchCartProducts(token);

          // Emit success state with the updated cart
          emit(CartAddedSuccess(updatedCartProducts));
        }
      } catch (e) {
        emit(CartError('Failed to add product to cart.')); // Emit error state
      }
    });

    //* Handling FetchCartEvent
    on<FetchCartEvent>((event, emit) async {
      String? token = await _storeage.read(key: 'auth_token');

      emit(CartLoading());

      try {
        final cartProducts =
            await cartProductsProvider.fetchCartProducts(token!);
        emit(CartLoadedSuccess(
            cartProducts)); // Emit success state with cart products
      } catch (e) {
        emit(CartError('Failed to fetch cart products.')); // Emit error state
      }
    });

    on<DeleteCartEvent>((event, emit) async {
      String? token = await _storeage.read(key: 'auth_token');
      emit(CartLoading()); // Emit loading state

      try {
        await cartProductsProvider.deleteFromCart(
            event.productId, token!); // Deleting from the cart

        // Fetch the updated cart after deletion
        final cartProducts =
            await cartProductsProvider.fetchCartProducts(token);
        emit(CartLoadedSuccess(
            cartProducts)); // Emit success with the updated cart
      } catch (e) {
        emit(CartError(
            'Failed to delete product from cart.')); // Emit error state
      }
    });
  }
}
