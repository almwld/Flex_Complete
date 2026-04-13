import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/app_colors.dart';
import '../../widgets/common/custom_app_bar.dart';

/// صفحة قسم الإلكترونيات
class ElectronicsScreen extends StatelessWidget {
  const ElectronicsScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> _products = [
    {'name': 'آيفون 15 برو', 'price': '2,500', 'image': '📱'},
    {'name': 'سامسونج S24', 'price': '2,200', 'image': '📱'},
    {'name': 'لابتوب ماك بوك', 'price': '4,500', 'image': '💻'},
    {'name': 'لابتوب ديل', 'price': '1,800', 'image': '💻'},
    {'name': 'آيباد برو', 'price': '2,000', 'image': '📲'},
    {'name': 'تلفزيون سامسونج', 'price': '1,500', 'image': '📺'},
    {'name': 'بلاي ستيشن 5', 'price': '1,200', 'image': '🎮'},
    {'name': 'كاميرا نيكون', 'price': '2,800', 'image': '📷'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppColors.backgroundDark
          : AppColors.backgroundGrey,
      appBar: CustomAppBar(
        title: 'الإلكترونيات',
        showBackButton: true,
      ),
      body: Column(
        children: [
          // فلاتر
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildFilterChip('الكل', true),
                _buildFilterChip('هواتف', false),
                _buildFilterChip('أجهزة لوحية', false),
                _buildFilterChip('حاسبات', false),
                _buildFilterChip('تلفزيونات', false),
              ],
            ),
          ),
          // المنتجات
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: _products.length,
              itemBuilder: (context, index) {
                final product = _products[index];
                return _buildProductCard(product)
                    .animate()
                    .fadeIn(delay: Duration(milliseconds: 100 * index));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String name, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      child: Material(
        color: isSelected ? AppColors.goldColor : Colors.white,
        borderRadius: BorderRadius.circular(25),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(25),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              name,
              style: TextStyle(
                color: isSelected ? Colors.black : AppColors.textSecondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // صورة المنتج
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.goldColor.withOpacity(0.1),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Center(
                child: Text(product['image'], style: const TextStyle(fontSize: 50)),
              ),
            ),
          ),
          // معلومات المنتج
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['name'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${product['price']}',
                  style: const TextStyle(
                    color: AppColors.goldColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.goldColor,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    child: const Text('إضافة', style: TextStyle(color: Colors.black)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
