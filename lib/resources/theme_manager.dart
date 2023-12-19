import 'package:flutter/material.dart';
import 'package:interview_app/resources/fonts.gen.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    useMaterial3: true,
    fontFamily: Roboto.roboto,
    colorSchemeSeed: Colors.blue,
  );
}
