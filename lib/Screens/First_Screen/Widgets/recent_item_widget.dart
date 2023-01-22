import 'package:financial_application/Consts/app_colors_const.dart';
import 'package:financial_application/Consts/app_icons_const.dart';
import 'package:financial_application/Consts/app_size_const.dart';
import 'package:flutter/material.dart';

Container resenItemsWidget(BuildContext context) {
  return Container(
    width: AppSizeConst(context).width - 20,
    height: 225,
    decoration: const BoxDecoration(
        // color: AppColors.topBackgroundColor,
        ),
    child: Theme(
      data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: const Color.fromARGB(0, 255, 255, 255))),
      child: ListView.builder(
        shrinkWrap: false,
        // physics: const NeverScrollableScrollPhysics(),
        // scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return resentItems(index: index);
        },
      ),
    ),
  );
}

Padding resentItems({required int index}) {
  return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              AppIcons.emptyUserIcone,
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "JOHN DOE",
                    style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "United Kingdom",
                    style: TextStyle(
                        color: AppColors.blackColor.withOpacity(0.3),
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            width: 5,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "80,000 AED",
                    style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "11 Aug 2021",
                    style: TextStyle(
                        color: AppColors.blackColor.withOpacity(0.3),
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              AppIcons.check,
            ],
          )
        ],
      ));
}
