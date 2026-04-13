import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../widgets/common/notification_item.dart';
import '../../widgets/common/empty_state_widget.dart';
import '../../models/notification/notification_model.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<NotificationModel> _allNotifications = [];
  List<NotificationModel> _unreadNotifications = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadNotifications();
  }

  void _loadNotifications() {
    final now = DateTime.now();
    _allNotifications = [
      NotificationModel(
        id: '1',
        title: 'طلب جديد',
        body: 'تم تأكيد طلبك رقم #1234',
        type: NotificationType.order,
        isRead: false,
        createdAt: now.subtract(const Duration(minutes: 5)),
      ),
      NotificationModel(
        id: '2',
        title: 'تم الدفع',
        body: 'تم شحن محفظتك بمبلغ 50000 ريال',
        type: NotificationType.payment,
        isRead: false,
        createdAt: now.subtract(const Duration(hours: 1)),
      ),
      NotificationModel(
        id: '3',
        title: 'عرض خاص',
        body: 'خصم 20% على جميع المطاعم اليوم!',
        type: NotificationType.promo,
        isRead: true,
        createdAt: now.subtract(const Duration(days: 1)),
      ),
      NotificationModel(
        id: '4',
        title: 'تحديث التطبيق',
        body: 'يتوفر تحديث جديد للتطبيق',
        type: NotificationType.system,
        isRead: true,
        createdAt: now.subtract(const Duration(days: 2)),
      ),
    ];
    _unreadNotifications =
        _allNotifications.where((n) => !n.isRead).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        title: const Text(AppStrings.notifications),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.cardColor,
        foregroundColor: AppColors.textPrimary,
        actions: [
          TextButton(
            onPressed: () {
              _markAllAsRead();
            },
            child: Text(
              'تحديد الكل كمقروء',
              style: TextStyle(
                color: AppColors.goldColor,
                fontSize: 12,
              ),
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.goldColor,
          unselectedLabelColor: AppColors.textSecondary,
          indicatorColor: AppColors.goldColor,
          tabs: [
            Tab(text: 'الكل (${_allNotifications.length})'),
            Tab(text: 'غير المقروءة (${_unreadNotifications.length})'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildNotificationsList(_allNotifications),
          _buildNotificationsList(_unreadNotifications),
        ],
      ),
    );
  }

  Widget _buildNotificationsList(List<NotificationModel> notifications) {
    if (notifications.isEmpty) {
      return EmptyStateWidget(
        icon: Icons.notifications_none,
        title: 'لا توجد إشعارات',
        subtitle: 'ستظهر الإشعارات الجديدة هنا',
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return NotificationItem(
          notification: notification,
          onTap: () {
            _markAsRead(notification.id);
          },
          onDismiss: () {
            _deleteNotification(notification.id);
          },
        );
      },
    );
  }

  void _markAsRead(String id) {
    setState(() {
      final index = _allNotifications.indexWhere((n) => n.id == id);
      if (index != -1) {
        _allNotifications[index].isRead = true;
      }
      _unreadNotifications =
          _allNotifications.where((n) => !n.isRead).toList();
    });
  }

  void _markAllAsRead() {
    setState(() {
      for (var notification in _allNotifications) {
        notification.isRead = true;
      }
      _unreadNotifications = [];
    });
  }

  void _deleteNotification(String id) {
    setState(() {
      _allNotifications.removeWhere((n) => n.id == id);
      _unreadNotifications =
          _allNotifications.where((n) => !n.isRead).toList();
    });
  }
}
