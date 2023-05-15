import 'package:flutter/material.dart';
import 'package:quran_riwayat/app/utilities/app_colors.dart';

class AppConstants {
  AppConstants._();

  static const appName = 'Quran Riwayat';

  static final appTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSwatch(accentColor: AppColors.goldColor),
  );
}
