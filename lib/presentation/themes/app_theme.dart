import 'package:flutter/material.dart';
import 'package:cms_audit/core/utils/custom_color.dart';

abstract class AppTheme {
  static const Color primaryColor = CustomColor.blue;
  static const Color secondaryColor = Colors.grey;
  static ThemeData theme(BuildContext context) => Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: AppTheme.primaryColor,
            ),
        textTheme: ThemeData.light().textTheme.apply(
              fontFamily: 'Archivo',
            ),
        primaryTextTheme: ThemeData.light().textTheme.apply(
              fontFamily: 'Archivo',
            ),
      );
}
