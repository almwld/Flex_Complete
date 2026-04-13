# Flex Yemen (فلكس يمن) - Flutter E-Commerce & Digital Wallet Application

<div align="center">
  <h1>فلكس يمن</h1>
  <p>A comprehensive Flutter e-commerce and digital wallet application for the Yemeni market</p>
</div>

## 📱 Overview

**Flex Yemen** is a feature-rich mobile application that combines e-commerce functionality with a complete digital wallet system. Built with Flutter and designed specifically for the Yemeni market with full Arabic RTL support.

## ✨ Features

### 🛒 E-Commerce
- **10+ Market Categories**: Restaurants, cafes, supermarkets, pharmacies, malls, electronics, fashion, cosmetics, sports, books, toys, furniture
- **25+ Product Categories**: Organized and searchable product listings
- **Product Search & Filtering**: Advanced search with multiple filters
- **Favorites System**: Save and manage favorite products
- **Order Tracking**: Real-time order status updates

### 💰 Digital Wallet (PRO Mode)
- **Multi-Currency Support**: YER (Yemeni Rial) and USD
- **Transaction Types**:
  - Deposits & Withdrawals
  - Internal Transfers (فلكس باي)
  - Cash Transfers (كاش)
  - Mobile Recharge (يمن موبايل, سبأفون, YOU)
  - Bill Payments (electricity, water, internet)
  - Bank Transfers
- **Balance Management**: Current balance, pending balance, available balance
- **Transaction History**: Complete transaction records with filtering

### 👑 View Modes (3 Levels)
1. **Lite Mode**: Basic e-commerce browsing
2. **PRO Mode**: Full wallet access + e-commerce
3. **Expert Mode**: Complete business tools for sellers

## 🛠 Tech Stack

- **Framework**: Flutter 3.x
- **State Management**: Provider
- **Backend**: Supabase (ready for integration)
- **Local Storage**: Hive + SharedPreferences
- **Authentication**: Email/Password + Biometric (Face/Touch ID)
- **UI**: Custom gold-themed design system

## 📂 Project Structure

```
lib/
├── core/
│   ├── constants/     # App colors, strings, constants
│   ├── theme/           # Light/Dark themes
│   └── utils/           # Validators, formatters
├── models/              # Data models (25+ files)
├── services/            # API, storage, auth services
├── providers/           # State management
├── screens/             # All app screens (50+ files)
│   ├── auth/           # Login, Register
│   ├── home/           # Main navigation, Home
│   ├── wallet/         # E-wallet screens
│   ├── pro/            # PRO mode screens
│   └── ...
├── widgets/             # Reusable widgets (30+ files)
│   ├── common/        # Shared widgets
│   ├── wallet/        # Wallet-specific widgets
│   ├── pro/           # PRO mode widgets
│   └── dialogs/       # Dialog components
└── main.dart           # App entry point
```

## 🎨 Design System

### Colors
- **Primary Gold**: #D4AF37
- **Gold Light**: #F4D03F
- **Gold Dark**: #B8860B
- **Success**: #4CAF50
- **Error**: #E53935
- **Dark Mode**: #121212 / #1E1E1E

### Typography
- **Primary Font**: Changa (Arabic-optimized)
- **Fallback**: System fonts

## 📦 Getting Started

### Prerequisites
- Flutter SDK 3.0+
- Android Studio / VS Code with Flutter extensions
- Supabase account (optional for backend)

### Installation

```bash
# Clone the repository
git clone <repository-url>
cd flex_yemen

# Install dependencies
flutter pub get

# Create assets directories
mkdir -p assets/images assets/icons/svg assets/icons/png assets/fonts

# Run the app
flutter run
```

### Assets Setup
Place your custom fonts in `assets/fonts/`:
- Changa-Regular.ttf
- Changa-SemiBold.ttf
- Changa-Bold.ttf

## 🔐 Security Features

- Biometric authentication (Face ID / Touch ID)
- Secure local storage with Hive encryption
- PIN code protection option
- Session management

## 🌐 RTL Support

Full right-to-left layout support for Arabic language:
- Proper text alignment
- Mirrored UI elements
- Arabic numerals support
- Localized date/time formatting

## 📱 Screens Included

### Authentication
- Splash Screen
- Login Screen
- Registration Screen

### Main App
- Home Screen (with carousel, markets, categories, trending products)
- Main Navigation
- Search Screen
- Categories Grid

### Wallet (7+ screens)
- Wallet Home
- Deposit
- Withdraw
- Transfer (with 6+ service types)
- Recharge (mobile operators)
- Bill Payment
- Transaction History

### PRO Mode (3+ screens)
- PRO Dashboard
- PRO Markets Management
- PRO Products Management

### Supporting
- Profile
- Settings
- Notifications
- Favorites
- Order Details
- Product Listing
- Market Details

## 📊 Statistics

| Category | Count |
|----------|-------|
| Dart Files | 86+ |
| Models | 14+ |
| Services | 7+ |
| Providers | 4+ |
| Screens | 20+ |
| Widgets | 20+ |

## 🔄 API Integration Ready

The app is configured for Supabase backend with:
- API Client setup
- Endpoint definitions
- Authentication service
- Error handling
- Mock data for development

## 📄 License

This project is proprietary. All rights reserved.

## 👨‍💻 Developer

Developed with ❤️ for the Yemeni market

---

**Version**: 1.0.0
**Last Updated**: 2024
