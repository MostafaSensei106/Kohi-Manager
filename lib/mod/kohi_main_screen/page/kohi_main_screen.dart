import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/logic/order/order_bloc.dart';
import '../../../core/logic/order/order_event.dart';
import '../../add_order_screen/add_order_screen.dart';
import '../../order_dash_board/order_dash_board.dart';
import '../../report_screen/report_screen.dart';

class KohiMainScreen extends StatefulWidget {
  const KohiMainScreen({super.key});

  @override
  State<KohiMainScreen> createState() => _KohiMainScreenState();
}

class _KohiMainScreenState extends State<KohiMainScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<OrderBloc>().add(LoadOrders());
  }

  final List<Widget> _screens = [
    const OrderDashboard(),
    const AddOrderScreen(),
    const ReportsScreen(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    body: IndexedStack(index: _selectedIndex, children: _screens),
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (index) => setState(() => _selectedIndex = index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.space_dashboard_outlined),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline_rounded),
          label: 'Add Order',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.analytics_outlined),
          label: 'Reports',
        ),
      ],
    ),
  );
}
