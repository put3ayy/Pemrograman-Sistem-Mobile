import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import 'product_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cart = Get.find<CartController>();
    final List<Product> dataProduk = daftarProduk;

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
                      const Text(
                        'Toko Kita',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      // Badge ter-update otomatis saat totalItem berubah
                      Obx(() => Badge(
                            isLabelVisible: cart.totalItem > 0,
                            label: Text('${cart.totalItem}'),
                            child: const Icon(Icons.shopping_cart),
                          )),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Belanja jadi lebih mudah.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: dataProduk.length,
                itemBuilder: (context, index) {
                  final product = dataProduk[index];
                  return GestureDetector(
                    onTap: () => Get.to(() => ProductDetailPage(product: product)),
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