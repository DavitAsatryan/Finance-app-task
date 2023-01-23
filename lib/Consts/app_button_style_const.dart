import 'package:financial_application/Consts/app_colors_const.dart';
import 'package:flutter/material.dart';

class AppButtonStyle {
  static final ButtonStyle style = ElevatedButton.styleFrom(
      primary: AppColors.darkGrayColor.withOpacity(0.5),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      minimumSize: const Size(80, 40),
      maximumSize: const Size(120, 40));
}
