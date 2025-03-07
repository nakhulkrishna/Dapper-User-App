class CartModel {
  final int? id;
  final CartProductModel product;
  final int? quantity;
  bool isSelected;

  CartModel({
    this.id,
    required this.product,
    this.quantity,
    this.isSelected = false, // Default value to false
  });

  // Factory method to create an instance of CartModel from a JSON object
  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'] as int?,
      product:
          CartProductModel.fromJson(json['product'] as Map<String, dynamic>),
      quantity: json['quantity'] as int?,
      isSelected: json['isSelected'] as bool? ??
          false, // Handle null and default to false
    );
  }

  // Convert CartModel instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product.toJson(),
      'quantity': quantity,
      'isSelected': isSelected, // Add isSelected to the JSON object
    };
  }
}

class CartProductModel {
  final int? id;
  final String productName;
  final String description;
  final double totalPrice;
  final String category;
  final int stock;
  String? images1;
  String? images2;
  String? images3;
  final bool productStatus;
  final String? colour;
  final String? material;
  final String? sizes;

  CartProductModel({
    this.id,
    required this.colour,
    required this.material,
    required this.sizes,
    required this.category,
    required this.productName,
    required this.description,
    required this.totalPrice,
    required this.stock,
    this.images1,
    this.images2,
    this.images3,
    required this.productStatus,
  });

  //! Convert CartProductModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sizes': sizes,
      'material': material,
      'colour': colour,
      'category': category,
      'product_name': productName,
      'description': description,
      'total_price': totalPrice,
      'stock': stock,
      'images1': images1,
      'images2': images2,
      'images3': images3,
      'product_status': productStatus,
    };
  }

  //! Create CartProductModel from JSON
  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      id: json['id'],
      colour: json['colour'],
      material: json['material'],
      sizes: json['sizes'],
      category: json['category'],
      productName: json['product_name'],
      description: json['description'],
      totalPrice: json['total_price'].toDouble(),
      stock: json['stock'],
      images1: json['images1'],
      images2: json['images2'],
      images3: json['images3'],
      productStatus: json['product_status'],
    );
  }
}
