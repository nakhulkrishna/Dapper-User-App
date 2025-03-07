abstract class StockQuantityEvent {}

class AddQunatity extends StockQuantityEvent {
  final int amount;

  AddQunatity([this.amount = 1]);
}

class RemoveQunatity extends StockQuantityEvent {
  final int amount;

  RemoveQunatity([this.amount = 1]);
}
