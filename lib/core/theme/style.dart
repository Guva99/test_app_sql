import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app_sql/core/theme/typography.dart';

class Themes {
  static ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        fontFamily: 'VisbyRegular',
        scaffoldBackgroundColor: AppColors.black04,
        primaryColor: AppColors.black04,
        colorScheme: const ColorScheme.light(primary: AppColors.black04),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColors.black04,
        ),
        canvasColor: AppColors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.black,
            foregroundColor: AppColors.white,
            minimumSize: const Size(double.infinity, 61),
            textStyle: AppTypography.cf18SemiBold,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 1,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: AppColors.black50,
          shadowColor: AppColors.black20,
          centerTitle: true,
        ),
        textTheme:const TextTheme(),
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      );

  static ThemeData get darkTheme => lightTheme;
}

abstract class AppColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color black80 = Color(0xFF333333);
  static const Color black50 = Color(0xFF808080);
  static const Color black36 = Color(0xFFA3A3A3);
  static const Color black20 = Color(0xFFCCCCCC);
  static const Color black12 = Color(0xFFE0E0E0);
  static const Color black08 = Color(0xFFEBEBEB);
  static const Color black04 = Color(0xFFF5F5F5);

  static const Color yellowLight = Color(0xFFFEF0B4);
  static const Color greenLight = Color(0xFFDEF1DE);

  static const Color orange = Color(0xFFF08827);
  static const Color greenDark= Color(0xFF4BB05F);

  static const Color blue = Colors.blue;
  static const Color green = Colors.green;

  static const Color red = Colors.red;
  static const Color redLight = Color(0xFFDD3030);

  static const Color cherry = Color(0xFF83083C);

  static const Color o1 = Color(0xFFE4E3E1);
  static const Color o2 = Color(0xFF5D686E);
  static const Color o3 = Color(0xFF282423);
  static const Color o4 = Color(0xFF535257);
  static const Color o5 = Color(0xFF272727);
  static const Color o6 = Color(0xFF141414);
  static const Color o7 = Color(0xFFA1A1A1);
}
