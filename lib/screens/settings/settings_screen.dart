import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../widgets/common/profile_menu_item.dart';
import '../../providers/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        title: const Text(AppStrings.settings),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.cardColor,
        foregroundColor: AppColors.textPrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('عام'),
            _buildSettingsCard([
              ProfileMenuItem(
                icon: Icons.dark_mode_outlined,
                title: 'الوضع الداكن',
                subtitle: 'تفعيل الوضع الليلي',
                onTap: () {},
                trailing: Switch(
                  value: themeProvider.isDarkMode,
                  onChanged: (value) {
                    themeProvider.toggleTheme();
                  },
                  activeColor: AppColors.goldColor,
                ),
                showDivider: false,
              ),
            ]),
            const SizedBox(height: 20),
            _buildSectionTitle('الحساب'),
            _buildSettingsCard([
              ProfileMenuItem(
                icon: Icons.language,
                title: 'اللغة',
                subtitle: 'العربية',
                onTap: () {},
              ),
              ProfileMenuItem(
                icon: Icons.notifications_outlined,
                title: 'الإشعارات',
                subtitle: 'إدارة تنبيهات التطبيق',
                onTap: () {},
              ),
              ProfileMenuItem(
                icon: Icons.lock_outline,
                title: 'الأمان',
                subtitle: 'تغيير كلمة المرور',
                onTap: () {},
              ),
            ]),
            const SizedBox(height: 20),
            _buildSectionTitle('الدعم'),
            _buildSettingsCard([
              ProfileMenuItem(
                icon: Icons.help_outline,
                title: 'مركز المساعدة',
                onTap: () {},
              ),
              ProfileMenuItem(
                icon: Icons.chat_outlined,
                title: 'تواصل معنا',
                onTap: () {},
              ),
              ProfileMenuItem(
                icon: Icons.info_outline,
                title: 'من نحن',
                onTap: () {},
              ),
              ProfileMenuItem(
                icon: Icons.description_outlined,
                title: 'الشروط والأحكام',
                onTap: () {},
              ),
              ProfileMenuItem(
                icon: Icons.privacy_tip_outlined,
                title: 'سياسة الخصوصية',
                onTap: () {},
                showDivider: false,
              ),
            ]),
            const SizedBox(height: 20),
            _buildSectionTitle('التطبيق'),
            _buildSettingsCard([
              ProfileMenuItem(
                icon: Icons.star_outline,
                title: 'قيّم التطبيق',
                onTap: () {},
              ),
              ProfileMenuItem(
                icon: Icons.share_outlined,
                title: 'مشاركة التطبيق',
                onTap: () {},
                showDivider: false,
              ),
            ]),
            const SizedBox(height: 24),
            Center(
              child: TextButton(
                onPressed: () {
                  // Logout
                },
                child: const Text(
                  'تسجيل الخروج',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                'نسخة 1.0.0',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }

  Widget _buildSettingsCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(children: children),
    );
  }
}
