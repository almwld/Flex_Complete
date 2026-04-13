import 'package:flutter/foundation.dart';
import '../services/ai_assistant_service.dart';

/// مزود حالة المساعد الذكي
class AIAssistantProvider extends ChangeNotifier {
  final AIAssistantService _service = AIAssistantService();

  List<AIMessage> get messages => _service.conversationHistory;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _lastError;

  String? get lastError => _lastError;

  /// إرسال رسالة
  Future<String?> sendMessage(String message) async {
    _isLoading = true;
    _lastError = null;
    notifyListeners();

    final response = await _service.sendMessage(message);

    _isLoading = false;
    if (!response.success) {
      _lastError = response.error;
    }
    notifyListeners();

    return response.success ? response.message : null;
  }

  /// البحث عن منتجات
  Future<String?> searchProducts(String query) async {
    _isLoading = true;
    notifyListeners();

    final result = await _service.searchProducts(query);

    _isLoading = false;
    notifyListeners();

    return result;
  }

  /// الحصول على توصيات
  Future<String?> getRecommendations(String preferences) async {
    _isLoading = true;
    notifyListeners();

    final result = await _service.getRecommendations(preferences);

    _isLoading = false;
    notifyListeners();

    return result;
  }

  /// المساعدة في المحفظة
  Future<String?> walletHelp(String question) async {
    _isLoading = true;
    notifyListeners();

    final result = await _service.walletHelp(question);

    _isLoading = false;
    notifyListeners();

    return result;
  }

  /// مسح المحادثة
  void clearHistory() {
    _service.clearHistory();
    _lastError = null;
    notifyListeners();
  }
}
