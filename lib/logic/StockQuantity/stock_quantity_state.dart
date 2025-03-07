import 'package:equatable/equatable.dart';

class StockQuantityState extends Equatable {
  final int quantity;
  const StockQuantityState(this.quantity);

  @override
  List<Object> get props => [quantity];

  StockQuantityState copyWith({int? quantity}) {
    return StockQuantityState(quantity ?? this.quantity);
  }
}
