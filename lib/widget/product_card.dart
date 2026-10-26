import 'package:flutter/material.dart';
import '../models/product.dart'; // Sesuaikan lokasi model Product kamu

// Widget Custom 1: PriceLabel (Stateless)
class PriceLabel extends StatelessWidget {
  final double price;

  const PriceLabel({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Rp ${price.toStringAsFixed(0)}',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.green,
        fontSize: 16,
      ),
    );
  }
}

// Widget Custom 2: StockBadge (Stateless)
class StockBadge extends StatelessWidget {
  final int stock;

  const StockBadge({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    String label;
    Color color;

    if (stock > 5) {
      label = 'Tersedia';
      color = Colors.blue;
    } else if (stock > 0) {
      label = 'Stok Terbatas';
      color = Colors.orange;
    } else {
      label = 'Habis';
      color = Colors.red;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color),
      ),
      child: Text(
        label,
        style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }
}

// ProductCard (StatefulWidget untuk fitur Favorit & Lifecycle Observation)
class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    print('[Lifecycle] initState() dipanggil untuk ${widget.product.name}');
  }

  @override
  Widget build(BuildContext context) {
    print('[Lifecycle] build() dipanggil untuk ${widget.product.name}');
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.product.name,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                    print('[State] Status favorit ${widget.product.name} berubah jadi: $isFavorite');
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            PriceLabel(price: widget.product.price),
            const SizedBox(height: 8),
            StockBadge(stock: widget.product.stock),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    print('[Lifecycle] dispose() dipanggil untuk ${widget.product.name}');
    super.dispose();
  }
}