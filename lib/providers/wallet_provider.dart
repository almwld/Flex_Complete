import 'package:flutter/material.dart';
import '../../models/wallet/wallet_model.dart';
import '../../models/wallet/wallet_transaction.dart';
import '../../services/wallet/wallet_service.dart';

class WalletProvider extends ChangeNotifier {
  final WalletService _walletService = WalletService();

  WalletModel? _wallet;
  List<WalletTransaction> _transactions = [];
  bool _isLoading = false;
  String? _error;

  WalletModel? get wallet => _wallet;
  List<WalletTransaction> get transactions => _transactions;
  bool get isLoading => _isLoading;
  String? get error => _error;

  double get balanceYER => _wallet?.balanceYER ?? 0;
  double get balanceUSD => _wallet?.balanceUSD ?? 0;
  double get pendingBalance => _wallet?.pendingBalance ?? 0;

  WalletProvider() {
    loadWallet();
  }

  Future<void> loadWallet() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _wallet = await _walletService.getWallet();
      _transactions = await _walletService.getTransactions();
    } catch (e) {
      _error = 'فشل في تحميل المحفظة';
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<bool> deposit({
    required double amount,
    required String method,
    Map<String, dynamic>? paymentData,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      final transaction = await _walletService.deposit(
        amount: amount,
        method: method,
        paymentData: paymentData,
      );

      if (transaction != null) {
        _transactions.insert(0, transaction);
        _wallet = _wallet!.copyWith(
          balanceYER: _wallet!.balanceYER + amount,
          lastTransactionAt: DateTime.now(),
        );
        _isLoading = false;
        notifyListeners();
        return true;
      }
    } catch (e) {
      _error = 'فشل في الإيداع';
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  Future<bool> withdraw({
    required double amount,
    required String method,
    Map<String, dynamic>? withdrawalData,
  }) async {
    if (amount > balanceYER) {
      _error = 'الرصيد غير كافٍ';
      notifyListeners();
      return false;
    }

    _isLoading = true;
    notifyListeners();

    try {
      final transaction = await _walletService.withdraw(
        amount: amount,
        method: method,
        withdrawalData: withdrawalData,
      );

      if (transaction != null) {
        _transactions.insert(0, transaction);
        _wallet = _wallet!.copyWith(
          balanceYER: _wallet!.balanceYER - amount,
          lastTransactionAt: DateTime.now(),
        );
        _isLoading = false;
        notifyListeners();
        return true;
      }
    } catch (e) {
      _error = 'فشل في السحب';
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  Future<bool> transfer({
    required double amount,
    required String recipientId,
    required String recipientType,
    String? note,
  }) async {
    if (amount > balanceYER) {
      _error = 'الرصيد غير كافٍ';
      notifyListeners();
      return false;
    }

    _isLoading = true;
    notifyListeners();

    try {
      final transaction = await _walletService.transfer(
        amount: amount,
        recipientId: recipientId,
        recipientType: recipientType,
        note: note,
      );

      if (transaction != null) {
        _transactions.insert(0, transaction);
        _wallet = _wallet!.copyWith(
          balanceYER: _wallet!.balanceYER - amount,
          lastTransactionAt: DateTime.now(),
        );
        _isLoading = false;
        notifyListeners();
        return true;
      }
    } catch (e) {
      _error = 'فشل في التحويل';
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  Future<void> loadTransactions({
    String? type,
    String? status,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      _transactions = await _walletService.getTransactions(
        type: type,
        status: status,
      );
    } catch (e) {
      _error = 'فشل في تحميل المعاملات';
    }

    _isLoading = false;
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
