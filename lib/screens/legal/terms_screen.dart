import 'package:flutter/material.dart';

/// شاشة الشروط والأحكام
class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الشروط والأحكام'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'آخر تحديث: 1 مارس 2025',
              style: TextStyle(color: Colors.grey[500]),
            ),
            const SizedBox(height: 24),
            const Text(
              '1. القبول',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'بالم着用 أو الوصول إلى تطبيق فلكس يمن، فأنت توافق على الالتزام بهذه الشروط والأحكام.',
              style: TextStyle(color: Colors.grey[700], height: 1.6),
            ),
            const SizedBox(height: 24),
            const Text(
              '2. الخدمات',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'تقدم فلكس يمن خدمات التجارة الإلكترونية والمحفظة الرقمية. نحتفظ بالحق في تعديل أو إيقاف أي خدمة في أي وقت.',
              style: TextStyle(color: Colors.grey[700], height: 1.6),
            ),
            const SizedBox(height: 24),
            const Text(
              '3. حسابات المستخدمين',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'أنت مسؤول عن الحفاظ على سرية حسابك وكلمة المرور. أنت توافق على تحمل المسؤولية عن جميع الأنشطة التي تحدث تحت حسابك.',
              style: TextStyle(color: Colors.grey[700], height: 1.6),
            ),
            const SizedBox(height: 24),
            const Text(
              '4. الطلبات والدفع',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'نحتفظ بالحق في رفض أو إلغاء أي طلب. في حالة إلغاء الطلب، سيتم استرداد المبلغ بالكامل.',
              style: TextStyle(color: Colors.grey[700], height: 1.6),
            ),
            const SizedBox(height: 24),
            const Text(
              '5. سياسة الإرجاع',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'يمكنك إرجاع المنتجات خلال 14 يوماً من تاريخ الاستلام بشرط أن تكون في حالتها الأصلية.',
              style: TextStyle(color: Colors.grey[700], height: 1.6),
            ),
            const SizedBox(height: 24),
            const Text(
              '6. حقوق الملكية الفكرية',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'جميع المحتويات على التطبيق بما في ذلك النصوص والتصاميم والشعارات هي ملكية فلكس يمن ومحمية بموجب قوانين حقوق النشر.',
              style: TextStyle(color: Colors.grey[700], height: 1.6),
            ),
            const SizedBox(height: 24),
            const Text(
              '7. حدود المسؤولية',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'لا تتحمل فلكس يمن مسؤولية أي أضرار غير مباشرة أو عرضية ناتجة عن استخدام الخدمة.',
              style: TextStyle(color: Colors.grey[700], height: 1.6),
            ),
            const SizedBox(height: 24),
            const Text(
              '8. التعديلات',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'نحتفظ بالحق في تعديل هذه الشروط في أي وقت. سيتم إخطارك بأي تغييرات جوهرية.',
              style: TextStyle(color: Colors.grey[700], height: 1.6),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
