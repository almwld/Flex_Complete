import 'package:flutter/material.dart';

/// شاشة قائمة الكوبونات
class CouponListScreen extends StatelessWidget {
  const CouponListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('الكوبونات'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'متاح'),
              Tab(text: 'مستخدم'),
              Tab(text: 'منتهي'),
            ],
            labelColor: Color(0xFFD4AF37),
          ),
        ),
        body: TabBarView(
          children: [
            _AvailableCouponsTab(),
            _UsedCouponsTab(),
            _ExpiredCouponsTab(),
          ],
        ),
      ),
    );
  }
}

class _AvailableCouponsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final coupons = [
      CouponModel(
        id: '1',
        code: 'FLEX50',
        title: 'خصم 50%',
        description: 'خصم على جميع المنتجات',
        discount: 50,
        discountType: 'percent',
        minPurchase: 100,
        maxDiscount: 200,
        validUntil: DateTime.now().add(const Duration(days: 7)),
        isAvailable: true,
      ),
      CouponModel(
        id: '2',
        code: 'FLEX20',
        title: 'خصم 20 ر.ي',
        description: 'خصم ثابت على طلبك',
        discount: 20,
        discountType: 'fixed',
        minPurchase: 50,
        validUntil: DateTime.now().add(const Duration(days: 3)),
        isAvailable: true,
      ),
      CouponModel(
        id: '3',
        code: 'FREESHIP',
        title: 'شحن مجاني',
        description: 'شحن مجاني على جميع الطلبات',
        discount: 0,
        discountType: 'free_shipping',
        minPurchase: 30,
        validUntil: DateTime.now().add(const Duration(days: 14)),
        isAvailable: true,
      ),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: coupons.length,
      itemBuilder: (context, index) {
        return CouponCard(coupon: coupons[index]);
      },
    );
  }
}

class _UsedCouponsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildUsedCouponCard('SAVE10', 'خصم 10%', DateTime.now().subtract(const Duration(days: 5))),
        _buildUsedCouponCard('WELCOME20', 'خصم 20 ر.ي', DateTime.now().subtract(const Duration(days: 10))),
      ],
    );
  }

  Widget _buildUsedCouponCard(String code, String title, DateTime usedDate) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Opacity(
        opacity: 0.6,
        child: ListTile(
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.check_circle, color: Colors.grey),
          ),
          title: Text(title),
          subtitle: Text('$code - استخدم في ${usedDate.toString().substring(0, 10)}'),
          trailing: const Text('تم الاستخدام', style: TextStyle(color: Colors.grey)),
        ),
      ),
    );
  }
}

class _ExpiredCouponsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildExpiredCouponCard('OLDSALE', 'خصم 30%', DateTime.now().subtract(const Duration(days: 5))),
      ],
    );
  }

  Widget _buildExpiredCouponCard(String code, String title, DateTime expiredDate) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Opacity(
        opacity: 0.5,
        child: ListTile(
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.red[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.timer_off, color: Colors.red[400]),
          ),
          title: Text(title),
          subtitle: Text('$code - انتهى في ${expiredDate.toString().substring(0, 10)}'),
          trailing: const Text('منتهي الصلاحية', style: TextStyle(color: Colors.red)),
        ),
      ),
    );
  }
}

class CouponModel {
  final String id;
  final String code;
  final String title;
  final String description;
  final double discount;
  final String discountType;
  final double minPurchase;
  final double? maxDiscount;
  final DateTime validUntil;
  final bool isAvailable;

  CouponModel({
    required this.id,
    required this.code,
    required this.title,
    required this.description,
    required this.discount,
    required this.discountType,
    required this.minPurchase,
    this.maxDiscount,
    required this.validUntil,
    required this.isAvailable,
  });
}

class CouponCard extends StatelessWidget {
  final CouponModel coupon;

  const CouponCard({super.key, required this.coupon});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFD4AF37), Color(0xFFF4D03F)],
              ),
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        coupon.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        coupon.description,
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    coupon.code,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFD4AF37),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'الحد الأدنى للطلب: ${coupon.minPurchase} ر.ي',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                    Text(
                      'صالح حتى: ${coupon.validUntil.toString().substring(0, 10)}',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('تم نسخ الكوبون: ${coupon.code}')),
                      );
                    },
                    child: const Text('نسخ الكوبون'),
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
