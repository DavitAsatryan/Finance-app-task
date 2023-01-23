import 'package:financial_application/Bloc/Get_users_bloc/get_users_bloc_bloc.dart';
import 'package:financial_application/Consts/app_colors_const.dart';
import 'package:financial_application/Consts/app_size_const.dart';
import 'package:financial_application/Screens/Widgets_global/recent_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Padding tab_bar_widget(BuildContext context, TabController controller) {
  return Padding(
    padding: const EdgeInsets.only(left: 14, right: 14),
    child: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: AppColors.darkGrayColor.withOpacity(0.5)))),
          child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3,
              indicatorColor: AppColors.darkGrayColor.withOpacity(1),
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
                  child: BlocBuilder<GetUsersBlocBloc, GetUsersBlocState>(
                      builder: (context, state) {
                    if (state is GetUsersBlocLoadingState) {
                      return Center(
                        child: Container(
                            child: const CircularProgressIndicator(
                          color: AppColors.redColor,
                        )),
                      );
                    } else if (state is GetUsersBlocErrorState) {
                      return Center(
                          child: Container(
                        child: const Text(
                          'Something is wrong',
                          style: TextStyle(
                            color: AppColors.redColor,
                            fontSize: 15,
                            fontFamily: 'Roboto',
                          ),
                          overflow: TextOverflow.visible,
                        ),
                      ));
                    } else if (state is GetUsersBlocFetchSuccsesState) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.fromSwatch().copyWith(
                                secondary:
                                    const Color.fromARGB(0, 255, 255, 255))),
                        child: ListView.builder(
                          itemCount: state.userModel.length,
                          itemBuilder: (context, index) {
                            return resentItems(
                                context: context, index: index, state: state);
                          },
                        ),
                      );
                    }
                    return Center(
                      child: Container(
                          child: const CircularProgressIndicator(
                        color: AppColors.redColor,
                      )),
                    );
                  }),
                ),
              ],
            ),
            const Center(
                child: Text(
              "Empty data",
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 15,
                fontFamily: 'Roboto',
              ),
            )),
            const Center(
                child: Text(
              "Empty data",
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 15,
                fontFamily: 'Roboto',
              ),
            )),
            const Center(
                child: Text(
              "Empty data",
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 15,
                fontFamily: 'Roboto',
              ),
            )),
          ]),
        )
      ],
    ),
  );
}
