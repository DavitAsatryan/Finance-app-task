import 'package:financial_application/Consts/app_colors_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  static List<String> userImagesList = [
    "assets/userImages/user_one_image.png",
    "assets/userImages/user_three_image.png",
    "assets/userImages/user_two_image.png",
    "assets/userImages/user_one_image.png",
    "assets/userImages/user_three_image.png",
    "assets/userImages/user_one_image.png",
    "assets/userImages/user_three_image.png",
    "assets/userImages/user_two_image.png",
    "assets/userImages/user_one_image.png",
    "assets/userImages/user_three_image.png",
  ];

  static final notificationIcon = SvgPicture.asset(
      "assets/icones/notification.svg",
      color: AppColors.whiteColor);
  static final profileIcone = Image.asset("assets/icones/profile_icone.png");

  static final visablue = Image.asset("assets/icones/Visa Card_blue.png");
  static final visaGreen = Image.asset("assets/icones/Visa Card_green.png");
  static final visaLogo = Image.asset("assets/icones/Visa_Inc._logo.svg.png");
  static final backIcone = Image.asset(
    "assets/icones/backIcon.png",
    height: 9,
    width: 11,
  );
  static final menuIcone = Image.asset(
    "assets/icones/menuIcone.png",
    height: 12,
    width: 14,
  );

  static final check = Image.asset("assets/icones/check.png");
  static final greenUpIcone = Image.asset("assets/icones/green_up_icone.png",
      height: 16, fit: BoxFit.fitHeight);
  static final emptyUserIcone =
      Image.asset("assets/icones/empty_user_icone.png");
}
