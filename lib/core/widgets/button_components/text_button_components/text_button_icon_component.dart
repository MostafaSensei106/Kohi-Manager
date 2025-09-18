import 'package:flutter/material.dart'
    show TextButton, MaterialTapTargetSize, Icons;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../../config/constants/app_constants.dart';

class TextButtonIconComponent extends StatelessWidget {
  const TextButtonIconComponent({
    required this.text,
    required this.onPressed,
    required this.icon,
    super.key,
    this.isClose = false,
    this.useInBorderRadius = false,
  });
  final String text;
  final VoidCallback onPressed;
  final bool isClose;
  final bool useInBorderRadius;
  final IconData icon;

  @override
  Widget build(final BuildContext context) => TextButton.icon(
    onPressed: () {
      HapticFeedback.vibrate();
      onPressed();
    },
    style: TextButton.styleFrom(
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: RoundedRectangleBorder(
        borderRadius: useInBorderRadius
            ? BorderRadius.circular(AppConstants.inBorderRadius)
            : BorderRadius.circular(AppConstants.outBorderRadius),
      ),
      elevation: 0,
      enableFeedback: true,
      enabledMouseCursor: SystemMouseCursors.click,
    ),
    label: Text(text),
    icon: Icon(isClose ? Icons.close : icon, size: AppConstants.iconSize),
  );
}
