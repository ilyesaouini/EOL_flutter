import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:copihass/config.dart';
import 'package:copihass/locator.dart';
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

final usermodel = new User();
Absence absencemodel = new Absence();
AbsenceNew absencenewmodel = new AbsenceNew();
//final absencemodel = new Absence();

class AbsenceBloc extends Bloc<AbsenceEvent, AbsenceState> {
  AbsenceBloc() : super(AbsenceInitial()) {
    on<GetAbsenceList>((event, emit) async {
      emit(AbsenceLoading());

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
    });
    on<AddReclamationAbsenceEvent>(
      (event, emit) async {
        var url = "${addreclamationurl}?role=etudiant";
        var response = await http.post(Uri.parse(url), body: {
          'description': event.description,
          'module': event.module,
          'etudiant': event.etudiant
        });
      },
    );

    on<GetAbsenceByEtudiant>(((event, emit) async {
      emit(AbsenceLoading());

      String? id_etudiant = locator.get<SharedPreferences>().getString('id');
      String? role = locator.get<SharedPreferences>().getString('role');
      print("the ros is ${role}");
      var url = absenceetudiant;
      var response = await http.get(Uri.parse(url + id_etudiant.toString()));
      debugPrint(response.body.toString());
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      List<AbsenceNew> absenceList = [];
      if (response.statusCode == 200) {
        if (jsonResponse['absence'] != null) {
          jsonResponse['absence'].forEach((jsonElement) {
            absenceList.add(AbsenceNew.fromJson(jsonElement));
          });
        }

        emit(AbsenceLoaded(absenceList));
      } else {
        print("Something error");
        emit(AbsenceLoaded(absenceList));
      }
    }));

    on<GetAbsenceByEnseignant>(((event, emit) async {
      emit(ClassLoading());
      String? id_enseigant = locator.get<SharedPreferences>().getString('id');
      var url = "${classenseigant}";
      var response = await http.get(Uri.parse(url + id_enseigant.toString()));
      debugPrint(response.body.toString());
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      List<Plan_Class_Session> classelist = [];
      if (response.statusCode == 200) {
        if (jsonResponse != null) {
          jsonResponse.forEach((jsonElement) {
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
    }));

    on<GetListEtudiant>(((event, emit) async {
      emit(EtdiantLoading());
      var url = "${listetudiant}";
      var response = await http.get(Uri.parse(url + '/' + event.code_cl.toString()));
      debugPrint(response.body.toString());
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      List<User> etudiant = [];
      if (response.statusCode == 200) {
        if (jsonResponse['users'] != null) {
          jsonResponse['users'].forEach(
              (jsonElement) => etudiant.add(User.fromJson(jsonElement)));
          print("success load");
          emit(EtduiantLoaded(etudiant));
        }
      } else {
        print("something error");
        emit(EtudiantError("error"));
        emit(EtduiantLoaded(etudiant));
      }
    }));
  }
}
/*
else if (event is GetAbsenceByEtudiant) {
        emit(AbsenceLoading());
        String? id_etudiant = prefs.getString('id');
        var url = "${absenceetudiant}";
        var response = await http.get(Uri.parse(url + id_etudiant.toString()));
        debugPrint(response.body.toString());
        var jsonResponse = jsonDecode(response.body);
        print(jsonResponse);
        List<AbsenceNew> absenceList = [];
        if (response.statusCode == 200) {
          if (jsonResponse != null) {
            jsonResponse["absence"].forEach((jsonElement) {
              absenceList.add(AbsenceNew.fromJson(jsonElement));
            });
          }

          emit(AbsenceLoaded(absenceList));
        } else {
          print("Something error");
          emit(AbsenceLoaded(absenceList));
        }
      }
*/