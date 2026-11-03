import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/product_service.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;
  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int jumlah = 1;
  late Future<Product> _futureDetail;

  @override
  void initState() {
    super.initState();
    // hanya id yang dipakai dari data navigasi, detail lengkap diambil dari API
    _futureDetail = ProductService.fetchProductDetail(widget.product.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product.name)),
      body: FutureBuilder<Product>(
        future: _futureDetail,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Gagal memuat detail produk'));
          }

          final product = snapshot.data!;
          return Padding(
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
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                        'Deskripsi: ${product.description ?? "Tidak ada deskripsi tersedia"}'),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context, jumlah),
                    child: const Text('Tambah ke Keranjang'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}