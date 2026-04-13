class ApiEndpoints {
  // Auth
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String logout = '/auth/logout';
  static const String refreshToken = '/auth/refresh';
  static const String forgotPassword = '/auth/forgot-password';
  static const String resetPassword = '/auth/reset-password';
  static const String verifyOtp = '/auth/verify-otp';
  static const String resendOtp = '/auth/resend-otp';

  // User
  static const String userProfile = '/users/profile';
  static const String updateProfile = '/users/profile';
  static const String userAddresses = '/users/addresses';
  static const String userSettings = '/users/settings';

  // Wallet
  static const String wallet = '/wallet';
  static const String walletBalance = '/wallet/balance';
  static const String walletTransactions = '/wallet/transactions';
  static const String walletDeposit = '/wallet/deposit';
  static const String walletWithdraw = '/wallet/withdraw';
  static const String walletTransfer = '/wallet/transfer';
  static const String walletCards = '/wallet/cards';
  static const String walletBanks = '/wallet/banks';

  // Products
  static const String products = '/products';
  static const String featuredProducts = '/products/featured';
  static const String productCategories = '/products/categories';
  static const String productReviews = '/products/reviews';
  static const String searchProducts = '/products/search';

  // Markets
  static const String markets = '/markets';
  static const String marketTypes = '/markets/types';
  static const String marketVendors = '/markets/vendors';

  // Orders
  static const String orders = '/orders';
  static const String orderDetail = '/orders';
  static const String orderTrack = '/orders/track';
  static const String orderCancel = '/orders/cancel';
  static const String orderConfirm = '/orders/confirm';

  // Cart
  static const String cart = '/cart';
  static const String cartItems = '/cart/items';

  // Blog
  static const String blogPosts = '/blog/posts';
  static const String blogCategories = '/blog/categories';
  static const String blogFeatured = '/blog/featured';

  // Academy
  static const String courses = '/academy/courses';
  static const String courseDetail = '/academy/courses';
  static const String myCourses = '/academy/my-courses';
  static const String courseProgress = '/academy/progress';

  // Notifications
  static const String notifications = '/notifications';
  static const String notificationSettings = '/notifications/settings';

  // Support
  static const String supportTickets = '/support/tickets';
  static const String supportCategories = '/support/categories';

  // Bills
  static const String bills = '/bills';
  static const String billTypes = '/bills/types';
  static const String billPay = '/bills/pay';
  static const String billInquire = '/bills/inquire';
}
