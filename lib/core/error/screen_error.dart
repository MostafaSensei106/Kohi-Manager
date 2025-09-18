import 'package:flutter/material.dart'
    show
        ErrorWidget,
        Material,
        EdgeInsets,
        Text,
        TextStyle,
        MainAxisSize,
        Colors,
        BorderRadius,
        BoxDecoration,
        Container,
        TextAlign,
        Column,
        Padding,
        Center;
import 'package:flutter_svg/svg.dart' show SvgPicture;

import '../config/constants/app_constants.dart' show AppConstants;

void errorScreen() {
  ErrorWidget.builder = (final details) => Material(
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.padding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: AppConstants.paddingHalf,
          children: [
            Container(
              padding: const EdgeInsets.all(AppConstants.paddingHalf),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  AppConstants.outBorderRadius,
                ),
              ),
              child: SvgPicture.asset(
                'assets/svgs/undraw_bug-fixing_sgk7.svg',
                width: 210,
                height: 210,
              ),
            ),
            const Text('Something went wrong'),
            Text(
              details.exception.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    ),
  );
}
