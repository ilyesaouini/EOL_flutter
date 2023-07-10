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
    on<AbsenceEvent>((event, emit) async {
      if (event is GetAbsenceList) {
        initSharedPref();

        List<Absence> absenceList = [];
        var url = "${absenceurl}?role=etudiant";
        var response = await http.get(Uri.parse(url));
        print(response.request!.url.toString());
        debugPrint(response.body.toString());
        var jsonResponse = jsonDecode(response.body);
        print(jsonResponse);
        if (response.statusCode == 200) {
          if (jsonResponse["absence"] != null) {
            jsonResponse["absence"].forEach((jsonElement) {
              absenceList.add(Absence.fromJson(jsonElement));
            });
          }

          emit(AbsenceLoaded(absenceList));
        } else {
          print("Something error");
          emit(AbsenceLoaded(absenceList));
        }
      } else if (event is GetAbsenceById) {
        var id = event.absenceId;
        var url = " ${absencebyidurl}/${id}";
        var response = await http.get(Uri.parse(url));
        print(response.request!.url.toString());
        debugPrint(response.body.toString());
        var jsonResponse = jsonDecode(response.body);
        print(jsonResponse);
        if (response.statusCode == 200) {
          absencemodel = Absence.fromJson(jsonResponse['data']);
        }
      } else if (event is ReclamationEvent) {
        var url = "${addreclamationurl}?role=etudiant";
        var response = await http.post(Uri.parse(url),
        body: {'description': event.description,'module': event.module, 'etudiant':event.etudiant});
      }
    });
  }
}
