import 'package:flutter/material.dart';

/// شاشة الدفع
class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _selectedPayment = 'cod';

  final List<Map<String, dynamic>> _paymentMethods = [
    {
      'id': 'cod',
      'name': 'الدفع عند الاستلام',
      'description': 'ادفع نقداً عند استلام طلبك',
      'icon': Icons.money,
    },
    {
      'id': 'card',
      'name': 'بطاقة ائتمان',
      'description': 'Visa, MasterCard',
      'icon': Icons.credit_card,
    },
    {
      'id': 'wallet',
      'name': 'المحفظة (فلكس)',
      'description': 'ادفع من رصيدك',
      'icon': Icons.account_balance_wallet,
      'balance': 125000,
    },
    {
      'id': 'bank',
      'name': 'تحويل بنكي',
      'description': 'IBAN / حساب بنكي',
      'icon': Icons.account_balance,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الدفع'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'طريقة الدفع',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ..._paymentMethods.map((method) {
              final isSelected = _selectedPayment == method['id'];
              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                color: isSelected
                    ? Theme.of(context).primaryColor.withOpacity(0.05)
                    : null,
                child: ListTile(
                  leading: Icon(
                    method['icon'],
                    size: 32,
                    color: isSelected
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                  ),
                  title: Text(
                    method['name'],
                    style: TextStyle(
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  subtitle: Text(method['description']),
                  trailing: method['balance'] != null
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '${method['balance']} ر.ي',
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        )
                      : Radio<String>(
                          value: method['id'],
                          groupValue: _selectedPayment,
                          onChanged: (value) {
                            setState(() => _selectedPayment = value!);
                          },
                        ),
                  onTap: () {
                    setState(() => _selectedPayment = method['id']);
                  },
                ),
              );
            }),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'ملخص الطلب',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    _SummaryRow('المنتجات (3)', '735,000 ر.ي'),
                    _SummaryRow('الخصم', '-70,000 ر.ي'),
                    _SummaryRow('الشحن', '25,000 ر.ي'),
                    const Divider(),
                    _SummaryRow('الإجمالي', '690,000 ر.ي', isBold: true),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/confirmation');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('تأكيد الطلب'),
            ),
          ],
        ),
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
