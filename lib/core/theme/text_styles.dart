import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle get defaultTxt => GoogleFonts.poppins(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
      );

  static TextStyle get xxs => defaultTxt.copyWith(fontSize: 7.sp);
  static TextStyle get xs => defaultTxt.copyWith(fontSize: 10.sp);
  static TextStyle get s => defaultTxt.copyWith(fontSize: 12.sp);
  static TextStyle get sm => defaultTxt.copyWith(fontSize: 14.sp);
  static TextStyle get m => defaultTxt.copyWith(fontSize: 16.sp);
  static TextStyle get ml => defaultTxt.copyWith(fontSize: 20.sp);
  static TextStyle get l => defaultTxt.copyWith(fontSize: 24.sp);
  static TextStyle get xl => defaultTxt.copyWith(fontSize: 32.sp);
  static TextStyle get xxl => defaultTxt.copyWith(fontSize: 40.sp);
}
