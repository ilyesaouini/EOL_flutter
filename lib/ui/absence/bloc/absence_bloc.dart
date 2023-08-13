import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:copihass/config.dart';
import 'package:copihass/models/absencenew.Model.dart';
import 'package:copihass/models/plan_class_session.dart';

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
AbsenceNew absencenewmodel = new AbsenceNew();
//final absencemodel = new Absence();
void initSharedPref() async {
  prefs = await SharedPreferences.getInstance();
}

class AbsenceBloc extends Bloc<AbsenceEvent, AbsenceState> {
  AbsenceBloc() : super(AbsenceInitial()) {
    on<AbsenceEvent>((event, emit) async {
      if (event is GetAbsenceList) {
        emit(AbsenceLoading());

        initSharedPref();

        List<AbsenceNew> absenceList = [];
        var url = "${absenceurl}?role=etudiant";
        var response = await http.get(Uri.parse(url));
        print(response.request!.url.toString());
        debugPrint(response.body.toString());
        var jsonResponse = jsonDecode(response.body);
        print(jsonResponse);
        if (response.statusCode == 200) {
          if (jsonResponse["absence"] != null) {
            jsonResponse["absence"].forEach((jsonElement) {
              absenceList.add(AbsenceNew.fromJson(jsonElement));
            });
          }

          emit(AbsenceLoaded(absenceList));
        } else {
          print("Something error");
          emit(AbsenceLoaded(absenceList));
        }
      } else if (event is AddReclamationAbsenceEvent) {
        var url = "${addreclamationurl}?role=etudiant";
        var response = await http.post(Uri.parse(url), body: {
          'description': event.description,
          'module': event.module,
          'etudiant': event.etudiant
        });
      } else if (event is GetAbsenceByEtudiant) {
        emit(AbsenceLoading());
        String? id_etudiant = prefs.getString('id');
        var url = "${absenceetudiant}";
        var response = await http.get(Uri.parse(url + id_etudiant.toString()));
        debugPrint(response.body.toString());
        var jsonResponse = jsonDecode(response.body);
        print(jsonResponse);
        List<AbsenceNew> absenceList = [];
        if (response.statusCode == 200) {
          if (jsonResponse["absence"] != null) {
            jsonResponse["absence"].forEach((jsonElement) {
              absenceList.add(AbsenceNew.fromJson(jsonElement));
            });
          }

          emit(AbsenceLoaded(absenceList));
        } else {
          print("Something error");
          emit(AbsenceLoaded(absenceList));
        }
      } else if (event is GetAbsenceByEnseignant) {
        emit(AbsenceLoading());
        String? id_etudiant = prefs.getString('id');
        var url = "${absenceetudiant}";
        var response = await http.get(Uri.parse(url + id_etudiant.toString()));
        debugPrint(response.body.toString());
        var jsonResponse = jsonDecode(response.body);
        print(jsonResponse);
        List<AbsenceNew> absenceList = [];
        if (response.statusCode == 200) {
          if (jsonResponse["absence"] != null) {
            jsonResponse["absence"].forEach((jsonElement) {
              absenceList.add(AbsenceNew.fromJson(jsonElement));
            });
          }

          emit(AbsenceLoaded(absenceList));
        } else {
          print("Something error");
          emit(AbsenceLoaded(absenceList));
        }
      } else if (event is GetClassByEnseignant) {
        initSharedPref();

        emit(ClassLoading());
        String? id_enseigant = prefs.getString('id');
        var url = "${classenseigant}";
        var response = await http.get(Uri.parse(url + id_enseigant.toString()));
        debugPrint(response.body.toString());
        var jsonResponse = jsonDecode(response.body);
        print(jsonResponse);
        List<Plan_Class_Session> classelist = [];
        if (response.statusCode == 200) {
          if (jsonResponse["Plan_Class_Session"] != null) {
            jsonResponse["Plan_Class_Session"].forEach((jsonElement) {
              classelist.add(Plan_Class_Session.fromJson(jsonElement));
              print("success load");
            });
            emit(ClassLoaded(classelist));
          }
        } else {
          print("Something error");
          emit(ClassError("error"));
          emit(ClassLoaded(classelist));
        }
      }
    });
  }
}
