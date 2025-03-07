abstract class CartEvent {}

class AddToCartEvent extends CartEvent {
  final int productId;
  final int quantity;

  AddToCartEvent(
    this.productId,
    this.quantity,
  );
}

class FetchCartEvent extends CartEvent {}

class ToggleSelectionEvent extends CartEvent {
  final int index;

  ToggleSelectionEvent(this.index);
}

class DeleteCartEvent extends CartEvent {
  final int productId;

  DeleteCartEvent(
    this.productId,
  );
}
