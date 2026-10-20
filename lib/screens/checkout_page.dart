import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import 'main_page.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cart = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Ringkasan Pesanan',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: cart.items
                    .map((item) => ListTile(
                          title: Text(item.product.name),
                          subtitle: Text('${item.quantity.value} x Rp ${item.product.price.toStringAsFixed(0)}'),
                          trailing: Text(
                            'Rp ${(item.product.price * item.quantity.value).toStringAsFixed(0)}',
                          ),
                        ))
                    .toList(),
              ),
            ),
            Text('Total: Rp ${cart.totalHarga.toStringAsFixed(0)}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  cart.clearCart();
                  Get.offAll(() => const MainPage());
                  Get.snackbar('Berhasil', 'Pesanan berhasil dibuat');
                },
                child: const Text('Selesai'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}