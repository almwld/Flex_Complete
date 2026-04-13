import 'package:flutter/material.dart';

/// مزود الإشعارات
class NotificationProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _notifications = [];
  int _unreadCount = 0;

  List<Map<String, dynamic>> get notifications => _notifications;
  int get unreadCount => _unreadCount;

  /// إضافة إشعار
  void addNotification(Map<String, dynamic> notification) {
    _notifications.insert(0, notification);
    if (notification['isRead'] == false) {
      _unreadCount++;
    }
    notifyListeners();
  }

  /// تحديد الإشعار كمقروء
  void markAsRead(int index) {
    if (_notifications[index]['isRead'] == false) {
      _notifications[index]['isRead'] = true;
      _unreadCount--;
      notifyListeners();
    }
  }

  /// تحديد الكل كمقروء
  void markAllAsRead() {
    for (var notification in _notifications) {
      notification['isRead'] = true;
    }
    _unreadCount = 0;
    notifyListeners();
  }

  /// حذف إشعار
  void deleteNotification(int index) {
    if (_notifications[index]['isRead'] == false) {
      _unreadCount--;
    }
    _notifications.removeAt(index);
    notifyListeners();
  }

  /// مسح جميع الإشعارات
  void clearAll() {
    _notifications.clear();
    _unreadCount = 0;
    notifyListeners();
  }
}
