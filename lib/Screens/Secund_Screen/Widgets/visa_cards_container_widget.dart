import 'package:financial_application/Consts/app_colors_const.dart';
import 'package:financial_application/Consts/app_icons_const.dart';
import 'package:financial_application/Consts/app_size_const.dart';
import 'package:flutter/material.dart';

Column visa_cards_container_widget(BuildContext context,
    PageController pageController, Function(int) onChange, int pageNow) {
  List<Widget> cardsList = [
    AppIcons.visablue,
    AppIcons.visaGreen,
  ];

  return Column(
    children: [
      SizedBox(
          width: AppSizeConst(context).width,
          height: 220,
          child: PageView.builder(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            itemCount: cardsList.length,
            onPageChanged: onChange,
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: pageController,
                builder: (context, child) => child!,
                child: cardsList[index],
              );
            },
          )),
      const SizedBox(
        height: 20,
      ),
      GestureDetector(
        onHorizontalDragUpdate: (details) {
          // Swiping in right direction.
          if (details.delta.dx > 0) {
            // pageController.jumpToPage(0);
            pageController.animateToPage(0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn);
          }

          // Swiping in left direction.
          if (details.delta.dx < 0) {
            //pageController.jumpToPage(0);
            pageController.animateToPage(1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn);
          }
        },
        child: Container(
          decoration: const BoxDecoration(),
          width: AppSizeConst(context).width / 2,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                2,
                (index) => Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        width: pageNow == index ? 35 : 15,
                        height: 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: pageNow == index
                                ? AppColors.blackColor
                                : AppColors.blackColor.withOpacity(0.3)),
                      ),
                    )),
          ),
        ),
      ),
    ],
  );
}
