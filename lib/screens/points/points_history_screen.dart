import 'package:flutter/material.dart';

/// شاشة سجل نقاط الولاء
class LoyaltyPointsHistoryScreen extends StatelessWidget {
  const LoyaltyPointsHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('سجل النقاط'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'النقاط المكتسبة'),
              Tab(text: 'النقاط المستخدمة'),
            ],
            labelColor: Color(0xFFD4AF37),
          ),
        ),
        body: TabBarView(
          children: [
            _buildEarnedPointsList(),
            _buildUsedPointsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildEarnedPointsList() {
    final earnedPoints = [
      PointsTransaction(
        id: '1',
        type: 'earn',
        title: 'تسوق من المتجر',
        points: 120,
        date: DateTime.now().subtract(const Duration(days: 1)),
        orderId: 'ORD-12345',
      ),
      PointsTransaction(
        id: '2',
        type: 'earn',
        title: 'تقييم منتج',
        points: 50,
        date: DateTime.now().subtract(const Duration(days: 3)),
        orderId: null,
      ),
      PointsTransaction(
        id: '3',
        type: 'earn',
        title: 'دخول يومي',
        points: 5,
        date: DateTime.now().subtract(const Duration(days: 4)),
        orderId: null,
      ),
      PointsTransaction(
        id: '4',
        type: 'earn',
        title: 'دخول يومي',
        points: 5,
        date: DateTime.now().subtract(const Duration(days: 5)),
        orderId: null,
      ),
      PointsTransaction(
        id: '5',
        type: 'earn',
        title: 'إحالة صديق',
        points: 200,
        date: DateTime.now().subtract(const Duration(days: 7)),
        orderId: null,
      ),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: earnedPoints.length,
      itemBuilder: (context, index) {
        final transaction = earnedPoints[index];
        return _buildTransactionCard(
          icon: Icons.add_circle,
          iconColor: Colors.green,
          title: transaction.title,
          points: '+${transaction.points}',
          pointsColor: Colors.green,
          date: transaction.date,
          subtitle: transaction.orderId != null ? 'رقم الطلب: ${transaction.orderId}' : null,
        );
      },
    );
  }

  Widget _buildUsedPointsList() {
    final usedPoints = [
      PointsTransaction(
        id: '1',
        type: 'redeem',
        title: 'استبدال بخصم',
        points: 500,
        date: DateTime.now().subtract(const Duration(days: 5)),
        orderId: 'ORD-12340',
      ),
      PointsTransaction(
        id: '2',
        type: 'redeem',
        title: 'استبدال بشحن مجاني',
        points: 300,
        date: DateTime.now().subtract(const Duration(days: 10)),
        orderId: 'ORD-12335',
      ),
      PointsTransaction(
        id: '3',
        type: 'redeem',
        title: 'استبدال ببطاقة هدايا',
        points: 1000,
        date: DateTime.now().subtract(const Duration(days: 15)),
        orderId: null,
      ),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: usedPoints.length,
      itemBuilder: (context, index) {
        final transaction = usedPoints[index];
        return _buildTransactionCard(
          icon: Icons.remove_circle,
          iconColor: Colors.red,
          title: transaction.title,
          points: '-${transaction.points}',
          pointsColor: Colors.red,
          date: transaction.date,
          subtitle: transaction.orderId != null ? 'رقم الطلب: ${transaction.orderId}' : null,
        );
      },
    );
  }

  Widget _buildTransactionCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String points,
    required Color pointsColor,
    required DateTime date,
    String? subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date.toString().substring(0, 10),
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 11,
                    ),
                  ),
                ],
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: pointsColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.star, size: 14, color: Color(0xFFD4AF37)),
                const SizedBox(width: 4),
                Text(
                  points,
                  style: TextStyle(
                    color: pointsColor,
                    fontWeight: FontWeight.bold,
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

class PointsTransaction {
  final String id;
  final String type;
  final String title;
  final int points;
  final DateTime date;
  final String? orderId;

  PointsTransaction({
    required this.id,
    required this.type,
    required this.title,
    required this.points,
    required this.date,
    this.orderId,
  });
}
