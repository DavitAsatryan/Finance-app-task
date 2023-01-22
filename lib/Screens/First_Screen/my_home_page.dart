import 'package:financial_application/Bloc/Get_users_bloc/get_users_bloc_bloc.dart';
import 'package:financial_application/Consts/app_button_style_const.dart';
import 'package:financial_application/Consts/app_colors_const.dart';
import 'package:financial_application/Consts/app_size_const.dart';
import 'package:financial_application/Screens/First_Screen/Widgets/app_bar_widget.dart';
import 'package:financial_application/Screens/First_Screen/Widgets/diagram_widget.dart';
import 'package:financial_application/Screens/First_Screen/Widgets/financlal_goals_widget.dart';
import 'package:financial_application/Screens/First_Screen/Widgets/top_container_widget.dart';
import 'package:financial_application/Screens/First_Screen/Widgets/top_users_widget.dart';
import 'package:financial_application/Screens/First_Screen/Widgets/recent_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _scrollController = ScrollController();
  var blocGetUsers;

  @override
  void initState() {
    blocGetUsers = BlocProvider.of<GetUsersBlocBloc>(context);
    blocGetUsers.add(GetUsersBlocEventInitial());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar widget
      appBar: appBar_Widget(context: context),
      body: Theme(   
        data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: const Color.fromARGB(0, 255, 255, 255))),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(children: [
            //top container widget
            topContainer_Widget(context),
            const SizedBox(
              height: 20,
            ),

            //diagram container widget

            partsOfWidgets(
              context: context,
              containerHeight: 290,
              title: "Performance Chart",
              isShowMoreButton: true,
              widget: diagram_widget(context),
            ),
            const SizedBox(
              height: 35,
            ),

            //top users widget
            partsOfWidgets(
              context: context,
              containerHeight: 170,
              isShowMoreButton: false,
              title: "Top USERS FROM YOUR COMMUNITY",
              widget: topUsersWidget(context),
            ),
            const SizedBox(
              height: 35,
            ),

            //recent transactions container widget
            partsOfWidgets(
              context: context,
              containerHeight: 280,
              title: "Recent Transactions",
              isShowMoreButton: true,
              widget: resenItemsWidget(context),
            ),
            const SizedBox(
              height: 35,
            ),
            //financial goals container widget
            partsOfWidgets(
              context: context,
              containerHeight: 290,
              title: "Financial Goals",
              isShowMoreButton: false,
              widget: financlalGoals(context),
            ),
            const SizedBox(
              height: 35,
            ),
            //
          ]),
        ),
      ),
    );
  }

  SizedBox partsOfWidgets(
      {required BuildContext context,
      required String title,
      required bool isShowMoreButton,
      required double containerHeight,
      required Widget widget}) {
    return SizedBox(
      height: containerHeight,
      width: AppSizeConst(context).width - 20,
      // decoration: const BoxDecoration(
      //     border: Border.fromBorderSide(BorderSide(color: Colors.black))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget_container_header(title, isShowMoreButton),
          widget,
        ],
      ),
    );
  }

  Row widget_container_header(String title, bool isShowMoreButton) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title.toUpperCase(),
            style: const TextStyle(
                color: AppColors.blackColor,
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold),
          ),
        ),
        isShowMoreButton
            ? Expanded(
                flex: 1,
                child: ElevatedButton(
                    style: AppButtonStyle.style,
                    onPressed: () {},
                    child: Text(
                      "more".toUpperCase(),
                      style: const TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 12,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold),
                    )),
              )
            : const SizedBox()
      ],
    );
  }
}
