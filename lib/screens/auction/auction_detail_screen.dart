import 'package:flutter/material.dart';

/// شاشة تفاصيل المزاد
class AuctionDetailFullScreen extends StatefulWidget {
  final String auctionId;

  const AuctionDetailFullScreen({super.key, required this.auctionId});

  @override
  State<AuctionDetailFullScreen> createState() => _AuctionDetailFullScreenState();
}

class _AuctionDetailFullScreenState extends State<AuctionDetailFullScreen> {
  final TextEditingController _bidController = TextEditingController();
  double _currentBid = 500.0;
  int _bidCount = 15;

  void _placeBid() {
    final amount = double.tryParse(_bidController.text);
    if (amount != null && amount > _currentBid) {
      setState(() {
        _currentBid = amount;
        _bidCount++;
      });
      _bidController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تم تسجيل مزايدتك بنجاح!'),
          backgroundColor: Color(0xFFD4AF37),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('يرجى إدخال مبلغ أكبر من المزايدة الحالية'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.grey[300],
                child: const Icon(Icons.gavel, size: 100, color: Colors.grey),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'آيفون 14 برو ماكس',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.category, size: 16, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text('إلكترونيات', style: TextStyle(color: Colors.grey[600])),
                      const SizedBox(width: 16),
                      Icon(Icons.timer, size: 16, color: Colors.red),
                      const SizedBox(width: 4),
                      const Text('12:30:45', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // بطاقة المزايدة
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFFD4AF37).withOpacity(0.2),
                          const Color(0xFFD4AF37).withOpacity(0.05),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFD4AF37)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('المزايدة الحالية', style: TextStyle(color: Colors.grey[600])),
                                Text(
                                  '${_currentBid.toStringAsFixed(0)} ر.ي',
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFD4AF37),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('عدد المزايدات', style: TextStyle(color: Colors.grey[600])),
                                Text(
                                  '$_bidCount',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _bidController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'أدخل مبلغ المزايدة',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            ElevatedButton(
                              onPressed: _placeBid,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFD4AF37),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 24,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                'مزايدة',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // معلومات البائع
                  const Text(
                    'معلومات البائع',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: const Color(0xFFD4AF37),
                      child: const Icon(Icons.person, color: Colors.white),
                    ),
                    title: const Text('اسم البائع'),
                    subtitle: const Text('تقييم: 4.8 ★'),
                    trailing: TextButton(
                      onPressed: () {},
                      child: const Text('عرض الملف'),
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: 16),
                  // وصف المنتج
                  const Text(
                    'وصف المنتج',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'آيفون 14 برو ماكس بحالة ممتازة، غير مستعمل، مع العلبة الكاملة والإكسسوارات. المنتج أصلي من شركة آبل مع ضمان سنة.',
                    style: TextStyle(color: Colors.grey[600], height: 1.5),
                  ),
                  const SizedBox(height: 24),
                  // المزايدات الأخيرة
                  const Text(
                    'آخر المزايدات',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  ...List.generate(5, (index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: index == 0 ? const Color(0xFFD4AF37) : Colors.grey[300],
                        child: Text('${index + 1}', style: const TextStyle(color: Colors.white)),
                      ),
                      title: Text('مستخدم ${index + 1}'),
                      trailing: Text(
                        '${500 + (index * 50)} ر.ي',
                        style: TextStyle(
                          fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal,
                          color: index == 0 ? const Color(0xFFD4AF37) : null,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
        ),
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.message),
                  label: const Text('تواصل'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _placeBid,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD4AF37),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  icon: const Icon(Icons.gavel),
                  label: const Text('مزايدة الآن'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
