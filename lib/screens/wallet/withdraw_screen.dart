import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/utils/currency_utils.dart';
import '../../core/utils/validators.dart';
import '../../providers/wallet_provider.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/common/custom_text_field.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _accountController = TextEditingController();
  String _selectedMethod = 'حساب بنكي';

  final _methods = [
    {'name': 'حساب بنكي', 'icon': Icons.account_balance},
    {'name': 'محفظة إلكترونية', 'icon': Icons.account_balance_wallet},
    {'name': 'سحب نقدي', 'icon': Icons.money},
  ];

  @override
  void dispose() {
    _amountController.dispose();
    _accountController.dispose();
    super.dispose();
  }

  Future<void> _withdraw() async {
    if (_formKey.currentState?.validate() ?? false) {
      final walletProvider = Provider.of<WalletProvider>(context, listen: false);
      final amount = double.parse(_amountController.text.replaceAll(RegExp(r'[^\d.]'), ''));

      final success = await walletProvider.withdraw(
        amount: amount,
        method: _selectedMethod,
        withdrawalData: {
          'account': _accountController.text,
        },
      );

      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('تم السحب بنجاح'),
            backgroundColor: AppColors.success,
          ),
        );
        Navigator.pop(context);
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(walletProvider.error ?? 'فشل السحب'),
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
        title: const Text('سحب'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Balance Info
              Consumer<WalletProvider>(
                builder: (context, walletProvider, child) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: AppColors.goldGradient,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'الرصيد المتاح للسحب',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          AppCurrencyUtils.formatYemeniRial(walletProvider.balanceYER),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
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
                      'طريقة السحب',
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
                              Icon(
                                method['icon'] as IconData,
                                color: isSelected
                                    ? AppColors.goldColor
                                    : AppColors.textSecondary,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                method['name'] as String,
                                style: TextStyle(
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
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
              const SizedBox(height: 16),
              // Account Field
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.getCardColor(context),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: CustomTextField(
                  controller: _accountController,
                  label: 'رقم الحساب أو المحفظة',
                  hint: 'أدخل رقم الحساب',
                  prefixIcon: const Icon(Icons.numbers),
                  validator: (value) => AppValidators.validateRequired(value, 'رقم الحساب'),
                ),
              ),
              const SizedBox(height: 24),
              // Withdraw Button
              Consumer<WalletProvider>(
                builder: (context, walletProvider, child) {
                  return CustomButton(
                    text: 'سحب الآن',
                    onPressed: _withdraw,
                    isLoading: walletProvider.isLoading,
                    icon: Icons.remove,
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
