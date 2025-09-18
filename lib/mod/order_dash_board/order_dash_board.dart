import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/config/constants/app_constants.dart';
import '../../core/logic/order/order_bloc.dart';
import '../../core/models/order/order_state.dart';
import 'widgets/order_card.dart';

class OrderDashboard extends StatelessWidget {
  const OrderDashboard({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Ahwa Dashboard'), centerTitle: true),
    body: BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        final pendingOrders = state.orders
            .where((order) => !order.isCompleted)
            .toList();

        return Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(
                  AppConstants.outBorderRadius,
                ),
              ),
              child: Column(
                children: [
                  const Text(
                    'Pending Orders',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${pendingOrders.length}',
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: pendingOrders.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.coffee_outlined,
                            size: 64,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No pending orders',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: pendingOrders.length,
                      itemBuilder: (context, index) {
                        final order = pendingOrders[index];
                        return OrderCard(order: order);
                      },
                    ),
            ),
          ],
        );
      },
    ),
  );
}
