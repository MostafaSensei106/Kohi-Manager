import 'package:equatable/equatable.dart';

import '../drink/drink.dart';

class Order extends Equatable {
  const Order({
    required this.id,
    required this.customerName,
    required this.drink,
    required this.orderTime,
    this.specialInstructions = '',
    this.isCompleted = false,
  });
  final String id;
  final String customerName;
  final Drink drink;
  final String specialInstructions;
  final DateTime orderTime;
  final bool isCompleted;

  Order copyWith({
    String? id,
    String? customerName,
    Drink? drink,
    String? specialInstructions,
    DateTime? orderTime,
    bool? isCompleted,
  }) => Order(
    id: id ?? this.id,
    customerName: customerName ?? this.customerName,
    drink: drink ?? this.drink,
    specialInstructions: specialInstructions ?? this.specialInstructions,
    orderTime: orderTime ?? this.orderTime,
    isCompleted: isCompleted ?? this.isCompleted,
  );

  @override
  List<Object> get props => [
    id,
    customerName,
    drink,
    specialInstructions,
    orderTime,
    isCompleted,
  ];
}
