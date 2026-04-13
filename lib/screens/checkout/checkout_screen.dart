import 'package:flutter/material.dart';

/// شاشة إتمام الشراء
class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int _currentStep = 0;
  String _selectedPayment = 'cod';
  bool _useNewAddress = false;
  final _couponController = TextEditingController();
  String? _appliedCoupon;

  final List<Map<String, dynamic>> _addresses = [
    {
      'id': '1',
      'name': 'أحمد محمد',
      'phone': '+967 777 123 456',
      'city': 'صنعاء',
      'area': 'شارع الزبيري',
      'isDefault': true,
    },
    {
      'id': '2',
      'name': 'محمد علي',
      'phone': '+967 733 987 654',
      'city': 'عدن',
      'area': 'خور مكسر',
      'isDefault': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إتمام الشراء'),
        centerTitle: true,
      ),
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep < 3) {
            setState(() {
              _currentStep++;
            });
          } else {
            _placeOrder();
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep--;
            });
          }
        },
        controlsBuilder: (context, details) {
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: details.onStepContinue,
                  child: Text(_currentStep == 3 ? 'تأكيد الطلب' : 'التالي'),
                ),
                const SizedBox(width: 12),
                if (_currentStep > 0)
                  TextButton(
                    onPressed: details.onStepCancel,
                    child: const Text('السابق'),
                  ),
              ],
            ),
          );
        },
        steps: [
          Step(
            title: const Text('العنوان'),
            content: _buildAddressStep(),
            isActive: _currentStep >= 0,
            state: _currentStep > 0 ? StepState.complete : StepState.indexed,
          ),
          Step(
            title: const Text('الشحن'),
            content: _buildShippingStep(),
            isActive: _currentStep >= 1,
            state: _currentStep > 1 ? StepState.complete : StepState.indexed,
          ),
          Step(
            title: const Text('الدفع'),
            content: _buildPaymentStep(),
            isActive: _currentStep >= 2,
            state: _currentStep > 2 ? StepState.complete : StepState.indexed,
          ),
          Step(
            title: const Text('المراجعة'),
            content: _buildReviewStep(),
            isActive: _currentStep >= 3,
            state: StepState.indexed,
          ),
        ],
      ),
    );
  }

  Widget _buildAddressStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ..._addresses.map((address) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: RadioListTile<String>(
              value: address['id'],
              groupValue: _useNewAddress ? 'new' : address['id'],
              onChanged: (value) {
                setState(() {
                  _useNewAddress = value == 'new';
                });
              },
              title: Text(address['name']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(address['phone']),
                  Text('${address['city']}, ${address['area']}'),
                ],
              ),
              secondary: address['isDefault']
                  ? Chip(
                      label: const Text('افتراضي'),
                      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                    )
                  : null,
            ),
          );
        }),
        OutlinedButton.icon(
          onPressed: () {
            // إضافة عنوان جديد
          },
          icon: const Icon(Icons.add),
          label: const Text('إضافة عنوان جديد'),
        ),
      ],
    );
  }

  Widget _buildShippingStep() {
    return Column(
      children: [
        _ShippingOption(
          title: 'توصيل عادي',
          subtitle: '3-5 أيام عمل',
          price: '25,000 ر.ي',
          isSelected: true,
          onTap: () {},
        ),
        _ShippingOption(
          title: 'توصيل سريع',
          subtitle: '1-2 أيام عمل',
          price: '50,000 ر.ي',
          isSelected: false,
          onTap: () {},
        ),
        _ShippingOption(
          title: 'توصيل فوري',
          subtitle: 'خلال 4 ساعات',
          price: '100,000 ر.ي',
          isSelected: false,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildPaymentStep() {
    return Column(
      children: [
        _PaymentOption(
          title: 'الدفع عند الاستلام',
          subtitle: 'ادفع نقداً عند استلام طلبك',
          icon: Icons.money,
          isSelected: _selectedPayment == 'cod',
          onTap: () {
            setState(() {
              _selectedPayment = 'cod';
            });
          },
        ),
        _PaymentOption(
          title: 'بطاقة ائتمان',
          subtitle: 'Visa, MasterCard',
          icon: Icons.credit_card,
          isSelected: _selectedPayment == 'card',
          onTap: () {
            setState(() {
              _selectedPayment = 'card';
            });
          },
        ),
        _PaymentOption(
          title: 'المحفظة (فلكس)',
          subtitle: 'ادفع من رصيدك',
          icon: Icons.account_balance_wallet,
          isSelected: _selectedPayment == 'wallet',
          onTap: () {
            setState(() {
              _selectedPayment = 'wallet';
            });
          },
        ),
        _PaymentOption(
          title: 'تحويل بنكي',
          subtitle: 'IBAN / حساب بنكي',
          icon: Icons.account_balance,
          isSelected: _selectedPayment == 'bank',
          onTap: () {
            setState(() {
              _selectedPayment = 'bank';
            });
          },
        ),
      ],
    );
  }

  Widget _buildReviewStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                const SizedBox(height: 8),
                Text('أحمد محمد'),
                Text('+967 777 123 456'),
                Text('صنعاء، شارع الزبيري'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'طريقة الشحن',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text('توصيل عادي - 3-5 أيام عمل'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'طريقة الدفع',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(_selectedPayment == 'cod'
                    ? 'الدفع عند الاستلام'
                    : _selectedPayment == 'card'
                        ? 'بطاقة ائتمان'
                        : _selectedPayment == 'wallet'
                            ? 'المحفظة (فلكس)'
                            : 'تحويل بنكي'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('المنتجات (3)'),
                    TextButton(
                      onPressed: () {},
                      child: const Text('عرض التفاصيل'),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ...List.generate(3, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text('منتج ${index + 1}'),
                        ),
                        Text('x${index + 1}'),
                        const SizedBox(width: 16),
                        Text(
                          '${(index + 1) * 50000} ر.ي',
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _couponController,
                        decoration: const InputDecoration(
                          hintText: 'أدخل كود الكوبون',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _appliedCoupon = _couponController.text;
                        });
                      },
                      child: const Text('تطبيق'),
                    ),
                  ],
                ),
                if (_appliedCoupon != null) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.green[700]),
                        const SizedBox(width: 8),
                        Text(
                          'تم تطبيق كوبون $_appliedCoupon',
                          style: TextStyle(color: Colors.green[700]),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _SummaryRow('المجموع الفرعي', '735,000 ر.ي'),
                _SummaryRow('الخصم', '-70,000 ر.ي'),
                _SummaryRow('رسوم الشحن', '25,000 ر.ي'),
                const Divider(),
                _SummaryRow('الإجمالي', '690,000 ر.ي', isBold: true),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _placeOrder() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            const Text('جاري معالجة طلبك...'),
          ],
        ),
      ),
    );

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          icon: Icon(
            Icons.check_circle,
            color: Colors.green[700],
            size: 60,
          ),
          title: const Text('تم استلام طلبك!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('رقم الطلب: #ORD-123456'),
              const SizedBox(height: 8),
              Text(
                'سيصلك إشعار عند تجهيز طلبك',
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('متابعة التسوق'),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/orders');
              },
              child: const Text('عرض طلباتي'),
            ),
          ],
        ),
      );
    });
  }
}

class _ShippingOption extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final bool isSelected;
  final VoidCallback onTap;

  const _ShippingOption({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Radio<bool>(
          value: true,
          groupValue: isSelected,
          onChanged: (v) => onTap(),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Text(
          price,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}

class _PaymentOption extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _PaymentOption({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Radio<String>(
          value: title,
          groupValue: isSelected ? title : '',
          onChanged: (v) => onTap(),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Icon(icon),
        onTap: onTap,
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
