import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import '../models/product.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;
  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int jumlah = 1;
  final CartController cart = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.shopping_bag, size: 64),
              ),
            ),
            const SizedBox(height: 20),
            Text(product.name,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Rp ${product.price.toStringAsFixed(0)}',
                style: const TextStyle(fontSize: 18, color: Colors.green)),
            const SizedBox(height: 8),
            Text('Kategori: ${product.category}'),
            const SizedBox(height: 8),
            Text('Status Stok: ${product.getStatusStok()}'),
            const SizedBox(height: 8),
            Text('Deskripsi: ${product.description ?? "Tidak ada deskripsi tersedia"}'),
            const SizedBox(height: 16),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    if (jumlah > 1) setState(() => jumlah--);
                  },
                ),
                Text('$jumlah', style: const TextStyle(fontSize: 18)),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () => setState(() => jumlah++),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  cart.addToCart(product, qty: jumlah);
                  Get.back(); // pengganti Navigator.pop
                  Get.snackbar(
                    'Keranjang',
                    '$jumlah ${product.name} ditambahkan ke keranjang',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
                child: const Text('Tambah ke Keranjang'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}