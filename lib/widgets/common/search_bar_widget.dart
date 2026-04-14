import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onSearch;
  final VoidCallback? onFilter;
  final String hintText;

  const SearchBarWidget({
    super.key,
    this.controller,
    this.onSearch,
    this.onFilter,
    this.hintText = 'ابحث عن منتج...',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.getCardColor(context),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: AppColors.getSecondaryTextColor(context)),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              onSubmitted: (_) => onSearch?.call(),
            ),
          ),
          if (onFilter != null)
            IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: onFilter,
              color: AppColors.goldColor,
            ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: onSearch,
            color: AppColors.goldColor,
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
