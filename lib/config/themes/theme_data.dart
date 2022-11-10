import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomThemeData {
  ThemeData? getThemeData(isLightMode) {
    return isLightMode
        ? ThemeData(
            colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: Color(0xff08A74A),
              onPrimary: Colors.black,
              secondary: Color(0xff121212),
              onSecondary: Colors.white,
              error: Colors.red,
              onError: Colors.white,
              background: Colors.white,
              onBackground: Colors.black,
              surface: Colors.white,
              onSurface: Color(0xff525252),
            ),
            primaryColor: const Color(0xff08A74A),
            textTheme: TextTheme(
              titleSmall: GoogleFonts.inter(
                fontSize: 15,
                color: Colors.black54,
                textStyle: const TextStyle(
                  overflow: TextOverflow.visible,
                ),
              ),
              titleMedium: GoogleFonts.inter(
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              titleLarge: GoogleFonts.inter(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
              labelSmall: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
              labelMedium: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                textStyle: const TextStyle(
                  overflow: TextOverflow.visible,
                ),
              ),
              labelLarge: GoogleFonts.inter(
                fontSize: 19,
                fontWeight: FontWeight.w400,
                textStyle: const TextStyle(
                  overflow: TextOverflow.visible,
                ),
              ),
            ),
            scaffoldBackgroundColor: const Color(0xff121212),
            appBarTheme: AppBarTheme(
              color: const Color(0xff08A74A),
              centerTitle: true,
              titleTextStyle: GoogleFonts.inter(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              iconTheme: const IconThemeData(
                color: Colors.black,
              ),
              elevation: 1,
            ),
            bottomAppBarTheme: const BottomAppBarTheme(
              color: Color(0xff121212),
              elevation: 5,
            ),
            cardTheme: const CardTheme(
              color: Colors.white,
              elevation: 4,
              shadowColor: Colors.white,
            ),
            shadowColor: const Color(0xffBDC8DF).withOpacity(0.7),
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(
                  const Color(
                    0xff4EA995,
                  ),
                ),
                textStyle: MaterialStateProperty.all<TextStyle>(
                  const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            radioTheme: RadioThemeData(
              fillColor:
                  MaterialStateProperty.all<Color>(const Color(0xff4EA995)),
            ),
          )
        : ThemeData(
            colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: Colors.black,
              onPrimary: Colors.black,
              secondary: Colors.black,
              onSecondary: Colors.white,
              error: Colors.red,
              onError: Colors.white,
              background: Colors.white,
              onBackground: Colors.black,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            textTheme: TextTheme(
              titleSmall: TextStyle(
                fontSize: Get.height * 0.0193,
                color: Colors.green,
              ),
              titleMedium: TextStyle(
                fontSize: Get.height * 0.0201,
                fontWeight: FontWeight.w500,
              ),
              titleLarge: TextStyle(
                fontSize: Get.height * 0.0241,
                fontWeight: FontWeight.w500,
              ),
              labelSmall: TextStyle(
                fontSize: Get.height * 0.0101,
                fontWeight: FontWeight.w500,
                color: Colors.green,
              ),
            ),
            scaffoldBackgroundColor: Colors.black87,
            appBarTheme: const AppBarTheme(
              color: Colors.white,
              elevation: 0,
            ),
            bottomAppBarTheme: const BottomAppBarTheme(
              color: Color(
                0xfff4f4f4,
              ),
              elevation: 5,
            ),
            shadowColor: const Color(0xffBDC8DF).withOpacity(0.7),
            cardTheme: CardTheme(
              color: Colors.white,
              elevation: 4,
              shadowColor: const Color(0xffBDC8DF).withOpacity(0.7),
            ),
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(
                  const Color(
                    0xffFB8402,
                  ),
                ),
              ),
            ),
            radioTheme: RadioThemeData(
              fillColor: MaterialStateProperty.all<Color>(
                const Color(
                  0xffFB8402,
                ),
              ),
            ),
          );
  }
}
