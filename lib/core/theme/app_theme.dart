import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white10,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
  fontFamily: GoogleFonts.inter().fontFamily,
  textTheme: GoogleFonts.poppinsTextTheme(),
  useMaterial3: true,
);
