import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Constants {
  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();
  static const adminRoleValue = "admin";
  static const instructorRoleValue = "instructor";
  static const studentRoleValue = "student";
}
