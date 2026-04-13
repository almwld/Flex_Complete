import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../widgets/common/user_profile_header.dart';
import '../../widgets/common/profile_menu_item.dart';
import '../../models/user/user_model.dart';
import '../../providers/auth_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final user = authProvider.user ?? _getMockUser();

    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: SingleChildScrollView(
        child: Column(
          children: [
            UserProfileHeader(
              user: user,
              viewMode: context.watch<AuthProvider>().viewMode,
              onEditProfile: () {},
              onSettingsTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
            const SizedBox(height: 16),
            _buildMenuSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          ProfileMenuItem(
            icon: Icons.shopping_bag_outlined,
            title: 'طلباتي',
            subtitle: 'تابع طلباتك السابقة',
            onTap: () {
              Navigator.pushNamed(context, '/orders');
            },
          ),
          ProfileMenuItem(
            icon: Icons.favorite_border,
            title: 'المفضلة',
            subtitle: 'قائمة منتجاتك المفضلة',
            onTap: () {
              Navigator.pushNamed(context, '/favorites');
            },
          ),
          ProfileMenuItem(
            icon: Icons.location_on_outlined,
            title: 'العناوين',
            subtitle: 'إدارة عناوين التوصيل',
            onTap: () {},
          ),
          ProfileMenuItem(
            icon: Icons.payment_outlined,
            title: 'طرق الدفع',
            subtitle: 'إدارة بطاقات الدفع',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  UserModel _getMockUser() {
    return UserModel(
      id: '1',
      name: 'أحمد محمد علي',
      email: 'ahmed@example.com',
      phone: '+967771234567',
      avatarUrl: null,
      createdAt: DateTime.now(),
    );
  }
}
