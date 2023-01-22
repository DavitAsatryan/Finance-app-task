import 'package:financial_application/Consts/app_colors_const.dart';
import 'package:flutter/material.dart';

class AppButtonStyle {
  static final ButtonStyle style = ElevatedButton.styleFrom(
      primary: AppColors.middlepurple.withOpacity(0.8),
      padding: const EdgeInsets.symmetric(horizontal: 25),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      minimumSize: const Size(120, 40));
}
