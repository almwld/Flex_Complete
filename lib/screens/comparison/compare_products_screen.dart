import 'package:flutter/material.dart';

/// شاشة مقارنة المنتجات
class CompareProductsScreen extends StatefulWidget {
  const CompareProductsScreen({super.key});

  @override
  State<CompareProductsScreen> createState() => _CompareProductsScreenState();
}

class _CompareProductsScreenState extends State<CompareProductsScreen> {
  final List<Map<String, dynamic>> _products = [
    {
      'id': '1',
      'name': 'سماعة سامسونج Galaxy Buds',
      'image': 'https://picsum.photos/seed/1/200/200',
      'price': 350000,
      'rating': 4.5,
      'reviews': 1250,
      'brand': 'سامسونج',
      'color': 'أسود',
      'battery': '6 ساعات',
      'warranty': 'سنة',
    },
    {
      'id': '2',
      'name': 'سماعة أبل AirPods Pro',
      'image': 'https://picsum.photos/seed/2/200/200',
      'price': 450000,
      'rating': 4.8,
      'reviews': 2500,
      'brand': 'أبل',
      'color': 'أبيض',
      'battery': '4.5 ساعات',
      'warranty': 'سنة',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مقارنة المنتجات'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250,
              child: Row(
                children: [
                  const SizedBox(width: 100),
                  ...List.generate(_products.length, (index) {
                    return Expanded(
                      child: Column(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              setState(() {
                                _products.removeAt(index);
                              });
                            },
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              _products[index]['image'],
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: 120,
                                  height: 120,
                                  color: Colors.grey[200],
                                  child: const Icon(Icons.image),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              _products[index]['name'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${_products[index]['price']} ر.ي',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  if (_products.length < 4)
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: 40,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'إضافة منتج',
                                style: TextStyle(color: Colors.grey[500]),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const Divider(),
            _ComparisonRow('العلامة التجارية', _products.map((p) => p['brand']).toList()),
            _ComparisonRow('التقييم', _products.map((p) => '${p['rating']} (${p['reviews']})').toList()),
            _ComparisonRow('اللون', _products.map((p) => p['color']).toList()),
            _ComparisonRow('عمر البطارية', _products.map((p) => p['battery']).toList()),
            _ComparisonRow('الضمان', _products.map((p) => p['warranty']).toList()),
            _ComparisonRow('السعر', _products.map((p) => '${p['price']} ر.ي').toList()),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: _products.map((product) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/product', arguments: product['id']);
                        },
                        child: const Text('عرض التفاصيل'),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ComparisonRow extends StatelessWidget {
  final String label;
  final List<dynamic> values;

  const _ComparisonRow(this.label, this.values);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[200]!),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
              ),
            ),
          ),
          ...values.map((value) {
            return Expanded(
              child: Text(
                value.toString(),
                textAlign: TextAlign.center,
              ),
            );
          }),
          if (values.length < 4)
            Expanded(
              child: Text(
                '-',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[400]),
              ),
            ),
        ],
      ),
    );
  }
}
