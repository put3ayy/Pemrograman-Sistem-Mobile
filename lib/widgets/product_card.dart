import 'package:flutter/material.dart';
import '../models/product.dart';
import 'price_label.dart';
import 'stock_badge.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard ({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            const Icon(Icons.shopping_bag, size: 48),
            const SizedBox(width: 12),

            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                PriceLabel(harga: product.price),
                const SizedBox(height: 4),
                StockBadge(stock: product.stock),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}