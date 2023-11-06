import 'package:classify_app/styles/custom_color_style.dart';
import 'package:classify_app/styles/custom_font_style.dart';
import 'package:flutter/material.dart';

ThemeData lightThemeData() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: CustomTextStyle.displayLarge
            .copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
    tabBarTheme: const TabBarTheme(
      indicatorColor: Colors.black,
      labelColor: Colors.black,
      indicatorSize: TabBarIndicatorSize.label,
      tabAlignment: TabAlignment.start,
    ),
  );
}

ThemeData darkThemeData() {
  return ThemeData(
      scaffoldBackgroundColor: CustomColor.darkGray,
      appBarTheme: const AppBarTheme(backgroundColor: CustomColor.darkGray),
      tabBarTheme: const TabBarTheme(indicatorColor: Colors.white));
}
