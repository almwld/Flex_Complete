import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/app_colors.dart';
import '../../widgets/common/custom_app_bar.dart';

/// صفحة قسم العقارات
class RealEstateScreen extends StatelessWidget {
  const RealEstateScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> _properties = [
    {
      'title': 'شقة فاخرة',
      'location': 'صنعاء، اليمن',
      'price': '50,000,000',
      'type': 'شقة',
      'size': '150 م²',
      'beds': 3,
      'baths': 2,
    },
    {
      'title': 'فيلا راقية',
      'location': 'عدن، اليمن',
      'price': '120,000,000',
      'type': 'فيلا',
      'size': '400 م²',
      'beds': 5,
      'baths': 4,
    },
    {
      'title': 'محل تجاري',
      'location': 'تعز، اليمن',
      'price': '25,000,000',
      'type': 'محل',
      'size': '80 م²',
      'beds': 0,
      'baths': 1,
    },
    {
      'title': 'أرض للبناء',
      'location': 'الحديدة، اليمن',
      'price': '15,000,000',
      'type': 'أرض',
      'size': '500 م²',
      'beds': 0,
      'baths': 0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppColors.backgroundDark
          : AppColors.backgroundGrey,
      appBar: CustomAppBar(
        title: 'العقارات',
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
                _buildFilterChip('شقق', false),
                _buildFilterChip('فيلات', false),
                _buildFilterChip('أراضي', false),
                _buildFilterChip('محلات', false),
              ],
            ),
          ),
          // العقارات
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _properties.length,
              itemBuilder: (context, index) {
                final property = _properties[index];
                return _buildPropertyCard(property)
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

  Widget _buildPropertyCard(Map<String, dynamic> property) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
          // صورة العقار
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: AppColors.goldColor.withOpacity(0.2),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Center(
              child: Icon(
                Icons.home,
                size: 60,
                color: AppColors.goldColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        property['title'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.goldColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        property['type'],
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16, color: AppColors.textSecondary),
                    const SizedBox(width: 4),
                    Text(
                      property['location'],
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    if (property['beds'] > 0) ...[
                      Icon(Icons.bed, size: 16, color: AppColors.textSecondary),
                      const SizedBox(width: 4),
                      Text('${property['beds']}', style: const TextStyle(color: AppColors.textSecondary)),
                      const SizedBox(width: 16),
                    ],
                    if (property['baths'] > 0) ...[
                      Icon(Icons.bathtub, size: 16, color: AppColors.textSecondary),
                      const SizedBox(width: 4),
                      Text('${property['baths']}', style: const TextStyle(color: AppColors.textSecondary)),
                      const SizedBox(width: 16),
                    ],
                    Icon(Icons.square_foot, size: 16, color: AppColors.textSecondary),
                    const SizedBox(width: 4),
                    Text(property['size'], style: const TextStyle(color: AppColors.textSecondary)),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  '${property['price']} ر.ي',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.goldColor,
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
