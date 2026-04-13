import 'package:flutter/material.dart';

/// شاشة النقاط الرئيسية
class PointsScreen extends StatelessWidget {
  const PointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('نقاطي'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // بطاقة الرصيد
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFD4AF37), Color(0xFFF4D03F)],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFD4AF37).withOpacity(0.4),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'رصيد نقاطك',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.star, color: Colors.white, size: 40),
                      const SizedBox(width: 8),
                      const Text(
                        '2,450',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      '≈ 245 ر.ي',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            // إحصائيات سريعة
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(child: _buildStatCard('النقاط المكتسبة', '1,200', Icons.add_circle, Colors.green)),
                  const SizedBox(width: 12),
                  Expanded(child: _buildStatCard('النقاط المستخدمة', '750', Icons.remove_circle, Colors.red)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // طرق لكسب النقاط
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'كيف تكسب نقاط أكثر؟',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  _buildEarnOption(
                    icon: Icons.shopping_bag,
                    title: 'تسوق الآن',
                    subtitle: '1 نقطة لكل 10 ر.ي',
                    color: Colors.blue,
                  ),
                  _buildEarnOption(
                    icon: Icons.rate_review,
                    title: 'قيّم المنتجات',
                    subtitle: '+50 نقطة للتقييم',
                    color: Colors.orange,
                  ),
                  _buildEarnOption(
                    icon: Icons.share,
                    title: 'شارك مع الأصدقاء',
                    subtitle: '+100 نقطة لكل صديق',
                    color: Colors.purple,
                  ),
                  _buildEarnOption(
                    icon: Icons.calendar_today,
                    title: 'سجل دخولك يومياً',
                    subtitle: '+5 نقاط يومياً',
                    color: Colors.teal,
                  ),
                ],
              ),
            ),
            // استبدال النقاط
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'استبدل نقاطك',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const PointsRedeemScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD4AF37),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      icon: const Icon(Icons.card_giftcard),
                      label: const Text('استبدال النقاط'),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const PointsHistoryScreen()),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFFD4AF37)),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      icon: const Icon(Icons.history),
                      label: const Text('سجل النقاط'),
                    ),
                  ),
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
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)],
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(title, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildEarnOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(subtitle, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }
}

class PointsHistoryScreen extends StatelessWidget {
  const PointsHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('سجل النقاط')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'النقاط المكتسبة',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _buildHistoryItem('تسوق', '+120', DateTime.now().subtract(const Duration(days: 1)), true),
          _buildHistoryItem('تقييم منتج', '+50', DateTime.now().subtract(const Duration(days: 3)), true),
          _buildHistoryItem('دخول يومي', '+5', DateTime.now().subtract(const Duration(days: 4)), true),
          const SizedBox(height: 24),
          const Text(
            'النقاط المستخدمة',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _buildHistoryItem('استبدال نقاط', '-500', DateTime.now().subtract(const Duration(days: 5)), false),
          _buildHistoryItem('خصم طلب', '-250', DateTime.now().subtract(const Duration(days: 10)), false),
        ],
      ),
    );
  }

  Widget _buildHistoryItem(String title, String points, DateTime date, bool isEarned) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4)],
      ),
      child: Row(
        children: [
          Icon(
            isEarned ? Icons.add_circle : Icons.remove_circle,
            color: isEarned ? Colors.green : Colors.red,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
                Text(date.toString().substring(0, 10), style: TextStyle(color: Colors.grey[600], fontSize: 12)),
              ],
            ),
          ),
          Text(
            points,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isEarned ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

class PointsRedeemScreen extends StatelessWidget {
  const PointsRedeemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('استبدال النقاط')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'اختر ما تريد استبداله',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildRedeemOption(context, 'خصم 10 ر.ي', 1000, Icons.money),
          _buildRedeemOption(context, 'خصم 25 ر.ي', 2500, Icons.money_off),
          _buildRedeemOption(context, 'خصم 50 ر.ي', 5000, Icons.local_offer),
          _buildRedeemOption(context, 'شحن مجاني', 3000, Icons.local_shipping),
          _buildRedeemOption(context, 'بطاقة هدايا 100 ر.ي', 10000, Icons.card_giftcard),
        ],
      ),
    );
  }

  Widget _buildRedeemOption(BuildContext context, String title, int points, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Card(
        child: ListTile(
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFD4AF37).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: const Color(0xFFD4AF37)),
          ),
          title: Text(title),
          subtitle: Row(
            children: [
              const Icon(Icons.star, size: 14, color: Color(0xFFD4AF37)),
              const SizedBox(width: 4),
              Text('$points نقطة'),
            ],
          ),
          trailing: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تم استبدال النقاط!')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD4AF37),
            ),
            child: const Text('استبدال'),
          ),
        ),
      ),
    );
  }
}
