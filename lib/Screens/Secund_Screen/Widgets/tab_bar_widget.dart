import 'package:financial_application/Consts/app_colors_const.dart';
import 'package:financial_application/Consts/app_size_const.dart';
import 'package:financial_application/Screens/First_Screen/Widgets/recent_item_widget.dart';
import 'package:flutter/material.dart';

Padding tab_bar_widget(BuildContext context, TabController controller) {
  return Padding(
    padding: const EdgeInsets.only(left: 14, right: 14),
    child: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: AppColors.blackColor.withOpacity(1),
              isScrollable: true,
              labelColor: AppColors.blackColor,
              unselectedLabelColor: AppColors.darkGrayColor,
              controller: controller,
              tabs: const [
                Tab(text: "Menu title 1"),
                Tab(text: "Menu title 2"),
                Tab(text: "Menu title 3"),
                Tab(text: "Menu title 4"),
              ]),
        ),
        // const SizedBox(
        //   height: 35,
        // ),

        // const SizedBox(
        //   height: 20,
        // ),
        SizedBox(
          width: AppSizeConst(context).width,
          height: AppSizeConst(context).height / 1.82,
          child: TabBarView(controller: controller, children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Recent Transactions".toUpperCase(),
                      style: const TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.fromSwatch().copyWith(
                            secondary: const Color.fromARGB(0, 255, 255, 255))),
                    child: ListView.builder(
                      itemCount: 100,
                      itemBuilder: (context, index) {
                        return resentItems(index: index);
                      },
                    ),
                  ),
                ),
              ],
            ),
            const Text("data"),
            const Text("data"),
            const Text("data"),
          ]),
        )
      ],
    ),
  );
}
