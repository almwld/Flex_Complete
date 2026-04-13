import 'package:flutter/material.dart';

/// شاشة المنتجات المعروضة مؤخراً
class RecentlyViewedScreen extends StatelessWidget {
  const RecentlyViewedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> _recentProducts = List.generate(10, (index) {
      return {
        'id': '$index',
        'name': 'منتج ${index + 1}',
        'price': 100000 + (index * 25000),
        'oldPrice': index % 2 == 0 ? 150000 + (index * 25000) : null,
        'rating': 4.0 + (index % 10) * 0.1,
        'reviews': 50 + (index * 15),
        'image': 'https://picsum.photos/seed/$index/200/200',
        'viewedAt': DateTime.now().subtract(Duration(hours: index * 3)),
      };
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('المشاهدة حديثاً'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('مسح السجل'),
                  content: const Text('هل تريد مسح جميع المنتجات المعروضة حديثاً؟'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('إلغاء'),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('مسح'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: _recentProducts.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.history, size: 80, color: Colors.grey[300]),
                  const SizedBox(height: 16),
                  Text(
                    'لا توجد منتجات',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: _recentProducts.length,
              itemBuilder: (context, index) {
                final product = _recentProducts[index];
                return _ProductCard(
                  name: product['name'],
                  price: product['price'],
                  oldPrice: product['oldPrice'],
                  rating: product['rating'],
                  reviews: product['reviews'],
                  imageUrl: product['image'],
                  onTap: () {
                    Navigator.pushNamed(context, '/product', arguments: product['id']);
                  },
                );
              },
            ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final String name;
  final int price;
  final int? oldPrice;
  final double rating;
  final int reviews;
  final String imageUrl;
  final VoidCallback onTap;

  const _ProductCard({
    required this.name,
    required this.price,
    this.oldPrice,
    required this.rating,
    required this.reviews,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[200],
                        child: const Icon(Icons.image),
                      );
                    },
                  ),
                  if (oldPrice != null)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          '${((oldPrice! - price) / oldPrice! * 100).toInt()}%',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, size: 14, color: Colors.amber[700]),
                      Text(' ${rating.toStringAsFixed(1)} ($reviews)'),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$price ر.ي',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  if (oldPrice != null)
                    Text(
                      '$oldPrice ر.ي',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey[500],
                        fontSize: 11,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
