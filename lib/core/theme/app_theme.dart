import 'package:fitstart/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.dark(),
    scaffoldBackgroundColor: AppColors.white,
  );
}
