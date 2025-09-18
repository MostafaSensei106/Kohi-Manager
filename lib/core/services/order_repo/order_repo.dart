// SERVICE LAYER (Single Responsibility Principle & Dependency Inversion)
import 'package:intl/intl.dart';

import '../../models/order/order.dart';
import '../../models/sales_report/sales_report.dart';

abstract class OrderRepository {
  List<Order> getOrders();
  void addOrder(Order order);
  void updateOrder(Order order);
  SalesReport generateDailyReport(DateTime date);
}

class OrderService implements OrderRepository {
  final List<Order> _orders = [];

  @override
  List<Order> getOrders() => List.unmodifiable(_orders);

  @override
  void addOrder(Order order) {
    _orders.add(order);
  }

  @override
  void updateOrder(Order order) {
    final index = _orders.indexWhere((o) => o.id == order.id);
    if (index != -1) {
      _orders[index] = order;
    }
  }

  @override
  SalesReport generateDailyReport(DateTime date) {
    final todayOrders = _orders
        .where(
          (order) =>
              DateFormat('yyyy-MM-dd').format(order.orderTime) ==
              DateFormat('yyyy-MM-dd').format(date),
        )
        .toList();

    final drinkCounts = <String, int>{};
    double totalRevenue = 0;

    for (final order in todayOrders) {
      drinkCounts[order.drink.name] = (drinkCounts[order.drink.name] ?? 0) + 1;
      totalRevenue += order.drink.price;
    }

    return SalesReport(
      drinkCounts: drinkCounts,
      totalOrders: todayOrders.length,
      totalRevenue: totalRevenue,
      date: date,
    );
  }
}
