import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const MaterialColor mainColor = Colors.purple;
  static final TextStyle HeaderStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: mainColor);
  static BorderRadius bRadius = BorderRadius.circular(24);
  static final TextStyle LessonCountStyle = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w600, color: mainColor);
  static final TextStyle AverageStyle = GoogleFonts.quicksand(
      fontSize: 55, fontWeight: FontWeight.w800, color: mainColor);
  static final EdgeInsets DrowDownPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);
}
