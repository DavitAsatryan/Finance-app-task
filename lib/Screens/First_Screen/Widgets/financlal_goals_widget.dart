import 'package:financial_application/Consts/app_colors_const.dart';
import 'package:financial_application/Consts/app_size_const.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

Container financlalGoals(BuildContext context) {
  return Container(
      width: AppSizeConst(context).width - 20,
      height: 230,
      decoration: const BoxDecoration(
          //color: AppColors.topBackgroundColor,
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          financlalGoalsItems(
            context: context,
            progressColor: AppColors.blueColor,
            percent: 0.4,
            titleText: "XX of total XX",
          ),
          financlalGoalsItems(
            context: context,
            progressColor: AppColors.redColor,
            percent: 0.8,
            titleText: "XX of total XX",
          ),
          financlalGoalsItems(
            context: context,
            progressColor: AppColors.purpleColor,
            percent: 0.6,
            titleText: "XX of total XX",
          ),
        ],
      ));
}

Column financlalGoalsItems(
    {required BuildContext context,
    required Color progressColor,
    required double percent,
    required String titleText}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,

    // mainAxisAlignment: ma,
    children: [
      Text(
        titleText,
        style: TextStyle(
            color: AppColors.blackColor.withOpacity(0.3),
            fontSize: 16,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold),
      ),
      Container(
        padding: const EdgeInsets.only(top: 15, bottom: 30),
        width: AppSizeConst(context).width,
        child: LinearPercentIndicator(
          padding: EdgeInsets.zero,
          lineHeight: 7.0,
          percent: percent,
          progressColor: progressColor,
          backgroundColor: AppColors.blackColor.withOpacity(0.1),
        ),
      ),
    ],
  );
}
