// quantity_bloc.dart
import 'package:dapper_user/logic/StockQuantity/stock_quantity_event.dart';
import 'package:dapper_user/logic/StockQuantity/stock_quantity_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StockQuantityBloc extends Bloc<StockQuantityEvent, StockQuantityState> {
  StockQuantityBloc() : super(const StockQuantityState(1)) {
    // Initial quantity is 1

    // Event handler for adding quantity
    on<AddQunatity>((event, emit) {
      emit(state.copyWith(quantity: state.quantity + event.amount));
    });

    // Event handler for removing quantity, with a check for minimum value
    on<RemoveQunatity>((event, emit) {
      if (state.quantity > event.amount) {
        emit(state.copyWith(quantity: state.quantity - event.amount));
      }
    });
  }
}
