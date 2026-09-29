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

  void simulasiPenjualanhabis(int stockAwal) {
  int stock = stockAwal;
  print('\nMulai simulasi penjualan, stocl awal: $stock');
    while (stock >0) {
      stock --;
      print('Produk terjual, sisa stock: $stock');
    }
    print('Stok Habis!');
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

  Product(id: 2, 
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
];

//Total belanja dari list produk
double hitungTotalBelanja(List<Product> keranjang) {
  double total = 0;
  for (int i = 0; i < keranjang.length; i++) {
    total += keranjang[i].price;
  }
  return total;
}

// Langkah 1: Variabel dan tipe data produk
void langkah1VariabeldanTipedata() {
  print("\n\nLangkah 1: Variabel dan Tipe Data");

  var namaProdukvar = 'Kaos Polos';
  namaProdukvar = 'Kaos Polos Edisi Baru';

  final tanggalInput = DateTime.now();
  const namaToko  = 'TokoKita';

  print('var (bisa diubah)  : $namaProdukvar');
  print('final (diisi 1x)   : $tanggalInput');
  print('const (tetap)      : $namaToko');

  int stock = 25;
  double harga = 7500;
  String namaProduk = 'Sepatu Sneakers';
  bool statusTersedia = true;

  print('Stock      : $stock');
  print('Harga       : $harga');
  print('Nama Produk  : $namaProduk');
  print('Status Tersedia  : $statusTersedia');

  List<String> kategoriProduk = ['Elektronik', 'Fashion', 'Makanan'];
  print('Kategori Produk  : $kategoriProduk');

  Map<String, dynamic> produkMentah = {
    'id' : 'P001',
    'nama' : 'Sepatu Sneakers',
    'harga' : 250000.0,
    'stock' : 25,
    'kategori' : 'Fashion',
  };
  print('Produk : $produkMentah');
}


// Langkah 2: Operator
void langkah2Operator() {
  print('\nLangkah 2 Operator');

  //Operator Aritmatika
  double hargaSatuan = 20000;
  int jumlahBeli = 3;
  double totalHarga = hargaSatuan * jumlahBeli;
  double totalDenganOngkir = totalHarga + 5000;
  double totalSetelahdiskon = totalDenganOngkir - 3000;
  double hargaRatarata = totalHarga / jumlahBeli;
  int stockAwal = 10;
  int sisaStock = stockAwal - jumlahBeli;
  int sisaBagitiga = stockAwal % 3;

  print('Total harga          : $totalHarga');
  print('Total + ongkir       : $totalDenganOngkir');
  print('Total setelah diskon : $totalSetelahdiskon');
  print('Harga rata-rata/item : $hargaRatarata');
  print('Sisa stock           : $sisaStock');
  print('Sisa bagi tiga       : $sisaBagitiga');

  //Operator Perbandingan
  double hargaA = 50000;
  double hargaB = 75000;
  int stockA = 5;
  int stockB = 5;

  print('hargaA ($hargaA) == hargaB ($hargaB) -> ${hargaA == hargaB}');
  print('hargaA ($hargaA) != hargaB ($hargaB) -> ${hargaA != hargaB}');
  print('hargaA ($hargaA) > hargaB ($hargaB) -> ${hargaA > hargaB}');
  print('hargaA ($hargaA) < hargaB ($hargaB) -> ${hargaA < hargaB}');
  print('stockA ($hargaA) >= stockB ($hargaB) -> ${stockA >= stockB}');
  print('stockA ($hargaA) <= stockB ($hargaB) -> ${stockA <= stockB}');

  // Operator Logika
  int stock = 10;
  double harga = 25000;
  bool layakDitampilkan = stock > 0 && harga > 0;
  bool adaPromoatauStokbanyak = (stock > 20) || (harga < 3000);
  bool tidakTersedia = !layakDitampilkan;

  print('Layak ditampilkan (stock>0 && harga>0  : $layakDitampilkan');
  print('Ada promo atau stock banyak            : $adaPromoatauStokbanyak');
  print('Tidak tersedia                         : $tidakTersedia');
}


//Langkah 3 Control flow untuk logika toko
void langkah3ControlFlow() {
  print('\nLangkah 3 Control Flow');

  print('Status stock 0   : ${labelStatusProduk(0)}');
  print('Status stock 3   : ${labelStatusProduk(3)}');
  print('Status stock 20  : ${labelStatusProduk(20)}');

  List<double> hargaBelanja = [15000, 25000, 40000];
  print('Total belanja    : ${totalBelanja(hargaBelanja)}');

  simulasiPenjualanhabis(3);

  print('Diskon elektronik  : ${diskonBerdasarkanKategori('Elektronik')}%');
  print('Diskon fashion     : ${diskonBerdasarkanKategori('Fashion')}%');
  print('Diskon Makanan     : ${diskonBerdasarkanKategori('Makanan')}%');
}

// Langkah 4: Function Hitung Harga Setelah Diskon
void langkah4Function() {
  print('\n\nLangkah 4 Function');

  print('Parameter biasa (100000, 10%) : ${hitungHargaSetelahDiskon(100000, 10)}');
  print('Named parameter, tanpa diskon : ${hitungHargaSetelahDiskon2(harga: 100000)}');
  print('Named parameter, diskon 20%   : ${hitungHargaSetelahDiskon2(harga: 100000, persenDiskon: 20)}');
  print('Arrow function formatRupiah   : ${formatRupiah(125000)}');
}

//Langkah 5: Class Product dan Diskon Produk
void langkah5ClassProduct() {
  print('\n\nLangkah 5 Class Product & Null Safety');

  Product product1 = Product(
    id: 1, 
    name: 'Sepatu Sneakers', 
    price: 350000, 
    imageUrl: 'https://contoh.com/sneakers.jpg', 
    category: 'Fashion', 
    stock: 12
    );
    product1.tampilkanInfo();

    DiskonProduk product2 = DiskonProduk(
      id: 2, 
      name: 'Kaos Polos', 
      price: 60000, 
      imageUrl: 'https://contoh.com/kaos.jpg', 
      category: 'Fashion', 
      stock: 30, 
      diskonProduk: 15
      );
      product2.tampilkanInfo();
      print('Harga setelah diskon: ${product2.hitungHargaFinal()}');
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