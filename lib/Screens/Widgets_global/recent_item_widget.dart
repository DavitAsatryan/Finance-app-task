import 'package:financial_application/Bloc/Get_users_bloc/get_users_bloc_bloc.dart';
import 'package:financial_application/Consts/app_colors_const.dart';
import 'package:financial_application/Consts/app_icons_const.dart';
import 'package:financial_application/Consts/app_size_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Container resenItemsWidget(BuildContext context) {
  return Container(
    width: AppSizeConst(context).width - 20,
    height: 225,
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
              shrinkWrap: false,
              // physics: const NeverScrollableScrollPhysics(),
              // scrollDirection: Axis.horizontal,
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
        )));
      },
    ),
  );
}

Padding resentItems(
    {required BuildContext context,
    required int index,
    required GetUsersBlocFetchSuccsesState state}) {
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
                  SizedBox(
                    width: AppSizeConst(context).width / 2.5,
                    child: Text(
                      state.userModel[index].username,
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.blackColor,
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    state.userModel[index].address.city,
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
                        fontSize: 12,
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
