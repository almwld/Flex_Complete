import 'dart:convert';
import 'package:http/http.dart' as http;

/// خدمة المساعد الذكي - AI Assistant Service
class AIAssistantService {
  static const String _apiKey = 'sk-api-3srQHm600IiTt7ibuFkqWMB62Y2EQHpjwRLyisrT6jZTReILYdyalX-KZnPD_nftvrmNthCmNx3gBnpZdB_0j_YqV4rg0zINGWotoyhHx9sy8vMN9Y-PHJo';
  static const String _apiUrl = 'https://api.openai.com/v1/chat/completions';

  final List<AIMessage> _conversationHistory = [];

  /// إضافة رسالة للمستخدم
  void addUserMessage(String message) {
    _conversationHistory.add(AIMessage(
      role: 'user',
      content: message,
      timestamp: DateTime.now(),
    ));
  }

  /// إضافة رد المساعد
  void addAssistantMessage(String message) {
    _conversationHistory.add(AIMessage(
      role: 'assistant',
      content: message,
      timestamp: DateTime.now(),
    ));
  }

  /// الحصول على سجل المحادثة
  List<AIMessage> get conversationHistory => List.unmodifiable(_conversationHistory);

  /// مسح سجل المحادثة
  void clearHistory() {
    _conversationHistory.clear();
  }

  /// إرسال رسالة والحصول على رد
  Future<AIResponse> sendMessage(String message) async {
    try {
      addUserMessage(message);

      final response = await http.post(
        Uri.parse(_apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_apiKey',
        },
        body: jsonEncode({
          'model': 'gpt-3.5-turbo',
          'messages': [
            {
              'role': 'system',
              'content': '''أنت مساعد ذكي لتطبيق Flex Yemen، تطبيق تجارة إلكترونية ومحفظة رقمية في اليمن.
                - ساعد المستخدمين في البحث عن المنتجات والخدمات
                - قدم توصيات مخصصة بناءً على تفضيلاتهم
                - أجب على أسئلة حول المحفظة الرقمية والدفع
                - ساعد في تتبع الطلبات وحل المشكلات
                - استخدم اللغة العربية الفصحى
                - كن ودوداً ومهنياً''',
            },
            ..._conversationHistory.map((msg) => {
              'role': msg.role,
              'content': msg.content,
            }),
          ],
          'max_tokens': 1000,
          'temperature': 0.7,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        final assistantMessage = data['choices'][0]['message']['content'] as String;
        addAssistantMessage(assistantMessage);

        return AIResponse(
          success: true,
          message: assistantMessage,
          timestamp: DateTime.now(),
        );
      } else {
        final errorData = jsonDecode(response.body);
        return AIResponse(
          success: false,
          message: 'عذراً، حدث خطأ. يرجى المحاولة مرة أخرى.',
          error: errorData['error']?['message'] ?? 'Unknown error',
          timestamp: DateTime.now(),
        );
      }
    } catch (e) {
      return AIResponse(
        success: false,
        message: 'عذراً، لا يمكن الاتصال بالخادم. يرجى التحقق من اتصال الإنترنت.',
        error: e.toString(),
        timestamp: DateTime.now(),
      );
    }
  }

  /// البحث عن منتجات
  Future<String> searchProducts(String query) async {
    final prompt = '''ابحث عن: $query
    قدم قائمة بالمنتجات المتاحة مع الأسعار التقريبية بالريال اليمني.
    تنسيق الإجابة:
    - اسم المنتج: السعر''';

    final response = await sendMessage(prompt);
    return response.message;
  }

  /// الحصول على توصيات
  Future<String> getRecommendations(String userPreferences) async {
    final prompt = '''بناءً على تفضيلات المستخدم:
    $userPreferences

    قدم توصيات مخصصة للمنتجات أو العروض المناسبة.
    ''';

    final response = await sendMessage(prompt);
    return response.message;
  }

  /// المساعدة في المحفظة
  Future<String> walletHelp(String question) async {
    final prompt = '''سؤال عن المحفظة الرقمية:
    $question

    قدم إجابة مفيدة عن:
    - كيفية الإيداع والسحب
    - تحويل الأموال
    - دفع الفواتير
    - معلومات الرصيد''';

    final response = await sendMessage(prompt);
    return response.message;
  }
}

/// نموذج رسالة المساعد الذكي
class AIMessage {
  final String role;
  final String content;
  final DateTime timestamp;

  AIMessage({
    required this.role,
    required this.content,
    required this.timestamp,
  });
}

/// نموذج استجابة المساعد الذكي
class AIResponse {
  final bool success;
  final String message;
  final String? error;
  final DateTime timestamp;

  AIResponse({
    required this.success,
    required this.message,
    this.error,
    required this.timestamp,
  });
}
