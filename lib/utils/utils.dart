import 'package:copihass/utils/route_transition.dart';

import 'package:flutter/material.dart';

class Constants {
  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();
  static const adminRoleValue = "admin";
  static const instructorRoleValue = "instructor";
  static const studentRoleValue = "student";
}

class Utils {
  static openPageWithRightSlide(Widget widget, BuildContext context) {
    Navigator.of(context).push(SlideRightRoute(page: widget));
  }

  static openPageWithScaleTransition(Widget widget) {
    Navigator.of(Constants.globalKey.currentContext!)
        .push(ScaleTransitionRoute(page: widget));
  }

  static openPageWithBottomToTopTransition(Widget widget) {
    Navigator.of(Constants.globalKey.currentContext!)
        .push(SlideTopRoute(page: widget));
  }

  static openPageAndClearStack(Widget widget, BuildContext buildContext) {
    Navigator.of(buildContext).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => widget),
        (Route<dynamic> route) => false);
  }
}
