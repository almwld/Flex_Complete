import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/utils/currency_utils.dart';
import '../../providers/wallet_provider.dart';
import '../../widgets/common/custom_app_bar.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? _selectedFilter;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundGrey,
      appBar: CustomAppBar(
        title: 'المعاملات',
        showBackButton: true,
        showNotification: false,
      ),
      body: Column(
        children: [
          // Filter Tabs
          Container(
            color: AppColors.getCardColor(context),
            child: TabBar(
              controller: _tabController,
              labelColor: AppColors.goldColor,
              unselectedLabelColor: AppColors.textSecondary,
              indicatorColor: AppColors.goldColor,
              tabs: const [
                Tab(text: 'الكل'),
                Tab(text: 'إيداع'),
                Tab(text: 'سحب'),
                Tab(text: 'تحويل'),
              ],
            ),
          ),
          // Transactions List
          Expanded(
            child: Consumer<WalletProvider>(
              builder: (context, walletProvider, child) {
                if (walletProvider.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.goldColor,
                    ),
                  );
                }

                if (walletProvider.transactions.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.receipt_long,
                          size: 80,
                          color: AppColors.goldColor.withOpacity(0.3),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'لا توجد معاملات',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'ستظهر معاملاتك هنا',
                          style: TextStyle(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return TabBarView(
                  controller: _tabController,
                  children: [
                    _buildTransactionsList(walletProvider.transactions),
                    _buildTransactionsList(
                      walletProvider.transactions
                          .where((t) => t.type == 'deposit')
                          .toList(),
                    ),
                    _buildTransactionsList(
                      walletProvider.transactions
                          .where((t) => t.type == 'withdraw')
                          .toList(),
                    ),
                    _buildTransactionsList(
                      walletProvider.transactions
                          .where((t) => t.type == 'transfer' || t.type == 'receive')
                          .toList(),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionsList(List transactions) {
    if (transactions.isEmpty) {
      return Center(
        child: Text(
          'لا توجد معاملات',
          style: TextStyle(color: AppColors.textSecondary),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        final isIncoming = transaction.isIncoming;

        IconData icon;
        Color iconColor;

        switch (transaction.type) {
          case 'deposit':
            icon = Icons.add;
            iconColor = AppColors.success;
            break;
          case 'withdraw':
            icon = Icons.remove;
            iconColor = AppColors.error;
            break;
          case 'transfer':
            icon = Icons.send;
            iconColor = AppColors.info;
            break;
          case 'receive':
            icon = Icons.arrow_downward;
            iconColor = AppColors.success;
            break;
          case 'payment':
            icon = Icons.payment;
            iconColor = AppColors.warning;
            break;
          default:
            icon = Icons.swap_horiz;
            iconColor = AppColors.goldColor;
        }

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.getCardColor(context),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.description ?? _getTransactionTitle(transaction.type),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      transaction.createdAt.toString().substring(0, 16),
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${isIncoming ? '+' : '-'}${AppCurrencyUtils.formatYemeniRial(transaction.amount)}',
                    style: TextStyle(
                      color: isIncoming ? AppColors.success : AppColors.error,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: _getStatusColor(transaction.status).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      _getStatusText(transaction.status),
                      style: TextStyle(
                        color: _getStatusColor(transaction.status),
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  String _getTransactionTitle(String type) {
    switch (type) {
      case 'deposit':
        return 'إيداع';
      case 'withdraw':
        return 'سحب';
      case 'transfer':
        return 'تحويل';
      case 'receive':
        return 'استلام';
      case 'payment':
        return 'دفع';
      case 'recharge':
        return 'شحن';
      case 'bill':
        return 'فاتورة';
      default:
        return 'معاملة';
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'completed':
        return AppColors.success;
      case 'pending':
        return AppColors.warning;
      case 'failed':
        return AppColors.error;
      default:
        return AppColors.textSecondary;
    }
  }

  String _getStatusText(String status) {
    switch (status) {
      case 'completed':
        return 'مكتمل';
      case 'pending':
        return 'قيد الانتظار';
      case 'failed':
        return 'فشل';
      default:
        return status;
    }
  }
}
