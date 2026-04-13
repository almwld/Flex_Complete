import 'package:flutter/material.dart';

/// شاشة طلب الإرجاع
class ReturnRequestScreen extends StatefulWidget {
  final String orderId;

  const ReturnRequestScreen({super.key, required this.orderId});

  @override
  State<ReturnRequestScreen> createState() => _ReturnRequestScreenState();
}

class _ReturnRequestScreenState extends State<ReturnRequestScreen> {
  final List<Map<String, dynamic>> _orderItems = [
    {'id': '1', 'name': 'سماعة بلوتوث', 'price': 150000, 'selected': true},
    {'id': '2', 'name': 'كابل USB-C', 'price': 45000, 'selected': false},
    {'id': '3', 'name': 'شاحن سريع', 'price': 180000, 'selected': true},
  ];

  String _reason = 'not_as_described';
  final _notesController = TextEditingController();

  final List<Map<String, String>> _reasons = [
    {'value': 'not_as_described', 'label': 'المنتج مختلف عن الوصف'},
    {'value': 'defective', 'label': 'المنتج تالف أو معيب'},
    {'value': 'wrong_item', 'label': 'تم إرسال منتج خاطئ'},
    {'value': 'changed_mind', 'label': 'تغيير رأي'},
    {'value': 'other', 'label': 'سبب آخر'},
  ];

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('طلب إرجاع'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'اختر المنتجات للإرجاع',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ...List.generate(_orderItems.length, (index) {
              final item = _orderItems[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: CheckboxListTile(
                  value: item['selected'],
                  onChanged: (value) {
                    setState(() {
                      _orderItems[index]['selected'] = value;
                    });
                  },
                  title: Text(item['name']),
                  subtitle: Text('${item['price']} ر.ي'),
                  secondary: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.image, color: Colors.grey),
                  ),
                ),
              );
            }),
            const SizedBox(height: 24),
            const Text(
              'سبب الإرجاع',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ..._reasons.map((reason) {
              return RadioListTile<String>(
                value: reason['value']!,
                groupValue: _reason,
                onChanged: (value) {
                  setState(() => _reason = value!);
                },
                title: Text(reason['label']!),
              );
            }),
            const SizedBox(height: 24),
            const Text(
              'ملاحظات إضافية',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _notesController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'اكتب ملاحظاتك هنا...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Card(
              color: Colors.blue.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Icon(Icons.info, color: Colors.blue),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'ملاحظة',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'سيتم شحن المنتج مجاناً بعد مراجعة الطلب',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('تم تقديم طلب الإرجاع بنجاح'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('تقديم طلب الإرجاع'),
            ),
          ],
        ),
      ),
    );
  }
}
