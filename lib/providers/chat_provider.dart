import 'package:flutter/material.dart';

/// مزود الدردشة
class ChatProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _messages = [];
  bool _isLoading = false;

  List<Map<String, dynamic>> get messages => _messages;
  bool get isLoading => _isLoading;

  /// إضافة رسالة
  void addMessage(Map<String, dynamic> message) {
    _messages.add(message);
    notifyListeners();
  }

  /// إضافة رسالة من المستخدم
  void addUserMessage(String message) {
    _messages.add({
      'message': message,
      'isBot': false,
      'time': DateTime.now(),
    });
    notifyListeners();
  }

  /// إضافة رسالة من البوت
  void addBotMessage(String message) {
    _messages.add({
      'message': message,
      'isBot': true,
      'time': DateTime.now(),
    });
    notifyListeners();
  }

  /// مسح الرسائل
  void clearMessages() {
    _messages.clear();
    notifyListeners();
  }

  /// محاكاة الرد
  Future<void> simulateBotResponse(String userMessage) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    String response;
    if (userMessage.contains('مرحبا') || userMessage.contains('السلام')) {
      response = 'مرحباً بك! كيف يمكنني مساعدتك اليوم؟';
    } else if (userMessage.contains('طلب')) {
      response = 'يمكنك متابعة طلبك من خلال صفحة الطلبات في حسابك.';
    } else if (userMessage.contains('دفع') || userMessage.contains('شحن')) {
      response = 'نوفر عدة طرق للدفع: الدفع نقداً عند الاستلام، أو عبر المحفظة الإلكترونية.';
    } else {
      response = 'شكراً لتواصلك! سأقوم بتحويلك للرد على استفسارك.';
    }

    addBotMessage(response);
    _isLoading = false;
    notifyListeners();
  }
}
