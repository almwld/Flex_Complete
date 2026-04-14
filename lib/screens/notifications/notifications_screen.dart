import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../models/notification/notification_model.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<NotificationModel> _notifications = [];

  @override
  void initState() {
    super.initState();
    _loadNotifications();
  }

  void _loadNotifications() {
    _notifications = [
      NotificationModel(
        id: '1',
        userId: '1',
        title: 'طلب جديد',
        body: 'تم استلام طلبك رقم #1234',
        createdAt: DateTime.now(),
      ),
      NotificationModel(
        id: '2',
        userId: '1',
        title: 'عرض خاص',
        body: 'خصم 20% على جميع المنتجات',
        createdAt: DateTime.now(),
      ),
    ];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.getBackgroundColor(context),
      appBar: AppBar(
        title: const Text('الإشعارات'),
        backgroundColor: AppColors.getSurfaceColor(context),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _notifications.length,
        itemBuilder: (context, index) {
          final notification = _notifications[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.goldColor.withOpacity(0.2),
                child: const Icon(Icons.notifications, color: AppColors.goldColor),
              ),
              title: Text(notification.title),
              subtitle: Text(notification.body),
              trailing: Text(
                '${notification.createdAt.hour}:${notification.createdAt.minute}',
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ),
          );
        },
      ),
    );
  }
}
