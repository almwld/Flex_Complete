import 'package:flutter/material.dart';

/// شاشة سياسة الخصوصية
class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('سياسة الخصوصية'),
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
              '1. مقدمة',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'نحن في فلكس يمن نقدر خصوصيتك ونلتزم بحماية بياناتك الشخصية. توضح هذه السياسة كيفية جمع واستخدام وحماية معلوماتك.',
              style: TextStyle(color: Colors.grey[700], height: 1.6),
            ),
            const SizedBox(height: 24),
            const Text(
              '2. المعلومات التي نجمعها',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '• معلومات الاتصال (الاسم، البريد الإلكتروني، رقم الهاتف)\n• معلومات الدفع\n• معلومات الموقع\n• تاريخ التصفح والتفاعل\n• معلومات الجهاز',
              style: TextStyle(color: Colors.grey[700], height: 1.8),
            ),
            const SizedBox(height: 24),
            const Text(
              '3. استخدام المعلومات',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '• تقديم خدماتنا ومنتجاتنا\n• معالجة الطلبات والمدفوعات\n• التواصل معك بشأن طلباتك\n• تحسين تجربة المستخدم\n• إرسال إشعارات تسويقية (بإذنك)',
              style: TextStyle(color: Colors.grey[700], height: 1.8),
            ),
            const SizedBox(height: 24),
            const Text(
              '4. مشاركة المعلومات',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'لا نبيع معلوماتك الشخصية. قد نشارك معلوماتك مع:\n• شركاء الدفع لمعالجة المدفوعات\n• مقدمي خدمات التوصيل\n• الجهات القانونية عند الطلب',
              style: TextStyle(color: Colors.grey[700], height: 1.8),
            ),
            const SizedBox(height: 24),
            const Text(
              '5. حماية البيانات',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'نستخدم إجراءات أمنية متقدمة لحماية معلوماتك من الوصول غير المصرح به أو التعديل أو الإفصاح.',
              style: TextStyle(color: Colors.grey[700], height: 1.6),
            ),
            const SizedBox(height: 24),
            const Text(
              '6. حقوقك',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '• الحق في الوصول لمعلوماتك\n• الحق في تصحيح البيانات\n• الحق في حذف البيانات\n• الحق في الاعتراض على المعالجة\n• الحق في نقل البيانات',
              style: TextStyle(color: Colors.grey[700], height: 1.8),
            ),
            const SizedBox(height: 24),
            const Text(
              '7. التواصل',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'لأي استفسار حول سياسة الخصوصية، تواصل معنا:\nالبريد الإلكتروني: privacy@flexyemen.com\nالهاتف: 800-123-456',
              style: TextStyle(color: Colors.grey[700], height: 1.6),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
