import 'package:flutter/material.dart';

class StockBadge extends StatelessWidget {
  final int stock;
  const StockBadge({super.key, required this.stock});

  String get _label {
    if (stock <= 0) return 'Habis';
    if (stock <= 5) return 'Stock Terbatas';
    return 'Tersedia';
  }

  Color get _warna {
    if (stock <= 0) return Colors.red;
    if (stock <= 5) return Colors.orange;
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _warna.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: _warna),
      ),
      child: Text(
        _label,
        style: TextStyle(color: _warna, fontSize: 12, fontWeight: FontWeight.w600),
      ),
    );
  }
}

