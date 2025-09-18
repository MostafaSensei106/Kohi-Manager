import 'package:flutter/material.dart' show Theme, Color;
import 'package:flutter/widgets.dart'
    show
        BorderRadius,
        BoxDecoration,
        BuildContext,
        Container,
        EdgeInsets,
        StatelessWidget,
        Widget;

import '../../config/constants/app_constants.dart' show AppConstants;

class AppContainerComponent extends StatelessWidget {
  const AppContainerComponent({
    required this.child,
    super.key,
    this.useInBorderRadius = false,
    this.padding = const EdgeInsets.all(0),
    this.color,
  });
  final Widget child;
  final bool useInBorderRadius;
  final EdgeInsets padding;
  final Color? color;

  @override
  /// Returns a [Container] widget with the given properties.
  ///
  /// The [color] property of the [BoxDecoration] is set to the
  /// [Theme.of(context).colorScheme.surfaceContainer] color.
  ///
  /// The [borderRadius] property of the [BoxDecoration] is set to a
  /// [BorderRadius.circular] with a radius determined by the
  /// [useInBorderRadius] property.
  ///
  /// The [child] is passed as-is.
  Widget build(final BuildContext context) => Container(
    padding: padding,
    decoration: BoxDecoration(
      color: color ?? Theme.of(context).colorScheme.surfaceContainer,
      borderRadius: useInBorderRadius
          ? BorderRadius.circular(AppConstants.inBorderRadius)
          : BorderRadius.circular(AppConstants.outBorderRadius),
    ),
    child: child,
  );
}
