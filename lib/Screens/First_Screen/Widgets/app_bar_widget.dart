import 'package:financial_application/Bloc/Get_users_bloc/get_users_bloc_bloc.dart';
import 'package:financial_application/Consts/app_colors_const.dart';
import 'package:financial_application/Consts/app_icons_const.dart';
import 'package:financial_application/Screens/Secund_Screen/my_save_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

AppBar appBar_Widget({required BuildContext context}) {
  return AppBar(
    elevation: 0,
    backgroundColor: AppColors.topBackgroundColor,
    toolbarHeight: 120,
    title: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<GetUsersBlocBloc, GetUsersBlocState>(
          builder: (context, state) {
            if (state is GetUsersBlocLoadingState) {
              return Center(
                child: SizedBox(
                    width: 10,
                    height: 10,
                    child: CircularProgressIndicator(
                      color: AppColors.redColor.withOpacity(0.1),
                    )),
              );
            } else if (state is GetUsersBlocFetchSuccsesState) {
              return Text(
                "Hola, ${state.userModel[3].name}",
                style: const TextStyle(
                    color: AppColors.whiteColor,
                    fontFamily: 'AeonikTRIAL',
                    fontSize: 20),
              );
            }
            return const Text(
              "Hola, ...",
              style: TextStyle(
                  color: AppColors.whiteColor,
                  fontFamily: 'AeonikTRIAL',
                  fontSize: 20),
            );
          },
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "Te tenemos excelentes noticias para ti",
          style: TextStyle(
            color: AppColors.whiteColor.withOpacity(0.7),
            fontFamily: 'Roboto',
            fontSize: 11,
          ),
        ),
      ],
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: AppIcons.notificationIcon,
      ),
      IconButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BlocProvider<GetUsersBlocBloc>(
              create: (context) => GetUsersBlocBloc(),
              child: CreditCardsPage(),
            ),
          ));
        },
        icon: AppIcons.profileIcone,
      )
    ],
  );
}
