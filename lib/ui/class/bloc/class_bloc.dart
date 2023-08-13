import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:copihass/models/classe.dart';
import 'package:copihass/ui/absence/bloc/absence_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../config.dart';

part 'class_event.dart';
part 'class_state.dart';
late SharedPreferences prefs;
final classmodel =new Classe();
class ClassBloc extends Bloc<ClassEvent, ClassState> {
  ClassBloc() : super(ClassInitial()) {
    on<ClassEvent>((event, emit) async {
      if(event is GetListClass){
         emit(ClassLoading());

        initSharedPref();

        List<Classe> classList = [];
        var url = "${classeurl}?role=etudiant";
        var response = await http.get(Uri.parse(url));
        print(response.request!.url.toString());
        debugPrint(response.body.toString());
        var jsonResponse = jsonDecode(response.body);
        print(jsonResponse);
        if (response.statusCode == 200) {
          if (jsonResponse["absence"] != null) {
            jsonResponse["absence"].forEach((jsonElement) {
              classList.add(Classe.fromJson(jsonElement));
            });
          }

          emit(ClassLoaded(classList));
        } else {
          print("Something error");
          emit(ClassLoaded(classList));
        }
      }
      
    });
  }
  
  
}
