import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../providers/auth_provider.dart';
import '../../providers/wallet_provider.dart';
import '../../providers/cart_provider.dart';
import '../../widgets/main_navigation_bar.dart';
import 'wallet_screen.dart';
import 'home_screen.dart';
import 'profile/profile_screen.dart';
import 'orders/orders_screen.dart';
import 'ai_assistant/ai_assistant_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ShopScreen(),
    const WalletScreen(),
    const OrdersScreen(),
    const AIAssistantScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final walletProvider = Provider.of<WalletProvider>(context);

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: MainNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        notificationsCount: 3,
        cartCount: cartProvider.itemCount,
      ),
      floatingActionButton: _buildQuickActionButton(context),
    );
  }

  Widget _buildQuickActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => _buildQuickActionsSheet(context),
        );
      },
      backgroundColor: AppColors.goldColor,
      child: const Icon(Icons.add, color: Colors.white),
    );
  }

  Widget _buildQuickActionsSheet(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'إجراءات سريعة',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                _QuickActionItem(
                  icon: Icons.qr_code_scanner,
                  label: 'مسح QR',
                  color: Colors.blue,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/scan-qr');
                  },
                ),
                _QuickActionItem(
                  icon: Icons.add_business,
                  label: 'إضافة منتج',
                  color: Colors.green,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/add-product');
                  },
                ),
                _QuickActionItem(
                  icon: Icons.receipt_long,
                  label: 'فاتورة جديدة',
                  color: Colors.orange,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/new-invoice');
                  },
                ),
                _QuickActionItem(
                  icon: Icons.support_agent,
                  label: 'الدعم',
                  color: Colors.purple,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/support');
                  },
                ),
                _QuickActionItem(
                  icon: Icons.campaign,
                  label: 'إعلان',
                  color: Colors.red,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/create-ad');
                  },
                ),
                _QuickActionItem(
                  icon: Icons.share,
                  label: 'مشاركة',
                  color: AppColors.goldColor,
                  onTap: () {
                    Navigator.pop(context);
                    // Share functionality
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class _QuickActionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _QuickActionItem({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// Shop Screen placeholder
class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المتجر'),
        backgroundColor: AppColors.goldColor,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text('قريباً - قسم المتجر'),
      ),
    );
  }
}