import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../widgets/common/custom_app_bar.dart';

/// صفحة الأسئلة الشائعة
class FaqScreen extends StatelessWidget {
  const FaqScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> _faqs = [
    {
      'question': 'كيف يمكنني إنشاء حساب؟',
      'answer': 'يمكنك إنشاء حساب عن طريق الضغط على زر التسجيل واتباع الخطوات.',
    },
    {
      'question': 'ما هي طرق الدفع المتاحة؟',
      'answer': 'نقبل الدفع نقداً عند الاستلام والبطاقات البنكية والمحافظ الإلكترونية.',
    },
    {
      'question': 'كم تستغرق عملية التوصيل؟',
      'answer': 'تستغرق عملية التوصيل من 2-5 أيام عمل حسب موقعك.',
    },
    {
      'question': 'هل يمكنني إرجاع المنتج؟',
      'answer': 'نعم، يمكنك إرجاع المنتج خلال 14 يوم من تاريخ الاستلام.',
    },
    {
      'question': 'كيف يمكنني التواصل مع客服؟',
      'answer': 'يمكنك التواصل معنا عبر الدردشة أو عن طريق إنشاء تذكرة دعم.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppColors.backgroundDark
          : AppColors.backgroundGrey,
      appBar: CustomAppBar(
        title: 'الأسئلة الشائعة',
        showBackButton: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _faqs.length,
        itemBuilder: (context, index) {
          final faq = _faqs[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ExpansionTile(
              title: Text(
                faq['question'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              iconColor: AppColors.goldColor,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    faq['answer'],
                    style: const TextStyle(color: AppColors.textSecondary),
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
