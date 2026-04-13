import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../services/storage/local_storage_service.dart';

enum ViewMode {
  lite,
  pro,
  expert,
}

class ViewModeProvider extends ChangeNotifier {
  ViewMode _currentMode = ViewMode.lite;

  ViewMode get currentMode => _currentMode;
  String get currentModeString => _currentMode.name;

  ViewModeProvider() {
    _loadViewMode();
  }

  void _loadViewMode() {
    final savedMode = LocalStorageService.getViewMode();
    switch (savedMode) {
      case 'pro':
        _currentMode = ViewMode.pro;
        break;
      case 'expert':
        _currentMode = ViewMode.expert;
        break;
      default:
        _currentMode = ViewMode.lite;
    }
    notifyListeners();
  }

  Future<void> setViewMode(ViewMode mode) async {
    if (_currentMode != mode) {
      _currentMode = mode;
      await LocalStorageService.setViewMode(mode.name);
      notifyListeners();
    }
  }

  Future<void> upgradeToPro() async {
    await setViewMode(ViewMode.pro);
  }

  Future<void> upgradeToExpert() async {
    await setViewMode(ViewMode.expert);
  }

  bool get isLite => _currentMode == ViewMode.lite;
  bool get isPro => _currentMode == ViewMode.pro || _currentMode == ViewMode.expert;
  bool get isExpert => _currentMode == ViewMode.expert;

  String get modeTitle {
    switch (_currentMode) {
      case ViewMode.lite:
        return 'Lite';
      case ViewMode.pro:
        return 'PRO';
      case ViewMode.expert:
        return 'Expert';
    }
  }

  int get marketCount {
    switch (_currentMode) {
      case ViewMode.lite:
        return 3;
      case ViewMode.pro:
        return 10;
      case ViewMode.expert:
        return 10;
    }
  }

  int get categoryCount {
    switch (_currentMode) {
      case ViewMode.lite:
        return 5;
      case ViewMode.pro:
        return 25;
      case ViewMode.expert:
        return 25;
    }
  }

  int get trendingProductCount {
    switch (_currentMode) {
      case ViewMode.lite:
        return 10;
      case ViewMode.pro:
        return 30;
      case ViewMode.expert:
        return 30;
    }
  }

  int get adCount {
    switch (_currentMode) {
      case ViewMode.lite:
        return 3;
      case ViewMode.pro:
        return 10;
      case ViewMode.expert:
        return 10;
    }
  }

  int get newsCount {
    switch (_currentMode) {
      case ViewMode.lite:
        return 5;
      case ViewMode.pro:
        return 12;
      case ViewMode.expert:
        return 12;
    }
  }

  int get courseCount {
    switch (_currentMode) {
      case ViewMode.lite:
        return 3;
      case ViewMode.pro:
        return 12;
      case ViewMode.expert:
        return 12;
    }
  }
}
