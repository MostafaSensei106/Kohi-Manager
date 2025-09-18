import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/config/constants/app_constants.dart';
import '../../core/logic/order/order_bloc.dart';
import '../../core/logic/order/order_event.dart';
import '../../core/models/drink/drink.dart';
import '../../core/models/drink/drinks.dart';
import '../../core/models/order/order.dart';
import '../../core/widgets/button_components/icon_button_components/side_page_app_bar_icon_button.dart';
import '../../core/widgets/text_form_field_components/text_form_field_component.dart';

class AddOrderScreen extends StatefulWidget {
  const AddOrderScreen({super.key});

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  final _formKey = GlobalKey<FormState>();
  final _customerNameController = TextEditingController();
  final _instructionsController = TextEditingController();

  Drink? _selectedDrink;

  final List<Drink> _availableDrinks = [
    const Shai(),
    const TurkishCoffee(),
    const HibiscusTea(),
    const Cappuccino(),
    const Espresso(),
    const CaramelMacchiato(),
    const Latte(),
    const Mocha(),
    const FlatWhite(),
    const IcedCoffee(),
    const Americano(),
    const CaramelMacchiato(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Add Order'),
      actions: [
        SidePageAppBarIconButton(
          icon: Icons.save_outlined,
          onPressed: () => _submitOrder(),
          toolTip: 'Save',
        ),
      ],
    ),
    body: Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormFieldComponent(
              controller: _customerNameController,
              label: 'Customer Name',
              prefixIcon: const Icon(Icons.person_3_outlined),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter customer name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Select Drink',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            ..._availableDrinks.map(
              (drink) => RadioListTile<Drink>(
                title: Text(drink.name),
                subtitle: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                      child: Text(
                        '\$ ${drink.price}',
                        style: TextStyle(
                          color: Theme.of(
                            context,
                          ).colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                    Text(
                      ' | ${drink.getDescription()}',
                      overflow: TextOverflow.fade,
                    ),
                  ],
                ),
                value: drink,
                groupValue: _selectedDrink,
                onChanged: (value) => setState(() => _selectedDrink = value),
              ),
            ),
            const SizedBox(height: 16),
            TextFormFieldComponent(
              controller: _instructionsController,
              label: 'Special Instructions',
              hint: 'e.g., extra mint, ya rais!',
              prefixIcon: const Icon(Icons.note_add_outlined),
              maxLines: 2,
            ),
          ],
        ),
      ),
    ),
  );

  void _submitOrder() {
    if (_formKey.currentState!.validate() && _selectedDrink != null) {
      final order = Order(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        customerName: _customerNameController.text.trim(),
        drink: _selectedDrink!,
        specialInstructions: _instructionsController.text.trim(),
        orderTime: DateTime.now(),
      );

      context.read<OrderBloc>().add(AddOrder(order));

      // Clear form
      _customerNameController.clear();
      _instructionsController.clear();
      setState(() => _selectedDrink = null);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Order added successfully!')),
      );
    } else if (_selectedDrink == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please select a drink')));
    }
  }

  @override
  void dispose() {
    _customerNameController.dispose();
    _instructionsController.dispose();
    super.dispose();
  }
}
