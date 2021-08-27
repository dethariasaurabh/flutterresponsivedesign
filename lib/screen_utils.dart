import 'package:flutter/material.dart';

enum ScreenType { Watch, Handset, Tablet, Desktop }

class FormFactor {
  static double handset = 300;
  static double tablet = 600;
  static double desktop = 900;
}

ScreenType getFormFactor(BuildContext buildContext) {
  double deviceWidth = MediaQuery.of(buildContext).size.width;
  return deviceWidth > FormFactor.desktop
      ? ScreenType.Desktop
      : deviceWidth > FormFactor.tablet
          ? ScreenType.Tablet
          : deviceWidth > FormFactor.handset
              ? ScreenType.Handset
              : ScreenType.Watch;
}
