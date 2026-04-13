import 'package:flutter/material.dart';

class AppColors {
  // الألوان الذهبية (الهوية الرئيسية)
  static const Color goldColor = Color(0xFFD4AF37);
  static const Color goldLight = Color(0xFFF4D03F);
  static const Color goldDark = Color(0xFFB8860B);
  static const Color goldShine = Color(0xFFFFD700);
  static const Color goldMatte = Color(0xFFC5A059);

  // ألوان النجاح والفشل
  static const Color success = Color(0xFF00A15C);
  static const Color error = Color(0xFFE5493A);
  static const Color warning = Color(0xFFFCD535);
  static const Color info = Color(0xFF1E88E5);

  // ألوان النصوص
  static const Color textPrimary = Color(0xFF1E2329);
  static const Color textSecondary = Color(0xFF707A8A);
  static const Color textTertiary = Color(0xFFB7BDC6);
  static const Color textLight = Color(0xFFFFFFFF);

  // ألوان الخلفية
  static const Color background = Color(0xFFFFFFFF);
  static const Color backgroundDark = Color(0xFF0B0E11);
  static const Color backgroundGrey = Color(0xFFF5F5F5);
  static const Color surface = Color(0xFFF8F9FA);

  // ألوان إضافية
  static const Color primaryColor = Color(0xFF1E88E5);
  static const Color secondaryColor = Color(0xFF43A047);
  static const Color accentColor = Color(0xFFFFB300);

  // تدرجات ذهبية
  static const LinearGradient goldGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [goldLight, goldColor, goldDark],
  );

  static const LinearGradient goldShimmerGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0x00FFFFFF),
      Color(0x33FFFFFF),
      Color(0x00FFFFFF),
    ],
    stops: [0.0, 0.5, 1.0],
  );
}
