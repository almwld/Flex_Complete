import 'package:flutter/material.dart';

/// شاشة استبدال النقاط
class PointsRedeemFullScreen extends StatefulWidget {
  const PointsRedeemFullScreen({super.key});

  @override
  State<PointsRedeemFullScreen> createState() => _PointsRedeemFullScreenState();
}

class _PointsRedeemFullScreenState extends State<PointsRedeemFullScreen> {
  int _currentPoints = 2450;
  String? _selectedReward;

  final List<Reward> _rewards = [
    Reward(
      id: '1',
      title: 'خصم 10 ر.ي على طلبك',
      description: 'احصل على خصم فوري على طلبك القادم',
      points: 1000,
      icon: Icons.money,
      color: Colors.green,
      remaining: 50,
    ),
    Reward(
      id: '2',
      title: 'خصم 25 ر.ي على طلبك',
      description: 'خصم كبير على طلباتك',
      points: 2500,
      icon: Icons.local_offer,
      color: Colors.blue,
      remaining: 30,
    ),
    Reward(
      id: '3',
      title: 'شحن مجاني',
      description: 'شحن مجاني على طلبك التالي',
      points: 1500,
      icon: Icons.local_shipping,
      color: Colors.orange,
      remaining: 100,
    ),
    Reward(
      id: '4',
      title: 'كوبون 20%',
      description: 'كوبون خصم 20% على أي طلب',
      points: 3000,
      icon: Icons.discount,
      color: Colors.purple,
      remaining: 20,
    ),
    Reward(
      id: '5',
      title: 'بطاقة هدايا 50 ر.ي',
      description: 'بطاقة هدايا من فلكس يمن',
      points: 5000,
      icon: Icons.card_giftcard,
      color: Colors.red,
      remaining: 10,
    ),
    Reward(
      id: '6',
      title: 'اشتراك PRO مجاني',
      description: 'شهر مجاني من وضع PRO',
      points: 10000,
      icon: Icons.workspace_premium,
      color: const Color(0xFFD4AF37),
      remaining: 5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('استبدال النقاط'),
      ),
      body: Column(
        children: [
          // بطاقة النقاط
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFD4AF37), Color(0xFFF4D03F)],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.star, color: Colors.white, size: 32),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'نقاطك المتاحة',
                        style: TextStyle(color: Colors.white70),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '$_currentPoints',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // قائمة المكافآت
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _rewards.length,
              itemBuilder: (context, index) {
                final reward = _rewards[index];
                final canRedeem = _currentPoints >= reward.points;
                final isSelected = _selectedReward == reward.id;

                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Card(
                    elevation: isSelected ? 4 : 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: isSelected
                          ? const BorderSide(color: Color(0xFFD4AF37), width: 2)
                          : BorderSide.none,
                    ),
                    child: InkWell(
                      onTap: canRedeem ? () {
                        setState(() {
                          _selectedReward = isSelected ? null : reward.id;
                        });
                      } : null,
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: reward.color.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(reward.icon, color: reward.color, size: 28),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    reward.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    reward.description,
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Icon(Icons.star, size: 14, color: Colors.amber[700]),
                                      const SizedBox(width: 4),
                                      Text(
                                        '${reward.points} نقطة',
                                        style: TextStyle(
                                          color: Colors.amber[700],
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Text(
                                        'متبقي: ${reward.remaining}',
                                        style: TextStyle(
                                          color: Colors.grey[500],
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            if (!canRedeem)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Text(
                                  'لا تكفي',
                                  style: TextStyle(color: Colors.grey, fontSize: 10),
                                ),
                              )
                            else if (isSelected)
                              const Icon(Icons.check_circle, color: Color(0xFFD4AF37))
                            else
                              Icon(Icons.radio_button_unchecked, color: Colors.grey[400]),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // زر الاستبدال
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _selectedReward != null
                      ? () {
                          _showConfirmDialog();
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD4AF37),
                    disabledBackgroundColor: Colors.grey[300],
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    _selectedReward != null ? 'استبدال الآن' : 'اختر مكافأة',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showConfirmDialog() {
    final reward = _rewards.firstWhere((r) => r.id == _selectedReward);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تأكيد الاستبدال'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(reward.icon, size: 48, color: reward.color),
            const SizedBox(height: 16),
            Text(
              reward.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'هل أنت متأكد من استبدال ${reward.points} نقطة؟',
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _currentPoints -= reward.points;
                _selectedReward = null;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('تم استبدال النقاط بنجاح!'),
                  backgroundColor: Color(0xFFD4AF37),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD4AF37),
            ),
            child: const Text('تأكيد'),
          ),
        ],
      ),
    );
  }
}

class Reward {
  final String id;
  final String title;
  final String description;
  final int points;
  final IconData icon;
  final Color color;
  final int remaining;

  Reward({
    required this.id,
    required this.title,
    required this.description,
    required this.points,
    required this.icon,
    required this.color,
    required this.remaining,
  });
}
