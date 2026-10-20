import 'package:get/get.dart';
import '../models/product.dart';

class CartItem {
  final Product product;
  final RxInt quantity;

  CartItem(this.product, int qty) : quantity = qty.obs;
}

class CartController extends GetxController {
  final RxList<CartItem> items = <CartItem>[].obs;

  // Getter reaktif: dihitung ulang setiap dibaca di dalam Obx
  int get totalItem => items.fold(0, (sum, item) => sum + item.quantity.value);

  double get totalHarga => items.fold<double>(
        0,
        (sum, item) => sum + item.product.price * item.quantity.value,
      );

  void addToCart(Product product, {int qty = 1}) {
    final index = items.indexWhere((i) => i.product.id == product.id);
    if (index >= 0) {
      items[index].quantity.value += qty; // produk sudah ada, tambah jumlahnya
    } else {
      items.add(CartItem(product, qty));
    }
  }

  void removeFromCart(Product product) {
    items.removeWhere((i) => i.product.id == product.id);
  }

  void increaseQty(CartItem item) => item.quantity.value++;

  void decreaseQty(CartItem item) {
    if (item.quantity.value > 1) {
      item.quantity.value--;
    } else {
      removeFromCart(item.product);
    }
  }

  void clearCart() => items.clear();
}