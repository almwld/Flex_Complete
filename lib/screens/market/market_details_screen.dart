import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../widgets/common/section_header.dart';
import '../../widgets/common/market_card.dart';
import '../../models/market/market_model.dart';

class MarketDetailsScreen extends StatelessWidget {
  final MarketModel market;

  const MarketDetailsScreen({super.key, required this.market});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: AppColors.goldGradient,
                ),
                child: Center(
                  child: Icon(
                    Icons.store,
                    size: 80,
                    color: Colors.white.withValues(alpha: 0.5),
                  ),
                ),
              ),
            ),
            backgroundColor: AppColors.goldColor,
            foregroundColor: Colors.white,
            actions: [
              IconButton(
                icon: Icon(
                  market.isFavorite ? Icons.favorite : Icons.favorite_border,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              market.name,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: market.isOpen
                                  ? Colors.green.withValues(alpha: 0.1)
                                  : Colors.red.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              market.isOpen ? 'مفتوح' : 'مغلق',
                              style: TextStyle(
                                color: market.isOpen ? Colors.green : Colors.red,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 20),
                          const SizedBox(width: 4),
                          Text(
                            market.rating.toStringAsFixed(1),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            ' (${market.reviewsCount} تقييم)',
                            style: TextStyle(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: AppColors.textSecondary, size: 18),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              market.address,
                              style: TextStyle(color: AppColors.textSecondary),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.clock, color: AppColors.textSecondary, size: 18),
                          const SizedBox(width: 4),
                          Text(
                            '7:00 ص - 11:00 م',
                            style: TextStyle(color: AppColors.textSecondary),
                          ),
                        ],
                      ),
                      if (market.isDeliveryAvailable) ...[
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.delivery_dining, color: AppColors.goldColor, size: 18),
                            const SizedBox(width: 4),
                            Text(
                              'خدمة التوصيل متاحة',
                              style: TextStyle(color: AppColors.goldColor),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                Container(
                  height: 80,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildQuickAction(Icons.phone, 'اتصل'),
                      _buildQuickAction(Icons.map, 'الخريطة'),
                      _buildQuickAction(Icons.delivery_dining, 'تتبع'),
                      _buildQuickAction(Icons.share, 'مشاركة'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const SectionHeader(
                  title: 'المنتجات',
                  subtitle: '${market.productsCount} منتج',
                  icon: Icons.shopping_bag,
                ),
                const SizedBox(height: 8),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColors.cardColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Icon(Icons.shopping_bag, color: AppColors.goldColor),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: AppColors.goldColor,
        icon: const Icon(Icons.shopping_cart, color: Colors.white),
        label: const Text('أضف للسلة', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildQuickAction(IconData icon, String label) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderColor),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: AppColors.goldColor),
              const SizedBox(height: 4),
              Text(
                label,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
