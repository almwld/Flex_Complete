import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final bool readOnly;
  final Widget? leading;
  final Widget? trailing;

  const SearchBarWidget({
    super.key,
    this.controller,
    this.hintText = 'ابحث...',
    this.onTap,
    this.onChanged,
    this.readOnly = false,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor.withValues(alpha: 0.5)),
      ),
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        onTap: onTap,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: AppColors.textSecondary),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          prefixIcon: leading ??
              Icon(
                Icons.search,
                color: AppColors.textSecondary,
              ),
          suffixIcon: trailing,
        ),
      ),
    );
  }
}
