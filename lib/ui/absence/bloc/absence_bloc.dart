import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:copihass/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/absence.dart';
import '../../../models/user.dart';

part 'absence_event.dart';
part 'absence_state.dart';

late SharedPreferences prefs;
final usermodel = new User();
Absence absencemodel = new Absence();
//final absencemodel = new Absence();
void initSharedPref() async {
  prefs = await SharedPreferences.getInstance();
}

class AbsenceBloc extends Bloc<AbsenceEvent, AbsenceState> {
  AbsenceBloc() : super(AbsenceInitial()) {
    on<GetAbsenceList>((event, emit) async {
      if (event is GetAbsenceList) {
        initSharedPref();
        var absence = [];
        var response = await http.get(Uri.parse(absenceurl));
        debugPrint(response.body.toString());
        var jsonResponse = jsonDecode(response.body);
        print(jsonResponse);
        if (response.statusCode == 200) {
          absence = jsonResponse["absence"];

          absencemodel = Absence.fromJson(absence[0]);
          var list = [absencemodel];
          // prefs.setString("id_absnece", absence[0]);

          emit(AbsenceLoaded(list));
        } else {
          print("Something error");
        }
      }
    });
  }
}
