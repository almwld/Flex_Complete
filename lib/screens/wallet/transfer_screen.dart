import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/utils/currency_utils.dart';
import '../../core/utils/validators.dart';
import '../../providers/wallet_provider.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/common/custom_text_field.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _recipientController = TextEditingController();
  final _noteController = TextEditingController();
  String _selectedService = 'فلكس باي';

  final _services = [
    {'name': 'فلكس باي', 'icon': Icons.payment},
    {'name': 'كاش', 'icon': Icons.money},
    {'name': 'يمن موبايل', 'icon': Icons.phone_android},
    {'name': 'سبأفون', 'icon': Icons.phone},
    {'name': 'YOU', 'icon': Icons.smartphone},
    {'name': 'بنك', 'icon': Icons.account_balance},
  ];

  @override
  void dispose() {
    _amountController.dispose();
    _recipientController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _transfer() async {
    if (_formKey.currentState?.validate() ?? false) {
      final walletProvider = Provider.of<WalletProvider>(context, listen: false);
      final amount = double.parse(_amountController.text.replaceAll(RegExp(r'[^\d.]'), ''));

      final success = await walletProvider.transfer(
        amount: amount,
        recipientId: _recipientController.text,
        recipientType: _selectedService,
        note: _noteController.text,
      );

      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('تم التحويل بنجاح'),
            backgroundColor: AppColors.success,
          ),
        );
        Navigator.pop(context);
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(walletProvider.error ?? 'فشل التحويل'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundGrey,
      appBar: AppBar(
        title: const Text('تحويل'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Service Selection
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.getCardColor(context),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'اختر طريقة التحويل',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _services.map((service) {
                        final isSelected = _selectedService == service['name'];
                        return GestureDetector(
                          onTap: () => setState(() => _selectedService = service['name'] as String),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.goldColor
                                  : AppColors.surface,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.goldColor
                                    : Colors.grey.shade300,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  service['icon'] as IconData,
                                  size: 18,
                                  color: isSelected ? Colors.black : Colors.grey,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  service['name'] as String,
                                  style: TextStyle(
                                    color: isSelected ? Colors.black : Colors.grey,
                                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Amount Field
              Consumer<WalletProvider>(
                builder: (context, walletProvider, child) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.getCardColor(context),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'المبلغ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: _amountController,
                          hint: '0',
                          keyboardType: TextInputType.number,
                          prefixIcon: const Icon(Icons.money),
                          validator: AppValidators.validateAmount,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'الرصيد المتاح: ${AppCurrencyUtils.formatYemeniRial(walletProvider.balanceYER)}',
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              // Recipient Field
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.getCardColor(context),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: CustomTextField(
                  controller: _recipientController,
                  label: 'رقم المستلم أو الحساب',
                  hint: '777123456',
                  prefixIcon: const Icon(Icons.person),
                  validator: (value) => AppValidators.validateRequired(value, 'رقم المستلم'),
                ),
              ),
              const SizedBox(height: 16),
              // Note Field
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.getCardColor(context),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: CustomTextField(
                  controller: _noteController,
                  label: 'ملاحظة (اختياري)',
                  hint: 'اكتب ملاحظة هنا...',
                  prefixIcon: const Icon(Icons.note),
                  maxLines: 2,
                ),
              ),
              const SizedBox(height: 24),
              // Transfer Button
              Consumer<WalletProvider>(
                builder: (context, walletProvider, child) {
                  return CustomButton(
                    text: 'تحويل الآن',
                    onPressed: _transfer,
                    isLoading: walletProvider.isLoading,
                    icon: Icons.send,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
