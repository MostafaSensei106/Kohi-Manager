import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../config/constants/app_constants.dart';

class SidePageAppBarIconButton extends StatelessWidget {
  const SidePageAppBarIconButton({
    required this.icon,
    required this.toolTip,
    this.isBackButton = false,
    super.key,
    this.onPressed,
    this.color,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final Color? color;
  final bool isBackButton;
  final String toolTip;

  void leave(final BuildContext context) {
    HapticFeedback.vibrate();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) => IconButton.filled(
    tooltip: toolTip,
    style: IconButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.outBorderRadius),
      ),
      padding: const EdgeInsets.all(4),
    ),
    onPressed: () => {HapticFeedback.vibrate(), onPressed!()},
    icon: Icon(icon, size: AppConstants.iconSize),
    color: Theme.of(context).colorScheme.onSurface,
  );
}
