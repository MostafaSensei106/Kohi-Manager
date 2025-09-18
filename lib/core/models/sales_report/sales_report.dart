import 'package:equatable/equatable.dart';

class SalesReport extends Equatable {
  const SalesReport({
    required this.drinkCounts,
    required this.totalOrders,
    required this.totalRevenue,
    required this.date,
  });
  final Map<String, int> drinkCounts;
  final int totalOrders;
  final double totalRevenue;
  final DateTime date;

  @override
  List<Object> get props => [drinkCounts, totalOrders, totalRevenue, date];
}
