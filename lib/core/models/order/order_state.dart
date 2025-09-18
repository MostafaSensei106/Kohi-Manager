import 'package:equatable/equatable.dart';

import '../sales_report/sales_report.dart';
import 'order.dart';

class OrderState extends Equatable {
  const OrderState({
    this.orders = const [],
    this.report,
    this.isLoading = false,
  });
  final List<Order> orders;
  final SalesReport? report;
  final bool isLoading;

  OrderState copyWith({
    List<Order>? orders,
    SalesReport? report,
    bool? isLoading,
  }) => OrderState(
    orders: orders ?? this.orders,
    report: report ?? this.report,
    isLoading: isLoading ?? this.isLoading,
  );

  @override
  List<Object?> get props => [orders, report, isLoading];
}
