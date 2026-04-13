import 'package:flutter/material.dart';

/// شاشة تسجيل الدخول الاجتماعي
class SocialLoginScreen extends StatelessWidget {
  const SocialLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تسجيل الدخول'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            const Text(
              'تسجيل الدخول بحسابك',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'اختر طريقة تسجيل الدخول المفضلة',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            _SocialLoginButton(
              icon: Icons.g_mobiledata,
              label: 'المتابعة مع Google',
              color: Colors.red[600]!,
              onTap: () => _handleLogin(context, 'google'),
            ),
            const SizedBox(height: 16),
            _SocialLoginButton(
              icon: Icons.facebook,
              label: 'المتابعة مع Facebook',
              color: Colors.blue[700]!,
              onTap: () => _handleLogin(context, 'facebook'),
            ),
            const SizedBox(height: 16),
            _SocialLoginButton(
              icon: Icons.apple,
              label: 'المتابعة مع Apple',
              color: Colors.black,
              onTap: () => _handleLogin(context, 'apple'),
            ),
            const SizedBox(height: 16),
            _SocialLoginButton(
              icon: Icons.link,
              label: 'المتابعة مع Twitter',
              color: Colors.blue[400]!,
              onTap: () => _handleLogin(context, 'twitter'),
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                const Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'أو',
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                ),
                const Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 24),
            OutlinedButton.icon(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/phone-login');
              },
              icon: const Icon(Icons.phone),
              label: const Text('تسجيل الدخول بالهاتف'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'بالمتابعة، أنت توافق على شروط الاستخدام وسياسة الخصوصية',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[500],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _handleLogin(BuildContext context, String provider) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('جاري تسجيل الدخول بـ $provider...')),
    );

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }
}

class _SocialLoginButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _SocialLoginButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 28),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }
}
