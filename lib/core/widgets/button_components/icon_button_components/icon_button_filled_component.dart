import 'package:flutter/material.dart' show IconButton;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../../config/constants/app_constants.dart';

class IconButtonFilledComponent extends StatelessWidget {
  const IconButtonFilledComponent({
    required this.icon,
    required this.onPressed,
    required this.toolTip,
    this.useInBorderRadius = false,
    super.key,
  });
  final IconData icon;
  final VoidCallback onPressed;
  final bool useInBorderRadius;
  final String toolTip;

  @override
  /// Builds an [IconButton] widget that displays an icon and
  /// responds to taps by calling [onPressed] and providing haptic
  /// feedback. The button's appearance is determined by the [icon]
  /// property.
  Widget build(final BuildContext context) => IconButton.filled(
    icon: Icon(icon),
    tooltip: toolTip,
    style: IconButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: useInBorderRadius
            ? BorderRadius.circular(AppConstants.inBorderRadius)
            : BorderRadius.circular(AppConstants.outBorderRadius),
      ),
    ),
    onPressed: () {
      HapticFeedback.vibrate();
      onPressed();
    },
  );
}
