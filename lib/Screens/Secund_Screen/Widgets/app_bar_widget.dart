import 'package:financial_application/Consts/app_colors_const.dart';
import 'package:financial_application/Consts/app_icons_const.dart';
import 'package:flutter/material.dart';

AppBar app_bar_widget(BuildContext context) {
  return AppBar(
    actions: [IconButton(onPressed: () {}, icon: AppIcons.menuIcone)],
    elevation: 0,
    leading: IconButton(
      icon: AppIcons.backIcone,
      onPressed: () => Navigator.of(context).pop(),
    ),
    backgroundColor: Colors.transparent,
    title: const Text(
      "My saved cards",
      style: TextStyle(
        color: AppColors.blackColor,
        fontSize: 20,
        fontFamily: 'Roboto',
      ),
    ),
  );
}
