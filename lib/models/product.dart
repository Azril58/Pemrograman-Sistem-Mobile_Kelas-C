// ==========================================
// LANGKAH 5 & TUGAS MANDIRI: Class & OOP
// ==========================================

// Class Utama Product
class Product {
  final String id;
  final String name;
  final double price;
  final String? imageUrl;   // Nullable (opsional)
  final String category;
  int stock;               // Boleh diubah saat transaksi/restock
  final String? description; // Nullable (opsional)

  // Constructor dengan named parameter & required
  Product({
    required this.id,
    required this.name,
    required this.price,
    this.imageUrl,
    required this.category,
    required this.stock,
    this.description,
  });

  // Method Tambahan (Tugas Mandiri 1): Cek Status Stok
  String getStatusStok() {
    if (stock <= 0) {
      return 'Habis';
    } else if (stock <= 5) {
      return 'Stok Terbatas';
    } else {
      return 'Tersedia';
    }
  }

  // Method pendukung cetak info
  void printInfo() {
    print('[$id] $name | Harga: Rp$price | Stok: $stock (${getStatusStok()})');
  }
}

// Class Turunan (Inheritance) - DiscountedProduct
class DiscountedProduct extends Product {
  double discountPercent;

  DiscountedProduct({
    required super.id,
    required super.name,
    required super.price,
    super.imageUrl,
    required super.category,
    required super.stock,
    super.description,
    required this.discountPercent,
  });

  // Method menghitung harga akhir setelah diskon
  double getFinalPrice() {
    return price - (price * (discountPercent / 100));
  }
}

// ==========================================
// LANGKAH 4 & TUGAS MANDIRI: Functions
// ==========================================

// Function biasa & Named Parameter dengan Default Value
double hitungHargaSetelahDiskon(double harga, {double persenDiskon = 0}) {
  return harga - (harga * (persenDiskon / 100));
}

// Arrow Function
String formatRupiah(double nominal) => 'Rp${nominal.toStringAsFixed(0)}';

// Function Tugas Mandiri 3: Hitung Total Belanja
double hitungTotalBelanja(List<Product> keranjang) {
  double total = 0;
  for (var item in keranjang) {
    total += item.price;
  }
  return total;
}

// ==========================================
// MAIN FUNCTION (Menjalankan Seluruh Praktikum)
// ==========================================
void main() {
  print('=== LANGKAH 1: Variabel & Tipe Data ===');
  const String namaToko = 'TokoKita Utama';
  final String idProduk = 'P01';
  var namaProduk = 'Laptop Asus';
  int stok = 10;
  double harga = 8500000.0;
  bool statusTersedia = true;
  List<String> kategori = ['Elektronik', 'Fashion', 'Makanan'];
  Map<String, dynamic> rawProduct = {'id': idProduk, 'name': namaProduk, 'price': harga};

  print('Toko: $namaToko');
  print('Produk: $namaProduk - Stok: $stok - Harga: $harga - Status: $statusTersedia');
  print('Kategori: $kategori');
  print('Raw Map: $rawProduct\n');

  print('=== LANGKAH 2: Operator ===');
  double total3Item = harga * 3;
  int sisaStok = stok - 1;
  bool layakTampil = stok > 0 && harga > 0;
  print('Total 3 item: $total3Item');
  print('Sisa stok: $sisaStok');
  print('Status Layak Tampil: $layakTampil\n');

  print('=== LANGKAH 3: Control Flow ===');
  // If-Else Status Stok
  if (stok <= 0) {
    print('Status Stok: Habis');
  } else if (stok <= 5) {
    print('Status Stok: Stok Terbatas');
  } else {
    print('Status Stok: Tersedia');
  }

  // Switch-case Diskon Kategori
  String kat = 'Elektronik';
  switch (kat) {
    case 'Elektronik':
      print('Diskon Kategori Elektronik: 10%');
      break;
    case 'Fashion':
      print('Diskon Kategori Fashion: 15%');
      break;
    default:
      print('Diskon Kategori: 0%');
  }
  print('');

  print('=== LANGKAH 4: Function ===');
  print('Harga diskon (10%): ${hitungHargaSetelahDiskon(100000, persenDiskon: 10)}');
  print('Harga tanpa diskon: ${hitungHargaSetelahDiskon(100000)}');
  print('Format Arrow Function: ${formatRupiah(8500000)}\n');

  print('=== LANGKAH 5 & TUGAS MANDIRI: OOP & List Dummy ===');
  // List 8 produk contoh (Tugas Mandiri 2)
  List<Product> dummyProducts = [
    Product(id: 'P01', name: 'Laptop Asus', price: 8500000, category: 'Elektronik', stock: 10, description: 'Laptop RAM 8GB'),
    Product(id: 'P02', name: 'Mouse Wireless', price: 150000, category: 'Elektronik', stock: 3),
    Product(id: 'P03', name: 'Keyboard Mechanical', price: 450000, category: 'Elektronik', stock: 0),
    Product(id: 'P04', name: 'Kaos Polos Cotton', price: 75000, category: 'Fashion', stock: 25),
    Product(id: 'P05', name: 'Jaket Denim', price: 250000, category: 'Fashion', stock: 2),
    Product(id: 'P06', name: 'Kopi Susu Gula Aren', price: 20000, category: 'Makanan', stock: 50),
    Product(id: 'P07', name: 'Keripik Pedas', price: 15000, category: 'Makanan', stock: 0),
    Product(id: 'P08', name: 'Monitor 24 Inch', price: 1800000, category: 'Elektronik', stock: 7, description: 'IPS Full HD'),
  ];

  for (var p in dummyProducts) {
    p.printInfo();
  }

  // Testing Class Turunan (DiscountedProduct)
  print('\n-- Pengujian DiscountedProduct --');
  var diskonLaptop = DiscountedProduct(
    id: 'DP01',
    name: 'Laptop Gaming',
    price: 12000000,
    category: 'Elektronik',
    stock: 5,
    discountPercent: 20,
  );
  print('Produk Diskon: ${diskonLaptop.name}');
  print('Harga Awal: ${formatRupiah(diskonLaptop.price)}');
  print('Harga Setelah Diskon 20%: ${formatRupiah(diskonLaptop.getFinalPrice())}');

  // Testing Function Hitung Total Belanja
  print('\n-- Pengujian Total Belanja Keranjang --');
  List<Product> keranjang = [dummyProducts[0], dummyProducts[1], dummyProducts[3]];
  print('Total Keranjang: ${formatRupiah(hitungTotalBelanja(keranjang))}');
}