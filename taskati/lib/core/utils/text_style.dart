import 'package:flutter/material.dart';
import 'package:taskati/core/utils/app_colors.dart';

TextStyle getTitleTextStyle(BuildContext context,
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontFamily: "Poppins",
    fontSize: fontSize ?? 18,
    color: color ?? Theme.of(context).colorScheme.onSurface,
    fontWeight: fontWeight ?? FontWeight.bold,
  );
}

TextStyle getBodyTextStyle(BuildContext context,
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontFamily: "Poppins",
    fontSize: fontSize ?? 16,
    color: color ?? Theme.of(context).colorScheme.onSurface,
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
