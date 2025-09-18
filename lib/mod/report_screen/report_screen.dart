import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/order/order_bloc.dart';
import '../../core/logic/order/order_event.dart';
import '../../core/models/order/order_state.dart';
import '../../core/widgets/button_components/icon_button_components/side_page_app_bar_icon_button.dart';
import 'widgets/drink_stats_card.dart';
import 'widgets/report_card.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Sales Reports'),
      centerTitle: true,
      actions: [
        SidePageAppBarIconButton(
          icon: Icons.refresh,
          onPressed: () {
            context.read<OrderBloc>().add(GenerateReport(DateTime.now()));
          },
          toolTip: 'Refresh',
        ),
      ],
    ),
    body: BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.report == null) {
          context.read<OrderBloc>().add(GenerateReport(DateTime.now()));
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.analytics_outlined,
                  size: 64,
                  color: Colors.grey[400],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Generating report...',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          );
        }

        final report = state.report!;

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Today\'s Summary',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ReportCard(
                      title: 'Total Orders',
                      value: '${report.totalOrders}',
                      icon: Icons.receipt_long,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ReportCard(
                      title: 'Revenue',
                      value: report.totalRevenue.toStringAsFixed(1),
                      icon: Icons.attach_money,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Top Selling Drinks',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: report.drinkCounts.isEmpty
                    ? Center(
                        child: Text(
                          'No orders today',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: report.drinkCounts.length,
                        itemBuilder: (context, index) {
                          final entry = report.drinkCounts.entries.elementAt(
                            index,
                          );
                          return DrinkStatsCard(
                            drinkName: entry.key,
                            count: entry.value,
                            total: report.totalOrders,
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
