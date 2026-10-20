import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import 'checkout_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cart = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep),
            tooltip: 'Kosongkan Keranjang',
            onPressed: () {
              if (cart.items.isEmpty) return;
              Get.defaultDialog(
                title: 'Kosongkan Keranjang',
                middleText: 'Semua item di keranjang akan dihapus. Lanjutkan?',
                textConfirm: 'Ya, kosongkan',
                textCancel: 'Batal',
                onConfirm: () {
                  cart.clearCart();
                  Get.back(); // tutup dialog
                },
              );
            },
          ),
        ],
      ),
      body: Obx(() {
        if (cart.items.isEmpty) {
          return const Center(child: Text('Keranjang masih kosong'));
        }
        return ListView.builder(
          itemCount: cart.items.length,
          itemBuilder: (context, index) {
            final item = cart.items[index];
            return ListTile(
              leading: const Icon(Icons.shopping_bag),
              title: Text(item.product.name),
              subtitle: Text('Rp ${item.product.price.toStringAsFixed(0)}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () => cart.decreaseQty(item),
                  ),
                  // Obx sendiri untuk jumlah, karena itemBuilder tidak
                  // terpantau oleh Obx di luarnya
                  Obx(() => Text('${item.quantity.value}')),
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline),
                    onPressed: () => cart.increaseQty(item),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => cart.removeFromCart(item.product),
                  ),
                ],
              ),
            );
          },
        );
      }),
      bottomNavigationBar: Obx(() => Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total', style: TextStyle(fontSize: 16)),
                    Text(
                      'Rp ${cart.totalHarga.toStringAsFixed(0)}',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: cart.items.isEmpty
                        ? null
                        : () => Get.off(() => const CheckoutPage()),
                    child: const Text('Checkout'),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}