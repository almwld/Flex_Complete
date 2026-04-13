import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppEnums {
  // Transaction Types
  static const Map<String, IconData> transactionIcons = {
    'deposit': Icons.add_circle,
    'withdraw': Icons.remove_circle,
    'transfer': Icons.swap_horiz,
    'payment': Icons.payment,
    'recharge': Icons.phone_android,
    'bill': Icons.receipt,
  };

  // Order Status
  static const Map<String, Color> orderStatusColors = {
    'pending': Color(0xFFFFB300),
    'confirmed': Color(0xFF1E88E5),
    'preparing': Color(0xFF667eea),
    'shipped': Color(0xFF43A047),
    'delivered': Color(0xFF00A15C),
    'cancelled': Color(0xFFE5493A),
  };

  // User Types
  static const List<String> userTypes = [
    'customer',
    'seller',
    'vendor',
    'admin',
  ];

  // Account Types
  static const List<String> accountTypes = [
    'personal',
    'business',
    'corporate',
  ];

  // Payment Methods
  static const List<String> paymentMethods = [
    'wallet',
    'card',
    'bank',
    'cash',
  ];

  // Transfer Services
  static const List<String> transferServices = [
    'flex_pay',
    'cash',
    'yemen_mobile',
    'sabafon',
    'you',
    'wasil',
    'bank',
  ];

  // Bill Types
  static const List<String> billTypes = [
    'electricity',
    'water',
    'internet',
    'phone',
  ];

  // Notification Types
  static const List<String> notificationTypes = [
    'order',
    'payment',
    'promotion',
    'system',
    'chat',
  ];

  // Message Status
  static const Map<String, IconData> messageStatusIcons = {
    'sent': Icons.check,
    'delivered': Icons.done_all,
    'read': Icons.done_all,
    'failed': Icons.error,
  };
}

// Transaction Status
enum TransactionStatus {
  pending,
  completed,
  failed,
  cancelled,
}

// Notification Priority
enum NotificationPriority {
  low,
  medium,
  high,
}

// Market Type
enum MarketType {
  traditional, // أسواق تقليدية
  mall,        // مولات
  cafe,        // مقاهي
  hotel,       // فنادق
  restaurant,  // مطاعم
  electronics, // إلكترونيات
  cars,        // سيارات
  realEstate,  // عقارات
  fashion,     // أزياء
  restArea,    // استراحات
}

// Product Status
enum ProductStatus {
  active,
  pending,
  sold,
  deleted,
}

// Review Status
enum ReviewStatus {
  pending,
  approved,
  rejected,
}

// Support Ticket Status
enum TicketStatus {
  open,
  inProgress,
  resolved,
  closed,
}

// Ticket Priority
enum TicketPriority {
  low,
  medium,
  high,
  urgent,
}

// Extension for enum to string
extension TransactionStatusExtension on TransactionStatus {
  String get label {
    switch (this) {
      case TransactionStatus.pending:
        return 'معلق';
      case TransactionStatus.completed:
        return 'مكتمل';
      case TransactionStatus.failed:
        return 'فشل';
      case TransactionStatus.cancelled:
        return 'ملغي';
    }
  }

  Color get color {
    switch (this) {
      case TransactionStatus.pending:
        return AppColors.warning;
      case TransactionStatus.completed:
        return AppColors.success;
      case TransactionStatus.failed:
        return AppColors.error;
      case TransactionStatus.cancelled:
        return AppColors.textSecondary;
    }
  }
}

extension MarketTypeExtension on MarketType {
  String get label {
    switch (this) {
      case MarketType.traditional:
        return 'أسواق تقليدية';
      case MarketType.mall:
        return 'مولات';
      case MarketType.cafe:
        return 'مقاهي';
      case MarketType.hotel:
        return 'فنادق';
      case MarketType.restaurant:
        return 'مطاعم';
      case MarketType.electronics:
        return 'إلكترونيات';
      case MarketType.cars:
        return 'سيارات';
      case MarketType.realEstate:
        return 'عقارات';
      case MarketType.fashion:
        return 'أزياء';
      case MarketType.restArea:
        return 'استراحات';
    }
  }
}

extension TicketStatusExtension on TicketStatus {
  String get label {
    switch (this) {
      case TicketStatus.open:
        return 'مفتوح';
      case TicketStatus.inProgress:
        return 'قيد المعالجة';
      case TicketStatus.resolved:
        return 'تم الحل';
      case TicketStatus.closed:
        return 'مغلق';
    }
  }

  Color get color {
    switch (this) {
      case TicketStatus.open:
        return AppColors.warning;
      case TicketStatus.inProgress:
        return AppColors.info;
      case TicketStatus.resolved:
        return AppColors.success;
      case TicketStatus.closed:
        return AppColors.textSecondary;
    }
  }
}