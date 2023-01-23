import 'package:financial_application/Bloc/Get_users_bloc/get_users_bloc_bloc.dart';
import 'package:financial_application/Consts/app_colors_const.dart';
import 'package:financial_application/Consts/app_icons_const.dart';
import 'package:financial_application/Consts/app_size_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Container topUsersWidget(BuildContext context) {
  return Container(
    width: AppSizeConst(context).width - 20,
    height: 130,
    decoration: const BoxDecoration(
        // color: AppColors.topBackgroundColor,
        ),
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
                    secondary: const Color.fromARGB(0, 255, 255, 255))),
            child: ListView.builder(
              shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return topUsers(index: index, state: state);
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
      },
    ),
  );
}

Padding topUsers(
    {required int index, required GetUsersBlocFetchSuccsesState state}) {
  return Padding(
    padding: const EdgeInsets.only(right: 20),
    child: Container(
      width: 60,
      decoration: const BoxDecoration(
          // color: AppColors.blueColor,
          ),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              AppIcons.userImagesList[index],
              height: 60,
              width: 60,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              state.userModel[index].username,
              style: const TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 12,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w100),
              overflow: TextOverflow.fade,
              maxLines: 2,
            ),
          ]),
    ),
  );
}
