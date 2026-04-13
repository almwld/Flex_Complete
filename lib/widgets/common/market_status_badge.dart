import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class MarketStatusBadge extends StatelessWidget {
  final bool isOpen;
  final bool showDelivery;
  final bool isDeliveryAvailable;

  const MarketStatusBadge({
    super.key,
    required this.isOpen,
    this.showDelivery = false,
    this.isDeliveryAvailable = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: isOpen
                ? Colors.green.withValues(alpha: 0.1)
                : Colors.red.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: isOpen ? Colors.green : Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                isOpen ? 'مفتوح' : 'مغلق',
                style: TextStyle(
                  fontSize: 11,
                  color: isOpen ? Colors.green : Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        if (showDelivery && isDeliveryAvailable) ...[
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.goldColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.delivery_dining,
                  size: 12,
                  color: AppColors.goldColor,
                ),
                const SizedBox(width: 4),
                Text(
                  'توصيل',
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors.goldColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
