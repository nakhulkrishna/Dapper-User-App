class ProductModel {
  final int? id;
  final String productName;
  final String description;
  final double totalPrice;
  final String category;
  final int stock;
  String? images1_url;
  String? images2_url;
  String? images3_url;
  final bool productStatus;
  final String? colour;
  final String? material;
  final String? sizes;

  ProductModel({
    this.id,
    required this.colour,
    required this.material,
    required this.sizes,
    required this.category,
    required this.productName,
    required this.description,
    required this.totalPrice,
    required this.stock,
    this.images1_url,
    this.images2_url,
    this.images3_url,
    required this.productStatus,
  });

  //! Convert ProductModel to JSON
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
      'images1_url': images1_url,
      'images2_url': images2_url,
      'images3_url': images3_url,
      'product_status': productStatus,
    };
  }

  //! Create ProductModel from JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      colour: json['colour'],
      material: json['material'],
      sizes: json['sizes'],
      category: json['category'],
      productName: json['product_name'],
      description: json['description'],
      totalPrice: json['total_price'].toDouble(),
      stock: json['stock'],
      images1_url: json['images1_url'],
      images2_url: json['images2_url'],
      images3_url: json['images3_url'],
      productStatus: json['product_status'],
    );
  }
}
