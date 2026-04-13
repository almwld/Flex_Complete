import 'package:flutter/material.dart';

/// شاشة تفاصيل الطلب
class OrderDetailsScreen extends StatelessWidget {
  final String? orderId;

  const OrderDetailsScreen({super.key, this.orderId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل الطلب'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // حالة الطلب
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check_circle,
                        size: 50,
                        color: Colors.green[700],
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'تم التوصيل',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'تم توصيل طلبك بنجاح',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _StatusDot(isActive: true, isCompleted: true),
                        _StatusLine(isActive: true),
                        _StatusDot(isActive: true, isCompleted: true),
                        _StatusLine(isActive: true),
                        _StatusDot(isActive: true, isCompleted: true),
                        _StatusLine(isActive: true),
                        _StatusDot(isActive: true, isCompleted: true),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'طلب',
                          style: TextStyle(fontSize: 11, color: Colors.grey[500]),
                        ),
                        Text(
                          'تجهيز',
                          style: TextStyle(fontSize: 11, color: Colors.grey[500]),
                        ),
                        Text(
                          'شحن',
                          style: TextStyle(fontSize: 11, color: Colors.grey[500]),
                        ),
                        Text(
                          'توصيل',
                          style: TextStyle(fontSize: 11, color: Colors.grey[500]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // معلومات الطلب
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'معلومات الطلب',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'تم الدفع',
                            style: TextStyle(
                              color: Colors.green[700],
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 24),
                    _InfoRow('رقم الطلب', '#ORD-123456'),
                    _InfoRow('تاريخ الطلب', '10 مارس 2025'),
                    _InfoRow('طريقة الدفع', 'الدفع عند الاستلام'),
                    _InfoRow('طريقة الشحن', 'توصيل عادي'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // تتبع الشحنة
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'تتبع الشحنة',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    _TrackingItem(
                      title: 'تم التوصيل',
                      subtitle: 'تم تسليم الطلب للعميل',
                      time: '14 مارس 2025 - 10:30 ص',
                      isActive: true,
                      isLast: true,
                    ),
                    _TrackingItem(
                      title: 'في الطريق',
                      subtitle: 'المندوب في الطريق إليك',
                      time: '14 مارس 2025 - 08:00 ص',
                      isActive: true,
                    ),
                    _TrackingItem(
                      title: 'غادر المستودع',
                      subtitle: 'شحنة مغادرة مركز التوزيع',
                      time: '13 مارس 2025 - 03:00 م',
                      isActive: true,
                    ),
                    _TrackingItem(
                      title: 'تم التجهيز',
                      subtitle: 'تم تجهيز المنتجات',
                      time: '12 مارس 2025 - 10:00 ص',
                      isActive: true,
                    ),
                    _TrackingItem(
                      title: 'تم الاستلام',
                      subtitle: 'تم استلام طلبك',
                      time: '10 مارس 2025 - 02:30 م',
                      isActive: true,
                      isLast: true,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // عنوان التوصيل
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'عنوان التوصيل',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'أحمد محمد',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '+967 777 123 456',
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                              Text(
                                'صنعاء، شارع الزبيري، مبنى 123',
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // المنتجات
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'المنتجات',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    _ProductItem(
                      name: 'سماعة بلوتوث لاسلكية',
                      variant: 'أسود',
                      price: 300000,
                      quantity: 2,
                      imageUrl: 'https://picsum.photos/seed/1/80/80',
                    ),
                    const Divider(),
                    _ProductItem(
                      name: 'كابل USB-C سريع',
                      variant: null,
                      price: 45000,
                      quantity: 1,
                      imageUrl: 'https://picsum.photos/seed/2/80/80',
                    ),
                    const Divider(),
                    _ProductItem(
                      name: 'شاحن سريع 65 واط',
                      variant: 'أبيض',
                      price: 180000,
                      quantity: 1,
                      imageUrl: 'https://picsum.photos/seed/3/80/80',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // الملخص
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _SummaryRow('المجموع الفرعي', '765,000 ر.ي'),
                    _SummaryRow('الخصم', '-75,000 ر.ي'),
                    _SummaryRow('رسوم الشحن', '25,000 ر.ي'),
                    const Divider(),
                    _SummaryRow('الإجمالي', '715,000 ر.ي', isBold: true),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // أزرار الإجراءات
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.replay),
                    label: const Text('إعادة الطلب'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.rate_review),
                    label: const Text('قيّم المنتج'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: TextButton.icon(
                onPressed: () => _showHelpDialog(context),
                icon: const Icon(Icons.help_outline),
                label: const Text('هل تحتاج مساعدة؟'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showHelpDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.chat),
              title: const Text('تواصل معنا'),
              subtitle: const Text('دردشة مباشرة'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('اتصل بنا'),
              subtitle: const Text('800-123-456'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('البريد الإلكتروني'),
              subtitle: const Text('support@flexyemen.com'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusDot extends StatelessWidget {
  final bool isActive;
  final bool isCompleted;

  const _StatusDot({
    required this.isActive,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive
            ? (isCompleted ? Colors.green : Theme.of(context).primaryColor)
            : Colors.grey[300],
      ),
    );
  }
}

class _StatusLine extends StatelessWidget {
  final bool isActive;

  const _StatusLine({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 2,
      color: isActive ? Colors.green : Colors.grey[300],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey[600])),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

class _TrackingItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final bool isActive;
  final bool isLast;

  const _TrackingItem({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.isActive,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive ? Theme.of(context).primaryColor : Colors.grey[300],
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 40,
                color: Colors.grey[300],
              ),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: isActive ? null : Colors.grey[500],
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[500],
                ),
              ),
              Text(
                time,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[400],
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProductItem extends StatelessWidget {
  final String name;
  final String? variant;
  final double price;
  final int quantity;
  final String imageUrl;

  const _ProductItem({
    required this.name,
    this.variant,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 60,
                height: 60,
                color: Colors.grey[200],
                child: const Icon(Icons.image),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                if (variant != null)
                  Text(
                    variant!,
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 13,
                    ),
                  ),
                Text(
                  'x$quantity',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          Text(
            '${(price * quantity).toInt()} ر.ي',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;

  const _SummaryRow(this.label, this.value, {this.isBold = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
              color: isBold ? Theme.of(context).primaryColor : null,
            ),
          ),
        ],
      ),
    );
  }
}
