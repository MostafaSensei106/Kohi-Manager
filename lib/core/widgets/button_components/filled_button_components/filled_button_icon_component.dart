import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../config/constants/app_constants.dart';

class FilledButtonIconComponent extends StatelessWidget {
  const FilledButtonIconComponent({
    required this.label,
    required this.onPressed,
    required this.icon,
    this.isEnable = true,
    this.useInBorderRadius = false,
    super.key,
    this.color,
  });

  final String label;
  final VoidCallback onPressed;
  final IconData icon;
  final Color? color;
  final bool isEnable;
  final bool useInBorderRadius;
  @override
  Widget build(BuildContext context) => FilledButton.icon(
    onPressed: isEnable ? () => {HapticFeedback.vibrate(), onPressed()} : null,
    label: Text(label),
    icon: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(AppConstants.inBorderRadius),
      ),
      child: Icon(icon),
    ),
    style: FilledButton.styleFrom(
      backgroundColor: color ?? Theme.of(context).colorScheme.onPrimary,
      foregroundColor: Theme.of(context).colorScheme.primary,
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.paddingHalf,
        vertical: AppConstants.paddingHalf,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: useInBorderRadius
            ? BorderRadius.circular(AppConstants.inBorderRadius)
            : BorderRadius.circular(AppConstants.outBorderRadius),
      ),
    ),
  );
}
