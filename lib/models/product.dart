class Product {
  final int id;
  final String name;
  final double price;
  final String imageUrl;
  final String category;
  int stock;
  final String? description; //(? = nullable)

  Product ({
    required this.id, //required = wajib diisi
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.stock,
    this.description,
  });

    // Menentukan status stok berdasarkan jumlah
  String getStatusStok() {
    if (stock <= 0) {
      return 'Habis';
    } else if (stock <=5) {
      return 'Stok terbatas';
    } else {
      return 'Tersedia';
    }
  }

  void tampilkanInfo() {
    print('ID: $id');
    print('Nama produk: $name');
    print('Harga: $price');
    print('Kategori: $category');
    print('Stok: $stock');
    print('Deskripsi: ${description ?? "Tidak ada deskripsi"}');
  }
}

  class DiskonProduk extends Product {
    final double diskonProduk;

    DiskonProduk ({
      required super.id,
      required super.name,
      required super.price,
      required super.imageUrl,
      required super.category,
      required super.stock,
      super.description,
      required this.diskonProduk,
    });

    double hitungHargaFinal() {
      return price - (price * diskonProduk / 100);
    }
  }

  double hitungHargaSetelahDiskon(double harga, double persenDiskon,) {
    return harga - (harga *persenDiskon / 100);
  }

  double hitungHargaSetelahDiskon2({
    required double harga,
    double persenDiskon = 0,
  }) {
    return harga - (harga * persenDiskon / 100);
  }

  String formatRupiah(double harga) => 'Rp${harga.toStringAsFixed(0)}';

  String labelStatusProduk(int stok) {
    if (stok <= 0) {
      return 'Habis';
    } else if (stok <= 5) {
      return 'Stok Terbatas';
    } else {
      return 'Tersedia';
    }
  }

  double totalBelanja(List<double> daftarHarga) {
  double total = 0;
    for (int i = 0; i < daftarHarga.length; i++) {
      total += daftarHarga[i];
    }
      return total;
  }

  double diskonBerdasarkanKategori(String kategori) {
  double persenDiskon;
  switch (kategori) {
    case 'Elektronik':
      persenDiskon = 10;
      break;
    case 'Fashion':
      persenDiskon = 15;
      break;
    case 'Makanan':
      persenDiskon = 5;
      break;
    default:
      persenDiskon = 0;
  }
  return persenDiskon;
}

//List 8 data dummy
List<Product> daftarProduk = [
  Product(
    id: 1,
    name: 'Sepatu Sneakers',
    price: 350000,
    imageUrl: 'https://contoh.com/sneakers.jpg',
    category: 'Fashion',
    stock: 12,
  ),

  Product(
    id: 2,
    name: 'Kaos Polos',
    price: 60000,
    imageUrl: 'https://contoh.com/kaos.jpg',
    category: 'Fashion',
    stock: 30
  ),

  Product(
    id: 3,
    name: 'Charger USB-C',
    price: 85000,
    imageUrl: 'https://contoh.com/charger.jpg',
    category: 'Elektronik',
    stock: 3,
  ),
  
  Product(
    id: 4,
    name: 'Headset Bluetooth',
    price: 150000,
    imageUrl: 'https://contoh.com/headset.jpg',
    category: 'Elektronik',
    stock: 0,
    description: 'Headset wireless dengan noise cancelling.',
  ),

  Product(
    id: 5,
    name: 'Mie Instan Goreng',
    price: 3500,
    imageUrl: 'https://contoh.com/mie.jpg',
    category: 'Makanan',
    stock: 100,
  ),

  Product(
    id: 6,
    name: 'Kopi Sachet',
    price: 2000,
    imageUrl: 'https://contoh.com/kopi.jpg',
    category: 'Makanan',
    stock: 50,
  ),

  Product(
    id: 7,
    name: 'Celana Jeans',
    price: 250000,
    imageUrl: 'https://contoh.com/jeans.jpg',
    category: 'Fashion',
    stock: 8,
    description: 'Celana jeans slim fit warna biru.',
  ),

  Product(
    id: 8,
    name: 'Power Bank 10000mAh',
    price: 175000,
    imageUrl: 'https://contoh.com/powerbank.jpg',
    category: 'Elektronik',
    stock: 4,
  ),

  Product(
    id: 9, 
    name: 'Jaket Hoodie', 
    price: 220000, 
    imageUrl: 'hoodie.jpg', 
    category: 'Fashion', 
    stock: 15
    ),

  DiskonProduk(
    id: 10, 
    name: 'Smartwatch', 
    price: 450000, 
    imageUrl: 'smartwatch.jpg', 
    category: 'Elektronik', 
    stock: 5, 
    diskonProduk: 20
    ),

  Product(
    id: 11, 
    name: 'Keripik Singkong', 
    price: 12000, 
    imageUrl: 'keripik.jpg', 
    category: 'Makanan', 
    stock: 60
    ),

  Product(
    id: 12, 
    name: 'Mouse Wireless', 
    price: 95000, 
    imageUrl: 'mouse.jpg', 
    category: 'Elektronik', 
    stock: 2
    ),

  DiskonProduk(
    id: 13, 
    name: 'Kemeja Flanel', 
    price: 180000, 
    imageUrl: 'flanel.jpg', 
    category: 'Fashion', 
    stock: 10, 
    diskonProduk: 10
  ),

  Product(
    id: 14, 
    name: 'Teh Botol', 
    price: 5000, 
    imageUrl: 'teh.jpg', 
    category: 'Makanan', 
    stock: 0
  ),
  
  Product(
    id: 15, 
    name: 'Tas Ransel', 
    price: 275000, 
    imageUrl: 'tas.jpg', 
    category: 'Fashion', 
    stock: 7
  ),
];

//Total belanja dari list produk
double hitungTotalBelanja(List<Product> keranjang) {
  double total = 0;
  for (int i = 0; i < keranjang.length; i++) {
    total += keranjang[i].price;
  }
  return total;
}

// Data Total Belanja
void totallBelanja() {
  print('Langkah 6: Daftar Produk & Total Belanja');

  for (var produk in daftarProduk) {
    print('${produk.name} - Status: ${produk.getStatusStok()}');
  }

  List<Product> keranjang = [daftarProduk[0], daftarProduk[2], daftarProduk[4]];
  double total = hitungTotalBelanja(keranjang);
  print('Total belanja: $total');
}

void main() {
  /*Langkah1VariabeldanTipedata();
  langkah2Operator();
  langkah3ControlFlow();
  langkah4Function();
  langkah5ClassProduct();*/
  totallBelanja();
}