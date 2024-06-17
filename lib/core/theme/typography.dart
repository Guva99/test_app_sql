import 'package:flutter/material.dart';

abstract class AppTypography {
  static const fontFamilyRegular = 'VisbyRegular';
  static const fontFamilyBold = 'VisbyBold';
  static const fontFamilyThin = 'VisbyThin';
  static const fontFamilySemibold = 'VisbySemibold';

  ///REGULAR
  static const cf36Regular = TextStyle(
    fontFamily: fontFamilyRegular,
    fontSize: 36,
  );

  static const cf28Regular = TextStyle(
    fontFamily: fontFamilyRegular,
    fontSize: 28,
  );

  static const cf22Regular = TextStyle(
    fontFamily: fontFamilyRegular,
    fontSize: 22,
  );

  static const cf20Regular = TextStyle(
    fontFamily: fontFamilyRegular,
    fontSize: 20,
  );

  static const cf18Regular = TextStyle(
    fontFamily: fontFamilyRegular,
    fontSize: 18,
  );

  static const cf16Regular = TextStyle(
    fontFamily: fontFamilyRegular,
    fontSize: 16,
  );

  static const cf14Regular = TextStyle(
    fontFamily: fontFamilyRegular,
    fontSize: 14,
  );

  static const cf12Regular = TextStyle(
    fontFamily: fontFamilyRegular,
    fontSize: 12,
  );

  ///THIN
  static const cf36Thin = TextStyle(
    fontFamily: fontFamilyThin,
    fontSize: 36,
  );

  static const cf28Thin = TextStyle(
    fontFamily: fontFamilyThin,
    fontSize: 28,
  );

  static const cf22Thin = TextStyle(
    fontFamily: fontFamilyThin,
    fontSize: 22,
  );

  static const cf20Thin = TextStyle(
    fontFamily: fontFamilyThin,
    fontSize: 20,
  );
  static const cf18Thin = TextStyle(
    fontFamily: fontFamilyThin,
    fontSize: 18,
  );

  static const cf16Thin = TextStyle(
    fontFamily: fontFamilyThin,
    fontSize: 16,
  );

  static const cf14Thin = TextStyle(
    fontFamily: fontFamilyThin,
    fontSize: 14,
  );

  static const cf12Thin = TextStyle(
    fontFamily: fontFamilyThin,
    fontSize: 12,
  );

  ///Semi BOLD
  static const cf36SemiBold = TextStyle(
    fontFamily: fontFamilySemibold,
    fontSize: 36,
  );

  static const cf28SemiBold = TextStyle(
    fontFamily: fontFamilySemibold,
    fontSize: 28,
  );

  static const cf22SemiBold = TextStyle(
    fontFamily: fontFamilySemibold,
    fontSize: 22,
  );

  static const cf20SemiBold = TextStyle(
    fontFamily: fontFamilySemibold,
    fontSize: 20,
  );

  static const cf18SemiBold = TextStyle(
    fontFamily: fontFamilySemibold,
    fontSize: 18,
  );

  static const cf16SemiBold = TextStyle(
    fontFamily: fontFamilySemibold,
    fontSize: 16,
  );

  static const cf14SemiBold = TextStyle(
    fontFamily: fontFamilySemibold,
    fontSize: 14,
  );

  static const cf12SemiBold = TextStyle(
    fontFamily: fontFamilySemibold,
    fontSize: 12,
  );

  ///BOLD
  static const cf36Bold = TextStyle(
    fontFamily: fontFamilyBold,
    fontSize: 36,
  );

  static const cf28Bold = TextStyle(
    fontFamily: fontFamilyBold,
    fontSize: 28,
  );

  static const cf22Bold = TextStyle(
    fontFamily: fontFamilyBold,
    fontSize: 22,
  );

  static const cf20Bold = TextStyle(
    fontFamily: fontFamilyBold,
    fontSize: 20,
  );
  static const cf18Bold = TextStyle(
    fontFamily: fontFamilyBold,
    fontSize: 18,
  );

  static const cf16Bold = TextStyle(
    fontFamily: fontFamilyBold,
    fontSize: 16,
  );

  static const cf14Bold = TextStyle(
    fontFamily: fontFamilyBold,
    fontSize: 14,
  );

  static const cf12Bold = TextStyle(
    fontFamily: fontFamilyBold,
    fontSize: 12,
  );
}

extension Weights on TextStyle {
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);

  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  TextStyle get semibold => copyWith(fontWeight: FontWeight.w600);

  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);

  TextStyle get heavy => copyWith(fontWeight: FontWeight.w800);
}
