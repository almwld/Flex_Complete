import 'package:flutter/material.dart';

/// شاشة الشحن والتوصيل
class ShippingScreen extends StatefulWidget {
  const ShippingScreen({super.key});

  @override
  State<ShippingScreen> createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen> {
  String _selectedAddress = '1';
  String _selectedShipping = 'standard';

  final List<Map<String, dynamic>> _addresses = [
    {
      'id': '1',
      'name': 'أحمد محمد',
      'phone': '+967 777 123 456',
      'city': 'صنعاء',
      'area': 'شارع الزبيري',
      'isDefault': true,
    },
    {
      'id': '2',
      'name': 'محمد علي',
      'phone': '+967 733 987 654',
      'city': 'عدن',
      'area': 'خور مكسر',
      'isDefault': false,
    },
  ];

  final List<Map<String, dynamic>> _shippingMethods = [
    {
      'id': 'standard',
      'name': 'توصيل عادي',
      'duration': '3-5 أيام عمل',
      'price': 25000,
      'icon': Icons.local_shipping,
    },
    {
      'id': 'express',
      'name': 'توصيل سريع',
      'duration': '1-2 أيام عمل',
      'price': 50000,
      'icon': Icons.speed,
    },
    {
      'id': 'same_day',
      'name': 'توصيل اليوم',
      'duration': 'خلال 4 ساعات',
      'price': 100000,
      'icon': Icons.flash_on,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الشحن والتوصيل'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'عنوان التوصيل',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ..._addresses.map((address) {
              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: RadioListTile<String>(
                  value: address['id'],
                  groupValue: _selectedAddress,
                  onChanged: (value) {
                    setState(() => _selectedAddress = value!);
                  },
                  title: Row(
                    children: [
                      Text(address['name']),
                      if (address['isDefault'])
                        Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'افتراضي',
                            style: TextStyle(
                              fontSize: 11,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(address['phone']),
                      Text('${address['city']}, ${address['area']}'),
                    ],
                  ),
                ),
              );
            }),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('إضافة عنوان جديد'),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'طريقة الشحن',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ..._shippingMethods.map((method) {
              final isSelected = _selectedShipping == method['id'];
              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                color: isSelected
                    ? Theme.of(context).primaryColor.withOpacity(0.05)
                    : null,
                child: ListTile(
                  leading: Icon(
                    method['icon'],
                    color: isSelected
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                  ),
                  title: Text(
                    method['name'],
                    style: TextStyle(
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  subtitle: Text(method['duration']),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${method['price']} ر.ي',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Radio<String>(
                        value: method['id'],
                        groupValue: _selectedShipping,
                        onChanged: (value) {
                          setState(() => _selectedShipping = value!);
                        },
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() => _selectedShipping = method['id']);
                  },
                ),
              );
            }),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/payment');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('متابعة للدفع'),
            ),
          ],
        ),
      ),
    );
  }
}
