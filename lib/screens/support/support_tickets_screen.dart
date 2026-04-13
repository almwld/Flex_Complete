import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../widgets/common/custom_app_bar.dart';

/// صفحة تذاكر الدعم
class SupportTicketsScreen extends StatelessWidget {
  const SupportTicketsScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> _tickets = [
    {'id': '#1001', 'subject': 'مشكلة في الطلب', 'status': 'مفتوح', 'date': 'منذ ساعة'},
    {'id': '#1002', 'subject': 'استفسار عن الشحن', 'status': 'مغلق', 'date': 'منذ يوم'},
    {'id': '#1003', 'subject': 'طلب استرجاع', 'status': 'قيد المراجعة', 'date': 'منذ 3 أيام'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppColors.backgroundDark
          : AppColors.backgroundGrey,
      appBar: CustomAppBar(
        title: 'الدعم الفني',
        showBackButton: true,
      ),
      body: Column(
        children: [
          // إنشاء تذكرة جديدة
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _showCreateTicketDialog(context),
                icon: const Icon(Icons.add),
                label: const Text('إنشاء تذكرة جديدة'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.goldColor,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ),
          // قائمة التذاكر
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _tickets.length,
              itemBuilder: (context, index) {
                final ticket = _tickets[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.goldColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.confirmation_number, color: AppColors.goldColor),
                    ),
                    title: Text(ticket['subject'], style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('${ticket['id']} - ${ticket['date']}'),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: _getStatusColor(ticket['status']).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        ticket['status'],
                        style: TextStyle(
                          color: _getStatusColor(ticket['status']),
                          fontSize: 12,
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'مفتوح':
        return AppColors.info;
      case 'مغلق':
        return AppColors.success;
      case 'قيد المراجعة':
        return AppColors.warning;
      default:
        return AppColors.textSecondary;
    }
  }

  void _showCreateTicketDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'إنشاء تذكرة جديدة',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            TextField(
              decoration: InputDecoration(
                labelText: 'الموضوع',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'الوصف',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.goldColor),
                child: const Text('إرسال', style: TextStyle(color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
