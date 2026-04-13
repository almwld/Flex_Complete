import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../widgets/common/custom_app_bar.dart';

/// صفحة إدارة الطلبات
class AdminOrders extends StatelessWidget {
  const AdminOrders({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> _orders = [
    {'id': '#1234', 'customer': 'أحمد محمد', 'total': '25,000', 'status': 'معلق'},
    {'id': '#1235', 'customer': 'فاطمة علي', 'total': '45,000', 'status': 'مؤكد'},
    {'id': '#1236', 'customer': 'محمد خالد', 'total': '15,000', 'status': 'منتهي'},
    {'id': '#1237', 'customer': 'سارة أحمد', 'total': '35,000', 'status': 'ملغي'},
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? AppColors.backgroundDark
            : AppColors.backgroundGrey,
        appBar: CustomAppBar(
          title: 'إدارة الطلبات',
          showBackButton: true,
        ),
        body: Column(
          children: [
            // تبويبات الطلبات
            Container(
              color: Colors.white,
              child: TabBar(
                isScrollable: true,
                labelColor: AppColors.goldColor,
                unselectedLabelColor: AppColors.textSecondary,
                indicatorColor: AppColors.goldColor,
                tabs: const [
                  Tab(text: 'الكل'),
                  Tab(text: 'معلق'),
                  Tab(text: 'مؤكد'),
                  Tab(text: 'منتهي'),
                  Tab(text: 'ملغي'),
                ],
              ),
            ),
            // قائمة الطلبات
            Expanded(
              child: TabBarView(
                children: [
                  _buildOrdersList(_orders),
                  _buildOrdersList(_orders.where((o) => o['status'] == 'معلق').toList()),
                  _buildOrdersList(_orders.where((o) => o['status'] == 'مؤكد').toList()),
                  _buildOrdersList(_orders.where((o) => o['status'] == 'منتهي').toList()),
                  _buildOrdersList(_orders.where((o) => o['status'] == 'ملغي').toList()),
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
      return const Center(
        child: Text('لا توجد طلبات'),
      );
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
                      color: _getStatusColor(order['status']).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      order['status'],
                      style: TextStyle(
                        color: _getStatusColor(order['status']),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(Icons.person, size: 16, color: AppColors.textSecondary),
                  const SizedBox(width: 4),
                  Text(order['customer']),
                  const Spacer(),
                  Text(
                    '${order['total']} ر.ي',
                    style: const TextStyle(
                      color: AppColors.goldColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.goldColor,
                      ),
                      child: const Text('عرض'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.goldColor,
                      ),
                      child: const Text('تعديل', style: TextStyle(color: Colors.black)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'معلق':
        return AppColors.warning;
      case 'مؤكد':
        return AppColors.info;
      case 'منتهي':
        return AppColors.success;
      case 'ملغي':
        return AppColors.error;
      default:
        return AppColors.textSecondary;
    }
  }
}
