import 'package:flutter/material.dart';

/// شاشة سجل الإحالات
class ReferralHistoryFullScreen extends StatelessWidget {
  const ReferralHistoryFullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('سجل الإحالات'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'مكتمل'),
              Tab(text: 'معلق'),
            ],
            labelColor: Color(0xFFD4AF37),
          ),
        ),
        body: TabBarView(
          children: [
            _buildCompletedList(),
            _buildPendingList(),
          ],
        ),
      ),
    );
  }

  Widget _buildCompletedList() {
    final completedReferrals = [
      ReferralHistoryItem(
        name: 'أحمد محمد',
        email: 'ahmed@example.com',
        date: DateTime.now().subtract(const Duration(days: 5)),
        points: 100,
        status: 'completed',
      ),
      ReferralHistoryItem(
        name: 'سارة علي',
        email: 'sara@example.com',
        date: DateTime.now().subtract(const Duration(days: 10)),
        points: 100,
        status: 'completed',
      ),
      ReferralHistoryItem(
        name: 'خالد عمر',
        email: 'khaled@example.com',
        date: DateTime.now().subtract(const Duration(days: 15)),
        points: 100,
        status: 'completed',
      ),
      ReferralHistoryItem(
        name: 'فاطمة أحمد',
        email: 'fatima@example.com',
        date: DateTime.now().subtract(const Duration(days: 20)),
        points: 100,
        status: 'completed',
      ),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: completedReferrals.length,
      itemBuilder: (context, index) {
        final referral = completedReferrals[index];
        return _buildReferralCard(referral);
      },
    );
  }

  Widget _buildPendingList() {
    final pendingReferrals = [
      ReferralHistoryItem(
        name: 'محمود سعيد',
        email: 'mahmoud@example.com',
        date: DateTime.now().subtract(const Duration(days: 3)),
        points: 0,
        status: 'pending',
      ),
      ReferralHistoryItem(
        name: 'نورة محمد',
        email: 'noura@example.com',
        date: DateTime.now().subtract(const Duration(days: 7)),
        points: 0,
        status: 'pending',
      ),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: pendingReferrals.length,
      itemBuilder: (context, index) {
        final referral = pendingReferrals[index];
        return _buildReferralCard(referral);
      },
    );
  }

  Widget _buildReferralCard(ReferralHistoryItem referral) {
    final isCompleted = referral.status == 'completed';

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
          CircleAvatar(
            radius: 24,
            backgroundColor: isCompleted
                ? const Color(0xFFD4AF37).withOpacity(0.1)
                : Colors.orange.withOpacity(0.1),
            child: Text(
              referral.name[0],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isCompleted ? const Color(0xFFD4AF37) : Colors.orange,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  referral.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  referral.email,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  referral.date.toString().substring(0, 10),
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (isCompleted) ...[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star, size: 12, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(
                        '+${referral.points}',
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'مكتمل',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 10,
                  ),
                ),
              ] else ...[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.orange[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'في الانتظار',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 10,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'شراء قيد الانتظار',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 9,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class ReferralHistoryItem {
  final String name;
  final String email;
  final DateTime date;
  final int points;
  final String status;

  ReferralHistoryItem({
    required this.name,
    required this.email,
    required this.date,
    required this.points,
    required this.status,
  });
}
