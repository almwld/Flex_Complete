import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../models/product/product_category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  final List<ProductCategory> categories = [
    ProductCategory(id: '1', name: 'المطاعم', nameAr: 'المطاعم', icon: 'restaurant', marketCount: 25),
    ProductCategory(id: '2', name: 'الكافيهات', nameAr: 'الكافيهات', icon: 'local_cafe', marketCount: 18),
    ProductCategory(id: '3', name: 'السوبرماركت', nameAr: 'السوبرماركت', icon: 'shopping_cart', marketCount: 32),
    ProductCategory(id: '4', name: 'الصيدليات', nameAr: 'الصيدليات', icon: 'local_pharmacy', marketCount: 15),
    ProductCategory(id: '5', name: 'المولات', nameAr: 'المولات', icon: 'shopping_bag', marketCount: 8),
    ProductCategory(id: '6', name: 'الإلكترونيات', nameAr: 'الإلكترونيات', icon: 'devices', marketCount: 12),
    ProductCategory(id: '7', name: 'الملابس', nameAr: 'الملابس', icon: 'checkroom', marketCount: 45),
    ProductCategory(id: '8', name: 'المكياج', nameAr: 'المكياج', icon: 'face', marketCount: 20),
    ProductCategory(id: '9', name: 'الرياضة', nameAr: 'الرياضة', icon: 'sports_soccer', marketCount: 10),
    ProductCategory(id: '10', name: 'الكتب', nameAr: 'الكتب', icon: 'menu_book', marketCount: 6),
    ProductCategory(id: '11', name: 'الألعاب', nameAr: 'الألعاب', icon: 'toys', marketCount: 14),
    ProductCategory(id: '12', name: 'الأثاث', nameAr: 'الأثاث', icon: 'chair', marketCount: 9),
  ];

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'restaurant': return Icons.restaurant;
      case 'local_cafe': return Icons.local_cafe;
      case 'shopping_cart': return Icons.shopping_cart;
      case 'local_pharmacy': return Icons.local_pharmacy;
      case 'shopping_bag': return Icons.shopping_bag;
      case 'devices': return Icons.devices;
      case 'checkroom': return Icons.checkroom;
      case 'face': return Icons.face;
      case 'sports_soccer': return Icons.sports_soccer;
      case 'menu_book': return Icons.menu_book;
      case 'toys': return Icons.toys;
      case 'chair': return Icons.chair;
      default: return Icons.category;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.getBackgroundColor(context),
      appBar: AppBar(
        title: const Text('الفئات'),
        backgroundColor: AppColors.getSurfaceColor(context),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.9,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.getCardColor(context),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.getBorderColor(context).withOpacity(0.5)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: AppColors.goldColor.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _getIconData(category.icon),
                      color: AppColors.goldColor,
                      size: 30,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    category.localizedName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${category.marketCount} متجر',
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
