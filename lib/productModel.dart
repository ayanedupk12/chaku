
class Product {
  final String? id;
  final String? name;
  final String? description;
  final double? price;
  final String? size;
  final String? image;
  // Add more fields as needed

  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.size,
    this.image,
    // Add more fields as needed
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price']?.toDouble(),
      size: json['size'],
      image: json['image'],
      // Add more fields as needed
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'size': size,
      'image': image,
      // Add more fields as needed
    };
  }
}
