import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/order/order_state.dart';
import '../../services/order_repo/order_repo.dart';
import 'order_event.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc(this._orderRepository) : super(const OrderState()) {
    on<LoadOrders>(_onLoadOrders);
    on<AddOrder>(_onAddOrder);
    on<CompleteOrder>(_onCompleteOrder);
    on<GenerateReport>(_onGenerateReport);
  }
  final OrderRepository _orderRepository;

  void _onLoadOrders(LoadOrders event, Emitter<OrderState> emit) {
    final orders = _orderRepository.getOrders();
    emit(state.copyWith(orders: orders));
  }

  void _onAddOrder(AddOrder event, Emitter<OrderState> emit) {
    _orderRepository.addOrder(event.order);
    final orders = _orderRepository.getOrders();
    emit(state.copyWith(orders: orders));
  }

  void _onCompleteOrder(CompleteOrder event, Emitter<OrderState> emit) {
    final order = state.orders.firstWhere((o) => o.id == event.orderId);
    final completedOrder = order.copyWith(isCompleted: true);
    _orderRepository.updateOrder(completedOrder);
    final orders = _orderRepository.getOrders();
    emit(state.copyWith(orders: orders));
  }

  void _onGenerateReport(GenerateReport event, Emitter<OrderState> emit) {
    emit(state.copyWith(isLoading: true));
    final report = _orderRepository.generateDailyReport(event.date);
    emit(state.copyWith(report: report, isLoading: false));
  }
}
