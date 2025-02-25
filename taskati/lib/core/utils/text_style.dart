import 'package:flutter/material.dart';
import 'package:taskati/core/utils/app_colors.dart';

TextStyle getTitleTextStyle(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontFamily: "Poppins",
    fontSize: fontSize ?? 18,
    color: color ?? AppColors.darkColor,
    fontWeight: fontWeight ?? FontWeight.bold,
  );
}

TextStyle getBodyTextStyle(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontFamily: "Poppins",
    fontSize: fontSize ?? 16,
    color: color ?? AppColors.darkColor,
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}

TextStyle getSmallTextStyle(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontFamily: "Poppins",
    fontSize: fontSize ?? 14,
    color: color ?? AppColors.greyColor,
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}
