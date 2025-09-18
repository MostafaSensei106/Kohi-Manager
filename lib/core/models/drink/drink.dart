import 'package:equatable/equatable.dart';

abstract class Drink extends Equatable {
  const Drink({required this.name, required this.price});
  final String name;
  final double price;

  // abstract method for polymorphism
  String getDescription();

  @override
  List<Object> get props => [name, price];
}
