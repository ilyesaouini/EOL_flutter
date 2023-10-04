import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../config.dart';
import '../../../locator.dart';
import '../../../models/plan_class_session.dart';

part 'class_event.dart';
part 'class_state.dart';

final classmodel = new Plan_Class_Session();

class ClassBloc extends Bloc<ClassEvent, ClassState> {
  ClassBloc() : super(ClassInitial()) {
    on<ClassEvent>((event, emit) async {
      if (event is GetListClass) {
        emit(ClassLoading());
        String? id_ens = locator.get<SharedPreferences>().getString('id');
        List<Plan_Class_Session> classList = [];
        var url = "${classenseigant + id_ens.toString()}";
        var response = await http.get(Uri.parse(url));
        print(response.request!.url.toString());
        debugPrint(response.body.toString());
        var jsonResponse = jsonDecode(response.body);
        print(jsonResponse);
        if (response.statusCode == 200) {
          if (jsonResponse["Plan_Class_Session"] != null) {
            jsonResponse["Plan_Class_Session"].forEach((jsonElement) {
              classList.add(Plan_Class_Session.fromJson(jsonElement));
            });
            print("succes load list panier");
            emit(ClassLoaded(classList));
          }
        } else {
          print("Something error");
          emit(ClassLoaded(classList));
        }
      }
    });
  }
}
