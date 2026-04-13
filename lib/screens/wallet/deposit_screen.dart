import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/utils/validators.dart';
import '../../providers/wallet_provider.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/common/custom_text_field.dart';

class DepositScreen extends StatefulWidget {
  const DepositScreen({super.key});

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  String _selectedMethod = 'تحويل بنكي';

  final _methods = [
    {'name': 'تحويل بنكي', 'icon': Icons.account_balance},
    {'name': 'محفظة إلكترونية', 'icon': Icons.account_balance_wallet},
    {'name': 'بطاقة هدايا', 'icon': Icons.card_giftcard},
    {'name': 'إيداع نقدي', 'icon': Icons.payments},
  ];

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  Future<void> _deposit() async {
    if (_formKey.currentState?.validate() ?? false) {
      final walletProvider = Provider.of<WalletProvider>(context, listen: false);
      final amount = double.parse(_amountController.text.replaceAll(RegExp(r'[^\d.]'), ''));

      final success = await walletProvider.deposit(
        amount: amount,
        method: _selectedMethod,
      );

      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('تم الإيداع بنجاح'),
            backgroundColor: AppColors.success,
          ),
        );
        Navigator.pop(context);
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(walletProvider.error ?? 'فشل الإيداع'),
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
        title: const Text('إيداع'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Method Selection
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
                      'طريقة الإيداع',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...List.generate(_methods.length, (index) {
                      final method = _methods[index];
                      final isSelected = _selectedMethod == method['name'];
                      return GestureDetector(
                        onTap: () => setState(() => _selectedMethod = method['name'] as String),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.goldColor.withOpacity(0.1)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.goldColor
                                  : Colors.grey.shade300,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppColors.goldColor
                                      : Colors.grey.shade200,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  method['icon'] as IconData,
                                  size: 20,
                                  color: isSelected ? Colors.black : Colors.grey,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                method['name'] as String,
                                style: TextStyle(
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  color: isSelected
                                      ? AppColors.goldColor
                                      : AppColors.textPrimary,
                                ),
                              ),
                              const Spacer(),
                              if (isSelected)
                                const Icon(
                                  Icons.check_circle,
                                  color: AppColors.goldColor,
                                ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Amount Field
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.getCardColor(context),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: CustomTextField(
                  controller: _amountController,
                  label: 'المبلغ',
                  hint: '0',
                  keyboardType: TextInputType.number,
                  prefixIcon: const Icon(Icons.money),
                  validator: AppValidators.validateAmount,
                ),
              ),
              const SizedBox(height: 24),
              // Deposit Button
              Consumer<WalletProvider>(
                builder: (context, walletProvider, child) {
                  return CustomButton(
                    text: 'إيداع الآن',
                    onPressed: _deposit,
                    isLoading: walletProvider.isLoading,
                    icon: Icons.add,
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
