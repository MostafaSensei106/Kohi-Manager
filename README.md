<h1 align="center">Kohi Manager</h1>
<p align="center">
  <img src="https://socialify.git.ci/MostafaSensei106/Kohi-Manager/image?custom_language=Flutter&font=KoHo&language=1&logo=https%3A%2F%2Favatars.githubusercontent.com%2Fu%2F138288138%3Fv%3D4&name=1&owner=1&pattern=Floating+Cogs&theme=Light" alt="Kohi Manager Logo">
</p>

<p align="center">
  <strong>A modern, feature-rich café management mobile app built with Flutter & BLoC.</strong><br>
  Efficient. Smart. User-friendly. All in your pocket.
</p>

<p align="center">
  <a href="#about">About</a> •
  <a href="#features">Features</a> •
  <a href="#installation">Installation</a> •
  <a href="#architecture">Architecture</a> •
  <a href="#technologies">Technologies</a> •
  <a href="#contributing">Contributing</a> •
  <a href="#license">License</a>
</p>

---

## About

Welcome to **Smart Ahwa Manager** — a comprehensive café management solution built for the modern Egyptian ahwa owner.
This Flutter application streamlines daily operations with intelligent order management, real-time analytics, and intuitive design. Whether you're managing a bustling downtown café or a cozy neighborhood ahwa, Smart Ahwa Manager handles it all with elegance and efficiency.

Perfect for Cairo's vibrant café culture, supporting traditional drinks like shai, Turkish coffee, and hibiscus tea with Egyptian charm and hospitality.

---

## Features

### 🌟 Core Functionality
- **Order Management**: Add, track, and complete customer orders seamlessly
- **Multi-drink Support**: Shai, Turkish coffee, hibiscus tea, and more
- **Real-time Dashboard**: Live view of pending orders with timestamps
- **Smart Instructions**: Custom order notes like "extra mint, ya rais!"
- **One-tap Completion**: Mark orders as done with single button press

### 📊 Advanced Analytics
- **Daily Sales Reports**: Comprehensive revenue and order statistics
- **Top-selling Drinks**: Visual insights into customer preferences
- **Revenue Tracking**: Real-time financial summaries
- **Performance Metrics**: Order completion rates and trends
- **Export Capabilities**: Generate reports for business analysis

### 🎨 Modern UI/UX
- **Material Design 3**: Clean, intuitive interface with Egyptian aesthetics
- **Dark/Light Themes**: Comfortable viewing in any lighting condition
- **Responsive Design**: Optimized for phones and tablets
- **Smooth Animations**: Delightful micro-interactions throughout
- **Accessibility**: Screen reader support and high contrast modes

### 🔧 Technical Excellence
- **SOLID Principles**: Maintainable, extensible codebase
- **MVVM Architecture**: Clean separation of concerns
- **BLoC State Management**: Reactive, predictable state handling
- **Object-Oriented Design**: Inheritance, polymorphism, and encapsulation
- **Type Safety**: Comprehensive null safety implementation

---

## Installation

## 📦 Quick Setup

> [!IMPORTANT]
> Flutter SDK version 3.10+ is required.
> Android Studio or VS Code with Flutter extensions recommended.

### 🛠️ Prerequisites

Before you begin, ensure you have:
- [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.10+)
- [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/)
- Git installed on your system

### 📱 For Android Development
```bash
# Clone the repository
git clone https://github.com/MostafaSensei106/Kohi-Manager.git

cd Kohi-Manager

# Install dependencies
flutter pub get

# Run on connected device or emulator
flutter run
```

---

## 🚀 Quick Start

### 📋 Adding Your First Order
1. Open the app and navigate to "Add Order"
2. Enter customer name (e.g., "Ahmed")
3. Select drink type (Shai, Turkish Coffee, etc.)
4. Add special instructions if needed
5. Tap "Add Order" to submit

### 📊 Viewing Dashboard
1. Navigate to "Dashboard" tab
2. See all pending orders in real-time
3. Tap "Mark as Completed" when order is ready
4. Watch your efficiency metrics update

