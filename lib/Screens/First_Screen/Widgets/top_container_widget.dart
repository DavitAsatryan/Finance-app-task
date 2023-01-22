import 'package:financial_application/Consts/app_colors_const.dart';
import 'package:financial_application/Consts/app_icons_const.dart';
import 'package:financial_application/Consts/app_size_const.dart';
import 'package:flutter/material.dart';

Container topContainer_Widget(BuildContext context) {
  return Container(
    width: AppSizeConst(context).width,
    height: 230,
    decoration: const BoxDecoration(
        color: AppColors.topBackgroundColor,
        borderRadius: BorderRadiusDirectional.only(
            bottomEnd: Radius.circular(30), bottomStart: Radius.circular(30))),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Center(
          child: Container(
            alignment: Alignment.topCenter,
            //decoration: const BoxDecoration(color: Colors.amber),
            // width: AppSizeConst(context).width / 1.5,
            // height: 120,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "\$56,271.68",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: AppColors.whiteColor,
                        fontSize: 37),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "+\$9,736",
                          style: TextStyle(
                              color: AppColors.whiteColor, fontSize: 15),
                        ),
                        const SizedBox(
                          width: 35,
                        ),
                        Row(
                          children: [
                            AppIcons.greenUpIcone,
                            const SizedBox(
                              width: 6,
                            ),
                            const Text(
                              "2.3%",
                              style: TextStyle(
                                  color: AppColors.greenColor, fontSize: 20),
                            ),
                          ],
                        ),
                      ]),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "ACCOUNT BALANCE",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: AppColors.darkGrayColor,
                        fontSize: 15),
                  ),
                ]),
          ),
        ),
        Row(
          children: [
            Expanded(
                child: sections(
                    upText: "12", underText: "Following", border: false)),
            Expanded(
                child: sections(
                    upText: "36", underText: "Transactions", border: true)),
            Expanded(
                child:
                    sections(upText: "4", underText: "Bills", border: false)),
          ],
        )
      ],
    ),
  );
}

Container sections(
    {required String upText, required String underText, required bool border}) {
  return Container(
    //  width: 150,
    height: 60,
    decoration: BoxDecoration(
      border: border
          ? const Border(
              right: BorderSide(
                color: AppColors.whiteColor,
                width: 1,
              ),
              left: BorderSide(
                color: AppColors.whiteColor,
                width: 1,
              ),
            )
          : null,
    ),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            upText,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 18,
              fontFamily: 'Roboto',
              color: AppColors.whiteColor,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            underText,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.darkGrayColor,
            ),
          ),
        ]),
  );
}
