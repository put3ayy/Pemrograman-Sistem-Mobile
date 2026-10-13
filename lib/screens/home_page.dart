import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card3.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> dataProduk = daftarProduk; // Mengambil data produk dari daftarProduk
    
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          children: [
            // header
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const[
                      Text(
                        'Toko Kita',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.shopping_cart),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Belanja jadi lebih mudah.',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            // list produk
            Expanded(
              child: ListView.builder(
                itemCount: dataProduk.length,
                itemBuilder: (context, index) {
                  final product = dataProduk[index];
                  return GestureDetector(
                    onTap: () async {
                      final jumlah = await Navigator.pushNamed(
                        context,
                        '/detail',
                        arguments: product,
                      );
                      if (jumlah != null && context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Anda membeli $jumlah ${product.name} ditambakan '),
                          ),
                        );
                      }
                    },
                    child: ProductCard(product: product),
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