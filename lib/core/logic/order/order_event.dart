// BLOC STATE MANAGEMENT (MVVM Pattern)
import 'package:equatable/equatable.dart';

import '../../models/order/order.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class LoadOrders extends OrderEvent {}

class AddOrder extends OrderEvent {
  const AddOrder(this.order);
  final Order order;

  @override
  List<Object> get props => [order];
}

class CompleteOrder extends OrderEvent {
  const CompleteOrder(this.orderId);
  final String orderId;

  @override
  List<Object> get props => [orderId];
}

class GenerateReport extends OrderEvent {
  const GenerateReport(this.date);
  final DateTime date;

  @override
  List<Object> get props => [date];
}
