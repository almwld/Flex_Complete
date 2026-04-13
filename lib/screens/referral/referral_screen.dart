import 'package:flutter/material.dart';

/// شاشة الإحالات
class ReferralScreen extends StatelessWidget {
  const ReferralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('برنامج الإحالات')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFD4AF37), Color(0xFFF4D03F)]),
              ),
              child: Column(
                children: [
                  const Icon(Icons.people, color: Colors.white, size: 60),
                  const SizedBox(height: 16),
                  const Text('ادعُ أصدقاءك واربح!', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('احصل على 100 نقطة لكل صديق يسجل ويشتري', style: TextStyle(color: Colors.white70), textAlign: TextAlign.center),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 4))]),
                    child: Column(
                      children: [
                        const Text('رمز الإحالة الخاص بك', style: TextStyle(color: Colors.grey)),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          decoration: BoxDecoration(color: const Color(0xFFD4AF37).withOpacity(0.1), borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFD4AF37))),
                          child: Row(mainAxisSize: MainAxisSize.min, children: [
                            Text('FLEX2024', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey[800], letterSpacing: 3)),
                            IconButton(onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم نسخ الرمز!'))), icon: const Icon(Icons.copy, color: Color(0xFFD4AF37))),
                          ]),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFD4AF37), padding: const EdgeInsets.symmetric(vertical: 12)),
                            icon: const Icon(Icons.share),
                            label: const Text('مشاركة الرمز'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(child: _buildStatCard('الأصدقاء المدعوين', '12', Icons.person_add, Colors.blue)),
                      const SizedBox(width: 12),
                      Expanded(child: _buildStatCard('النقاط المكتسبة', '1,200', Icons.star, Colors.amber)),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Align(alignment: Alignment.centerRight, child: Text('كيف يعمل؟', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                  const SizedBox(height: 16),
                  _buildStep(1, 'شارك رمزك', 'أرسل الرمز لأي صديق'),
                  _buildStep(2, 'صديقك يسجل', 'يستخدم الرمز عند التسجيل'),
                  _buildStep(3, 'صديقك يشتري', 'يحصل على خصم 10%'),
                  _buildStep(4, 'تربح نقاط', 'تحصل على 100 نقطة'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2))]),
      child: Column(
        children: [
          Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: color.withOpacity(0.1), shape: BoxShape.circle), child: Icon(icon, color: color)),
          const SizedBox(height: 12),
          Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text(title, style: TextStyle(color: Colors.grey[600], fontSize: 12), textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildStep(int number, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(width: 32, height: 32, decoration: const BoxDecoration(color: Color(0xFFD4AF37), shape: BoxShape.circle), child: Center(child: Text('$number', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(subtitle, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
