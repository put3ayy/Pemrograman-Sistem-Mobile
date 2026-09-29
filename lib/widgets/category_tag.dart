import 'package:flutter/material.dart';

class CategoryTag extends StatelessWidget {
  final String category;
  const CategoryTag({super.key, required this.category});

  Color get _warna {
    switch (category) {
      case 'Elektronik':
        return Colors.blue;
      case 'Fashion':
        return Colors.purple;
      case 'Makanan':
        return Colors.brown;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: _warna.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        category,
        style: TextStyle(color: _warna, fontSize: 11, fontWeight: FontWeight.w500),
      ),
    );
  }
}