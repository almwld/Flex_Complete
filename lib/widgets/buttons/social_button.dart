import 'package:flutter/material.dart';

/// زر تسجيل الدخول الاجتماعي
class SocialButton extends StatelessWidget {
  final String provider;
  final VoidCallback onPressed;
  final bool isLoading;

  const SocialButton({
    super.key,
    required this.provider,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: _getColor(),
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: isLoading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(_getIcon()),
                const SizedBox(width: 8),
                Text(_getLabel()),
              ],
            ),
    );
  }

  Color _getColor() {
    switch (provider.toLowerCase()) {
      case 'google':
        return Colors.red[600]!;
      case 'facebook':
        return Colors.blue[700]!;
      case 'apple':
        return Colors.black;
      case 'twitter':
        return Colors.blue[400]!;
      default:
        return Colors.grey;
    }
  }

  IconData _getIcon() {
    switch (provider.toLowerCase()) {
      case 'google':
        return Icons.g_mobiledata;
      case 'facebook':
        return Icons.facebook;
      case 'apple':
        return Icons.apple;
      case 'twitter':
        return Icons.link;
      default:
        return Icons.login;
    }
  }

  String _getLabel() {
    switch (provider.toLowerCase()) {
      case 'google':
        return 'المتابعة مع Google';
      case 'facebook':
        return 'المتابعة مع Facebook';
      case 'apple':
        return 'المتابعة مع Apple';
      case 'twitter':
        return 'المتابعة مع Twitter';
      default:
        return 'تسجيل الدخول';
    }
  }
}
