import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final double productPrice;

  ProductCard({required this.productName, required this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(productName),
        subtitle: Text('Price: \$${productPrice.toStringAsFixed(2)}'),
        // Add more fields or customization as needed
      ),
    );
  }
}