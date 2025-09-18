import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../core/config/constants/app_constants.dart';
import '../../../core/logic/order/order_bloc.dart';
import '../../../core/logic/order/order_event.dart';
import '../../../core/models/order/order.dart';
import '../../../core/widgets/button_components/elevated_button_components/elevated_button_icon_component.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({required this.order, super.key});
  final Order order;

  @override
  Widget build(BuildContext context) => Card(
    margin: const EdgeInsets.only(bottom: 12),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppConstants.outBorderRadius),
    ),
    child: Padding(
      padding: const EdgeInsets.all(AppConstants.paddingHalf),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Customer Name: ${order.customerName}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                DateFormat('jm').format(order.orderTime),
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  order.drink.name,
                  style: const TextStyle(fontWeight: FontWeight.w500).copyWith(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${order.drink.price} LE',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green[700],
                ),
              ),
            ],
          ),
          if (order.specialInstructions.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              'Instructions: ${order.specialInstructions}',
              style: TextStyle(
                color: Colors.grey[700],
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButtonIconComponent(
              icon: Icons.check_circle_outline_rounded,
              onPressed: () {
                context.read<OrderBloc>().add(CompleteOrder(order.id));
              },
              label: 'Mark as Completed',
              useInBorderRadius: true,
            ),
          ),
        ],
      ),
    ),
  );
}
