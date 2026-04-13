import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../models/order/order_model.dart';

class OrderStatusTracker extends StatelessWidget {
  final List<OrderStatus> statuses;
  final int currentIndex;

  const OrderStatusTracker({
    super.key,
    required this.statuses,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < statuses.length; i++) ...[
          _buildStatusItem(statuses[i], i),
          if (i < statuses.length - 1)
            _buildConnector(i < currentIndex),
        ],
      ],
    );
  }

  Widget _buildStatusItem(OrderStatus status, int index) {
    final isCompleted = index < currentIndex;
    final isCurrent = index == currentIndex;
    final isPending = index > currentIndex;

    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: isCompleted || isCurrent
                ? AppColors.goldColor
                : AppColors.borderColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: isCompleted
                ? const Icon(Icons.check, color: Colors.white, size: 18)
                : Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: isCurrent ? Colors.white : AppColors.textSecondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _getStatusTitle(status),
                style: TextStyle(
                  fontWeight: isCurrent ? FontWeight.bold : FontWeight.w500,
                  color: isPending ? AppColors.textSecondary : null,
                ),
              ),
              Text(
                _getStatusDescription(status),
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildConnector(bool isCompleted) {
    return Container(
      width: 2,
      height: 30,
      margin: const EdgeInsets.only(left: 15),
      color: isCompleted ? AppColors.goldColor : AppColors.borderColor,
    );
  }

  String _getStatusTitle(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return 'قيد الانتظار';
      case OrderStatus.confirmed:
        return 'تم التأكيد';
      case OrderStatus.preparing:
        return 'جارٍ التحضير';
      case OrderStatus.ready:
        return 'جاهز للتوصيل';
      case OrderStatus.onTheWay:
        return 'في الطريق';
      case OrderStatus.delivered:
        return 'تم التوصيل';
      case OrderStatus.cancelled:
        return 'ملغي';
    }
  }

  String _getStatusDescription(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return 'تم استلام طلبك';
      case OrderStatus.confirmed:
        return 'المتجر أكد الطلب';
      case OrderStatus.preparing:
        return 'جارٍ تجهيز طلبك';
      case OrderStatus.ready:
        return 'طلبك جاهز';
      case OrderStatus.onTheWay:
        return 'المندوب في الطريق إليك';
      case OrderStatus.delivered:
        return 'تم توصيل طلبك بنجاح';
      case OrderStatus.cancelled:
        return 'تم إلغاء الطلب';
    }
  }
}
