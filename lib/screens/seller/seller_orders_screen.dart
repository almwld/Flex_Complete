import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../widgets/common/custom_app_bar.dart';

/// صفحة طلبات البائع
class SellerOrdersScreen extends StatelessWidget {
  const SellerOrdersScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> _orders = [
    {'id': '#1234', 'product': 'آيفون 15 برو', 'customer': 'أحمد محمد', 'total': '25,000', 'status': 'جديد'},
    {'id': '#1235', 'product': 'سامسونج S24', 'customer': 'فاطمة علي', 'total': '22,000', 'status': 'قيد التجهيز'},
    {'id': '#1236', 'product': 'لابتوب ماك', 'customer': 'محمد خالد', 'total': '45,000', 'status': 'قيد التوصيل'},
    {'id': '#1237', 'product': 'آيباد', 'customer': 'سارة أحمد', 'total': '20,000', 'status': 'تم التوصيل'},
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? AppColors.backgroundDark
            : AppColors.backgroundGrey,
        appBar: CustomAppBar(
          title: 'طلباتي',
          showBackButton: true,
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              child: TabBar(
                isScrollable: true,
                labelColor: AppColors.goldColor,
                unselectedLabelColor: AppColors.textSecondary,
                indicatorColor: AppColors.goldColor,
                tabs: const [
                  Tab(text: 'الجديدة'),
                  Tab(text: 'قيد التجهيز'),
                  Tab(text: 'قيد التوصيل'),
                  Tab(text: 'المنتهية'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildOrdersList(_orders.where((o) => o['status'] == 'جديد').toList()),
                  _buildOrdersList(_orders.where((o) => o['status'] == 'قيد التجهيز').toList()),
                  _buildOrdersList(_orders.where((o) => o['status'] == 'قيد التوصيل').toList()),
                  _buildOrdersList(_orders.where((o) => o['status'] == 'تم التوصيل').toList()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrdersList(List<Map<String, dynamic>> orders) {
    if (orders.isEmpty) {
      return const Center(child: Text('لا توجد طلبات'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    order['id'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.goldColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      order['status'],
                      style: const TextStyle(
                        color: AppColors.goldColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(order['product'], style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.person, size: 14, color: AppColors.textSecondary),
                  const SizedBox(width: 4),
                  Text(order['customer'], style: const TextStyle(color: AppColors.textSecondary)),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${order['total']} ر.ي',
                    style: const TextStyle(
                      color: AppColors.goldColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.goldColor,
                    ),
                    child: const Text('تحديث الحالة', style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
