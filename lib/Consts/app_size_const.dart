import 'package:flutter/material.dart';

class AppSizeConst {
  BuildContext context;

  AppSizeConst(this.context);

  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;
  dynamic get brightness => MediaQuery.of(context).platformBrightness;
}
