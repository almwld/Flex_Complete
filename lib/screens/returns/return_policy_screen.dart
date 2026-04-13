import 'package:flutter/material.dart';

/// شاشة سياسة الإرجاع
class ReturnPolicyScreen extends StatelessWidget {
  const ReturnPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('سياسة الإرجاع والاستبدال'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.green.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.verified, color: Colors.green[700], size: 40),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ضمان الاسترجاع',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green[700],
                              fontSize: 16,
                            ),
                          ),
                          const Text(
                            'خلال 14 يوم من تاريخ الاستلام',
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'شروط الإرجاع',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _PolicyItem(
              icon: Icons.check_circle,
              color: Colors.green,
              text: 'المنتج لم يُستخدم أو يُفتح',
            ),
            _PolicyItem(
              icon: Icons.check_circle,
              color: Colors.green,
              text: 'المنتج في حالته الأصلية مع جميع الملحقات',
            ),
            _PolicyItem(
              icon: Icons.check_circle,
              color: Colors.green,
              text: 'إرفاق فاتورة الشراء',
            ),
            _PolicyItem(
              icon: Icons.check_circle,
              color: Colors.green,
              text: 'المنتج غير مستبعد من سياسة الإرجاع',
            ),
            const SizedBox(height: 24),
            const Text(
              'المنتجات غير القابلة للإرجاع',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _PolicyItem(
              icon: Icons.cancel,
              color: Colors.red,
              text: 'المنتجات الغذائية سريعة التلف',
            ),
            _PolicyItem(
              icon: Icons.cancel,
              color: Colors.red,
              text: 'الملابس الداخلية وملابس البحر',
            ),
            _PolicyItem(
              icon: Icons.cancel,
              color: Colors.red,
              text: 'المنتجات المخصصة حسب الطلب',
            ),
            _PolicyItem(
              icon: Icons.cancel,
              color: Colors.red,
              text: 'البرمجيات والألعاب الرقمية',
            ),
            _PolicyItem(
              icon: Icons.cancel,
              color: Colors.red,
              text: 'العطور ومستحضرات التجميل',
            ),
            const SizedBox(height: 24),
            const Text(
              'عملية الإرجاع',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _ProcessStep(number: '1', title: 'طلب الإرجاع', description: 'من خلال صفحة الطلبات أو التواصل مع الدعم'),
            _ProcessStep(number: '2', title: 'مراجعة الطلب', description: 'خلال 24 ساعة من تقديم الطلب'),
            _ProcessStep(number: '3', title: 'إرسال المنتج', description: 'بواسطة الشحن المجاني'),
            _ProcessStep(number: '4', title: 'استرداد المبلغ', description: 'خلال 5-7 أيام عمل'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/return-request');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('طلب إرجاع'),
            ),
          ],
        ),
      ),
    );
  }
}

class _PolicyItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const _PolicyItem({
    required this.icon,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(text),
          ),
        ],
      ),
    );
  }
}

class _ProcessStep extends StatelessWidget {
  final String number;
  final String title;
  final String description;

  const _ProcessStep({
    required this.number,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 13,
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
