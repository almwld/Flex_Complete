import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConnectionChecker extends ChangeNotifier {
  bool _isOnline = true;
  bool get isOnline => _isOnline;

  ConnectionChecker() {
    _init();
  }

  void _init() {
    // محاكاة الاتصال
    _isOnline = true;
    notifyListeners();
  }

  void setOnline(bool online) {
    _isOnline = online;
    notifyListeners();
  }
}

class OfflineBanner extends StatelessWidget {
  const OfflineBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ConnectionChecker>(
      builder: (context, checker, child) {
        if (checker.isOnline) {
          return const SizedBox.shrink();
        }
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          color: Colors.red,
          child: const Text(
            'لا يوجد اتصال بالإنترنت',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }
}
