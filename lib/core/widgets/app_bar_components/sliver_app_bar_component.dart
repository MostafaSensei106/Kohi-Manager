import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/constants/app_constants.dart';

class SliverAppBarComponent extends StatelessWidget {
  const SliverAppBarComponent({
    required this.expandedHeight,
    required this.pinned,
    this.title,
    super.key,
    this.flexibleSpace,
    this.leading,
    this.actions,
    this.bottom,
    this.useBackButton = true,
  });

  final Widget? title;

  final double expandedHeight;
  final bool pinned;
  final Widget? flexibleSpace;
  final Widget? leading;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final bool useBackButton;

  void leave(final BuildContext context) {
    HapticFeedback.vibrate();
    Navigator.pop(context);
  }

  bool cheakLocation(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final isArabic = locale.languageCode == 'ar';
    return isArabic;
  }

  @override
  Widget build(BuildContext context) => SliverAppBar(
    title: title,
    foregroundColor: Theme.of(context).colorScheme.onSurface,
    centerTitle: true,
    forceMaterialTransparency: true,
    expandedHeight: expandedHeight,
    flexibleSpace: flexibleSpace,
    pinned: pinned,
    leading: useBackButton
        ? _buildSidePageAppBarIcon(
            context,
            cheakLocation(context)
                ? Icons.keyboard_double_arrow_right_rounded
                : Icons.keyboard_double_arrow_left_rounded,
          )
        : null,
    actions: actions,
    bottom: bottom,
    elevation: 0,
  );

  /// Returns a [Padding] widget containing a [Material] widget with an [InkWell] child.
  ///
  /// The [InkWell] widget has a rounded border and is wrapped in a transparent [Material] widget.
  /// When tapped, it triggers the [leave] function to navigate back in the app.
  ///
  /// The [InkWell] contains a [Container] with a rounded border and a background color of
  /// [Theme.of(context).colorScheme.surfaceContainer]. Inside the [Container] is an [Icon] widget
  /// with the provided [icon] parameter, sized according to [SenseiConst.iconSize] and colored
  /// using [Theme.of(context).colorScheme.onSurface].
  Widget _buildSidePageAppBarIcon(
    final BuildContext context,
    final IconData icon,
  ) => IconButton.filled(
    style: IconButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.outBorderRadius),
      ),
      padding: const EdgeInsets.all(4),
    ),
    onPressed: () => leave(context),
    icon: Icon(icon, size: AppConstants.iconSize),
    color: Theme.of(context).colorScheme.onSurface,
  );
}