### 📈 Generating Reports
1. Go to "Reports" tab
2. View today's sales summary automatically
3. Check top-selling drinks and revenue
4. Use insights to optimize your menu

---

## Architecture

Smart Ahwa Manager follows clean architecture principles with clear separation of concerns:

### 🏗️ MVVM + BLoC Pattern
```
┌─ Presentation Layer ─┐
│  ├─ Views (Screens)  │
│  └─ ViewModels (BLoC)│
├─ Business Layer ─────┤
│  ├─ Models          │
│  └─ Services        │
└─ Data Layer ─────────┘
   ├─ Repositories
   └─ Data Sources
```

### 🎯 SOLID Principles Implementation

| Principle | Implementation | Example |
|-----------|----------------|---------|
| **Single Responsibility** | Each class has one clear purpose | `OrderService` only handles data operations |
| **Open/Closed** | Easy to extend without modification | Add new drink types by extending `Drink` class |
| **Dependency Inversion** | Depend on abstractions, not concretions | `OrderBloc` uses `OrderRepository` interface |

### 🧩 Key Components

- **Models**: `Order`, `Drink` hierarchy with inheritance
- **Services**: `OrderService` implementing repository pattern
- **BLoC**: `OrderBloc` for reactive state management
- **Views**: Responsive UI components with modern design

---

## 📋 Usage Examples

### 🏪 Basic Café Operations
```dart
// Adding a traditional shai order
final order = Order(
  customerName: "Om Ahmed",
  drink: Shai(),
  specialInstructions: "extra sugar, ya rais",
  orderTime: DateTime.now(),
);
```

### 📊 Advanced Analytics
```dart
// Generate daily sales report
final report = orderService.generateDailyReport(DateTime.now());
print('Total Revenue: ${report.totalRevenue} LE');
print('Top Drink: ${report.topSellingDrink}');
```

### 🎨 Custom Drink Types
```dart
// Extend the app with new beverages
class MintTea extends Drink {
  const MintTea() : super(name: 'Mint Tea', price: 2.5);

  @override
  String getDescription() => 'Fresh mint leaves tea';
}
```

---

## Technologies

| Technology | Description | Purpose |
|------------|-------------|---------|
| 🎯 **Flutter** | [flutter.dev](https://flutter.dev) | Cross-platform UI framework |
| 🏗️ **BLoC Pattern** | [bloc.dev](https://bloc.dev) | Predictable state management |
| 📱 **Dart** | [dart.dev](https://dart.dev) | Programming language |
| 🎨 **Material Design 3** | [m3.material.io](https://m3.material.io) | Modern UI components |
| 🔧 **Equatable** | [pub.dev/packages/equatable](https://pub.dev/packages/equatable) | Value equality comparisons |
| 📅 **Intl** | [pub.dev/packages/intl](https://pub.dev/packages/intl) | Internationalization support |

---

## Development

### 🧪 Running Tests
```bash
# Run unit tests
flutter test

# Run integration tests
flutter test integration_test/

# Generate coverage report
flutter test --coverage
```

### 🔧 Code Quality
```bash
# Format code
flutter format .

# Analyze code
flutter analyze

# Check for outdated dependencies
flutter pub outdated
```

### 📱 Building for Production
```bash
# Build Android APK
flutter build apk --release
```

---

## Contributing

Contributions are welcome! Here's how to get started:

1. **Fork** the repository
2. **Create** a feature branch:
   ```bash
   git checkout -b feature/amazing-feature
   ```
3. **Commit** your changes:
   ```bash
   git commit -m "Add amazing feature"
   ```
4. **Push** to your branch:
   ```bash
   git push origin feature/amazing-feature
   ```
5. **Open** a pull request

### 📝 Contribution Guidelines
- Follow Flutter's official style guide
- Write tests for new features
- Update documentation as needed
- Ensure all tests pass before submitting
- Use conventional commit messages

> 💡 Please open an issue first for major feature ideas or architectural changes.

---
## License

This project is licensed under the **MIT License**.
See the [LICENSE](LICENSE) file for full details.

---

<p align="center">
  Made with ❤️
  by <a href="https://github.com/MostafaSensei106">Mostafa Sensei106</a>
</p>
