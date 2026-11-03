import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import '../services/product_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Product>> _futureProduk;

  @override
  void initState() {
    super.initState();
    _futureProduk = ProductService.fetchProducts();
  }

  void _muatUlang() {
    setState(() {
      _futureProduk = ProductService.fetchProducts();
    });
  }

  Future<void> _refresh() async {
    _muatUlang();
    try {
      await _futureProduk;
    }
    catch (_) {

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Toko Kita',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.shopping_cart),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Belanja jadi lebih mudah.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Product>>(
                future: _futureProduk,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Column (
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.wifi_off, size: 48, color: Colors.grey),
                        const SizedBox(height: 12),
                        const Text('Gagal memuat produk, coba lagi'),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: _muatUlang, 
                          child: const Text('Coba Lagi'),
                        ),
                      ],
                    ),
                  );
                }

                final dataProduk = snapshot.data ?? [];
                return RefreshIndicator(
                  onRefresh: _refresh, 
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: dataProduk.length,
                    itemBuilder: (context, index) {
                      final product = dataProduk[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/detail', arguments: product);
                        },
                        child: ProductCard(product: product),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}