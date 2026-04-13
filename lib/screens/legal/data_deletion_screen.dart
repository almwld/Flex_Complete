import 'package:flutter/material.dart';

/// شاشة حذف البيانات
class DataDeletionScreen extends StatefulWidget {
  const DataDeletionScreen({super.key});
  @override
  State<DataDeletionScreen> createState() => _DataDeletionScreenState();
}

class _DataDeletionScreenState extends State<DataDeletionScreen> {
  bool _confirmDelete = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('حذف البيانات')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.red[200]!),
              ),
              child: Row(
                children: [
                  Icon(Icons.warning_amber, color: Colors.red[700], size: 32),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('تحذير!', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red[700], fontSize: 18)),
                        const SizedBox(height: 4),
                        Text('هذا الإجراء لا يمكن التراجع عنه', style: TextStyle(color: Colors.red[700])),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('ما سيتم حذفه:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildDeleteItem(Icons.person, 'المعلومات الشخصية', 'الاسم، البريد، الهاتف'),
            _buildDeleteItem(Icons.shopping_cart, 'السلة والطلبات', 'سجل الطلبات والمفضلات'),
            _buildDeleteItem(Icons.account_balance_wallet, 'بيانات المحفظة', 'المعاملات والرصيد'),
            _buildDeleteItem(Icons.notifications, 'الإشعارات', 'سجل الإشعارات'),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.orange[50], borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.info_outline, color: Colors.orange[700]),
                      const SizedBox(width: 8),
                      Text('ما لن يتم حذفه:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange[700])),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text('• سجلات المعاملات المالية\n• البيانات المطلوبة قانونياً\n• معلومات الدردشة مع خدمة العملاء', style: TextStyle(color: Colors.orange[800], height: 1.6)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            CheckboxListTile(
              value: _confirmDelete,
              onChanged: (value) => setState(() => _confirmDelete = value ?? false),
              title: const Text('أفهم أن هذا الإجراء لا يمكن التراجع عنه', style: TextStyle(fontWeight: FontWeight.w500)),
              activeColor: const Color(0xFFD4AF37),
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _confirmDelete ? _requestDeletion : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  disabledBackgroundColor: Colors.grey[300],
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('طلب حذف البيانات', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeleteItem(IconData icon, String title, String description) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey[200]!)),
      child: Row(
        children: [
          Icon(icon, color: Colors.red[400], size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
                Text(description, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.delete_outline, color: Colors.red),
        ],
      ),
    );
  }

  void _requestDeletion() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تأكيد الحذف'),
        content: const Text('هل أنت متأكد من رغبتك في حذف جميع بياناتك؟\n\nسيتم إرسال بريد إلكتروني للتأكيد.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('إلغاء')),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تم إرسال طلب الحذف.'), backgroundColor: Color(0xFFD4AF37)),
              );
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('تأكيد الحذف'),
          ),
        ],
      ),
    );
  }
}
