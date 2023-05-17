import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class TextThemes {
  TextThemes._();

  static TextStyle largeSubTitle = TextStyle(
      fontSize: 18.sp, fontFamily: 'Amiri', color: AppColors.dullBlackColor);
  static TextStyle mediumSubTitle = TextStyle(
      fontSize: 14.sp, fontFamily: 'Amiri', color: AppColors.dullBlackColor);
  static TextStyle smallSubTitle = TextStyle(
      fontSize: 12.sp, fontFamily: 'Amiri', color: AppColors.dullBlackColor);

  static const TextStyle hintStyle =
      TextStyle(fontSize: 12, fontFamily: 'Amiri', color: AppColors.hintColor);

  static TextStyle smallBoldSubTitle = TextStyle(
      fontSize: 12.sp, fontFamily: 'Roboto', fontWeight: FontWeight.bold);

  static TextStyle mediumBoldSubTitle = TextStyle(
      fontSize: 14.sp, fontFamily: 'Roboto', fontWeight: FontWeight.bold);

  static TextStyle largeBoldSubTitle = TextStyle(
      fontSize: 18.sp, fontFamily: 'Roboto', fontWeight: FontWeight.bold);
}
