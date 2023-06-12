import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyle {
  static TextStyle defaultTextStyle = TextStyle(
    fontSize: 16,
    fontFamily: GoogleFonts.mPlusRounded1c().fontFamily,
  );
  final largeTextStyle =
      defaultTextStyle.copyWith(fontSize: 40, fontWeight: FontWeight.bold);
  final labelTextStyle = defaultTextStyle.copyWith(fontWeight: FontWeight.bold);
}
