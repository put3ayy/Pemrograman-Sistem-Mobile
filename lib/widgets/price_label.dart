import 'package:flutter/material.dart';

class PriceLabel extends StatelessWidget {
  final double harga;
  const PriceLabel({super.key, required this.harga});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Rp${harga.toStringAsFixed(0)}',
      style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.green),
    );
  }
}