import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/app_colors.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/common/product_card.dart';

/// صفحة قسم الزراعة
class AgricultureScreen extends StatefulWidget {
  const AgricultureScreen({Key? key}) : super(key: key);

  @override
  State<AgricultureScreen> createState() => _AgricultureScreenState();
}

class _AgricultureScreenState extends State<AgricultureScreen> {
  final List<Map<String, dynamic>> _products = [
    {'name': 'قمح', 'price': '500', 'unit': 'كجم', 'image': '🌾'},
    {'name': 'ذرة', 'price': '300', 'unit': 'كجم', 'image': '🌽'},
    {'name': 'بُن', 'price': '2000', 'unit': 'كجم', 'image': '☕'},
    {'name': 'تمر', 'price': '800', 'unit': 'كجم', 'image': '🌴'},
    {'name': 'عسل', 'price': '2500', 'unit': 'كجم', 'image': '🍯'},
    {'name': 'حلبة', 'price': '400', 'unit': 'كجم', 'image': '🌿'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppColors.backgroundDark
          : AppColors.backgroundGrey,
      appBar: CustomAppBar(
        title: 'الزراعة',
        showBackButton: true,
      ),
      body: Column(
        children: [
          // الفئات الفرعية
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildCategoryChip('الكل', true),
                _buildCategoryChip('محاصيل', false),
                _buildCategoryChip('فواكه', false),
                _buildCategoryChip('خضروات', false),
                _buildCategoryChip('أعشاب', false),
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
                return ProductCard(
                  name: product['name'],
                  price: product['price'],
                  unit: product['unit'],
                  image: product['image'],
                  onTap: () {},
                ).animate().fadeIn(delay: Duration(milliseconds: 100 * index));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String name, bool isSelected) {
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
}
