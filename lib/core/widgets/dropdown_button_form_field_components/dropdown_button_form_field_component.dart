import 'package:flutter/material.dart';

import '../../config/constants/app_constants.dart';

class DropdownButtonFormFieldComponent extends StatelessWidget {
  const DropdownButtonFormFieldComponent({
    required this.items,
    required this.icon,
    required this.lableText,
    super.key,
    this.onChanged,
    this.useInBorderRadius = false,
  });

  final Widget icon;
  final String lableText;

  final bool useInBorderRadius;

  final List<DropdownMenuItem> items;
  final ValueChanged? onChanged;

  @override
  Widget build(final BuildContext context) => DropdownButtonFormField(
    icon: icon,
    enableFeedback: true,
    borderRadius: useInBorderRadius
        ? BorderRadius.circular(AppConstants.inBorderRadius)
        : BorderRadius.circular(AppConstants.outBorderRadius),

    items: items,
    onChanged: onChanged,
    elevation: 0,
    decoration: InputDecoration(
      labelText: lableText,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(AppConstants.outBorderRadius),
        ),
      ),
    ),
  );
}
