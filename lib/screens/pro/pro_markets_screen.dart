import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../widgets/common/custom_app_bar.dart';

class ProMarketsScreen extends StatelessWidget {
  const ProMarketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final markets = [
      {'name': 'الأسواق اليمنية', 'count': 1250, 'icon': Icons.store, 'color': AppColors.goldColor},
      {'name': 'المولات', 'count': 85, 'icon': Icons.local_mall, 'color': AppColors.primaryColor},
      {'name': 'المقاهي', 'count': 420, 'icon': Icons.local_cafe, 'color': AppColors.warning},
      {'name': 'الاستراحات', 'count': 156, 'icon': Icons.beach_access, 'color': AppColors.info},
      {'name': 'الفنادق', 'count': 95, 'icon': Icons.hotel, 'color': AppColors.secondaryColor},
      {'name': 'المطاعم', 'count': 680, 'icon': Icons.restaurant, 'color': AppColors.error},
      {'name': 'الإلكترونيات', 'count': 320, 'icon': Icons.devices, 'color': AppColors.primaryColor},
      {'name': 'السيارات', 'count': 180, 'icon': Icons.directions_car, 'color': AppColors.info},
      {'name': 'العقارات', 'count': 450, 'icon': Icons.apartment, 'color': AppColors.goldDark},
      {'name': 'الأزياء', 'count': 550, 'icon': Icons.checkroom, 'color': AppColors.warning},
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppColors.backgroundDark
          : AppColors.backgroundGrey,
      appBar: CustomAppBar(
        title: 'إدارة الأسواق',
        showBackButton: true,
        showNotification: false,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: markets.length,
        itemBuilder: (context, index) {
          final market = markets[index];
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.getCardColor(context),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: (market['color'] as Color).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    market['icon'] as IconData,
                    color: market['color'] as Color,
                    size: 32,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  market['name'] as String,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  '${market['count']} سوق',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
