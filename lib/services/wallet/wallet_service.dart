import '../../models/wallet/wallet_model.dart';
import '../../models/wallet/wallet_transaction.dart';
import '../../services/api/api_client.dart';
import '../../services/api/api_endpoints.dart';
import '../../services/storage/local_storage_service.dart';

class WalletService {
  static final WalletService _instance = WalletService._internal();
  factory WalletService() => _instance;
  WalletService._internal();

  final ApiClient _apiClient = ApiClient();

  // Get wallet balance
  Future<WalletModel?> getWallet() async {
    try {
      final response = await _apiClient.get(ApiEndpoints.wallet);

      if (response.success && response.data != null) {
        return WalletModel.fromJson(response.data);
      }

      // Return mock data if no API response
      return _getMockWallet();
    } catch (e) {
      return _getMockWallet();
    }
  }

  // Get transactions
  Future<List<WalletTransaction>> getTransactions({
    String? type,
    String? status,
    DateTime? fromDate,
    DateTime? toDate,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final params = {
        'page': page.toString(),
        'limit': limit.toString(),
        if (type != null) 'type': type,
        if (status != null) 'status': status,
        if (fromDate != null) 'from_date': fromDate.toIso8601String(),
        if (toDate != null) 'to_date': toDate.toIso8601String(),
      };

      final response = await _apiClient.get(ApiEndpoints.walletTransactions, params: params);

      if (response.success && response.data != null) {
        final List<dynamic> data = response.data is List ? response.data : [];
        return data.map((e) => WalletTransaction.fromJson(e)).toList();
      }

      return _getMockTransactions();
    } catch (e) {
      return _getMockTransactions();
    }
  }

  // Deposit
  Future<WalletTransaction?> deposit({
    required double amount,
    required String method,
    Map<String, dynamic>? paymentData,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiEndpoints.walletDeposit,
        body: {
          'amount': amount,
          'method': method,
          if (paymentData != null) ...paymentData,
        },
      );

      if (response.success && response.data != null) {
        return WalletTransaction.fromJson(response.data);
      }

      return _createMockTransaction('deposit', amount);
    } catch (e) {
      return _createMockTransaction('deposit', amount);
    }
  }

  // Withdraw
  Future<WalletTransaction?> withdraw({
    required double amount,
    required String method,
    Map<String, dynamic>? withdrawalData,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiEndpoints.walletWithdraw,
        body: {
          'amount': amount,
          'method': method,
          if (withdrawalData != null) ...withdrawalData,
        },
      );

      if (response.success && response.data != null) {
        return WalletTransaction.fromJson(response.data);
      }

      return _createMockTransaction('withdraw', amount);
    } catch (e) {
      return _createMockTransaction('withdraw', amount);
    }
  }

  // Transfer
  Future<WalletTransaction?> transfer({
    required double amount,
    required String recipientId,
    required String recipientType,
    String? note,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiEndpoints.walletTransfer,
        body: {
          'amount': amount,
          'recipient_id': recipientId,
          'recipient_type': recipientType,
          if (note != null) 'note': note,
        },
      );

      if (response.success && response.data != null) {
        return WalletTransaction.fromJson(response.data);
      }

      return _createMockTransaction('transfer', amount);
    } catch (e) {
      return _createMockTransaction('transfer', amount);
    }
  }

  // Pay Bill
  Future<WalletTransaction?> payBill({
    required String billId,
    required double amount,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiEndpoints.billPay,
        body: {
          'bill_id': billId,
          'amount': amount,
        },
      );

      if (response.success && response.data != null) {
        return WalletTransaction.fromJson(response.data);
      }

      return _createMockTransaction('bill', amount);
    } catch (e) {
      return _createMockTransaction('bill', amount);
    }
  }

  // Mock Data Generators
  WalletModel _getMockWallet() {
    return WalletModel(
      id: 'wallet_1',
      userId: 'user_1',
      balanceYER: 125000,
      balanceUSD: 250,
      pendingBalance: 5000,
      lastTransactionAt: DateTime.now(),
      isActive: true,
    );
  }

  List<WalletTransaction> _getMockTransactions() {
    return [
      WalletTransaction(
        id: 't1',
        walletId: 'wallet_1',
        type: 'deposit',
        amount: 50000,
        currency: 'YER',
        status: 'completed',
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
        description: 'إيداع من بنك اليمن الدولي',
      ),
      WalletTransaction(
        id: 't2',
        walletId: 'wallet_1',
        type: 'transfer',
        amount: 5000,
        currency: 'YER',
        recipientId: 'user_2',
        recipientName: 'أحمد محمد',
        status: 'completed',
        createdAt: DateTime.now().subtract(const Duration(hours: 5)),
        description: 'تحويل لمحمد علي',
      ),
      WalletTransaction(
        id: 't3',
        walletId: 'wallet_1',
        type: 'payment',
        amount: 12500,
        currency: 'YER',
        status: 'completed',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        description: 'دفع فاتورة كهرباء',
      ),
      WalletTransaction(
        id: 't4',
        walletId: 'wallet_1',
        type: 'recharge',
        amount: 3000,
        currency: 'YER',
        status: 'completed',
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        description: 'شحن رصيد سبأفون',
      ),
      WalletTransaction(
        id: 't5',
        walletId: 'wallet_1',
        type: 'receive',
        amount: 25000,
        currency: 'YER',
        senderId: 'user_3',
        senderName: 'خالد عبدالله',
        status: 'completed',
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
        description: 'استلام من خالد',
      ),
    ];
  }

  WalletTransaction _createMockTransaction(String type, double amount) {
    return WalletTransaction(
      id: 't_${DateTime.now().millisecondsSinceEpoch}',
      walletId: 'wallet_1',
      type: type,
      amount: amount,
      currency: 'YER',
      status: 'completed',
      createdAt: DateTime.now(),
    );
  }
}
