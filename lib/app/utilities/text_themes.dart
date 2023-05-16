import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextThemes {
  TextThemes._();

  static TextStyle largeSubTitle =
      TextStyle(fontSize: 18.sp, fontFamily: 'Amiri');
  static TextStyle mediumSubTitle =
      TextStyle(fontSize: 14.sp, fontFamily: 'Amiri');
  static TextStyle smallSubTitle =
      TextStyle(fontSize: 12.sp, fontFamily: 'Amiri');

  static TextStyle smallBoldSubTitle = TextStyle(
      fontSize: 12.sp, fontFamily: 'Roboto', fontWeight: FontWeight.bold);

  static TextStyle mediumBoldSubTitle = TextStyle(
      fontSize: 14.sp, fontFamily: 'Roboto', fontWeight: FontWeight.bold);

  static TextStyle largeBoldSubTitle = TextStyle(
      fontSize: 18.sp, fontFamily: 'Roboto', fontWeight: FontWeight.bold);
}
