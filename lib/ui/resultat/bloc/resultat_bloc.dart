import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../config.dart';
import '../../../models/inscription.dart';
import '../../../models/user.dart';

part 'resultat_event.dart';
part 'resultat_state.dart';






late SharedPreferences prefs;
final usermodel = new User();
Inscription absencemodel = new Inscription();
//final absencemodel = new Absence();
void initSharedPref() async {
  prefs = await SharedPreferences.getInstance();
}






class ResultatBloc extends Bloc<ResultatEvent, ResultatState> {
  ResultatBloc() : super(ResultatInitial()) {
    on<GetResultatList>((event, emit) async {
      if (event is GetResultatList) {
        initSharedPref();
        
        List<Inscription> absenceList = [];
        var url = "${inscriptionurl}?role=etudiant";
        var response = await http.get(Uri.parse(url));
        print(response.request!.url.toString());
        debugPrint(response.body.toString());
        var jsonResponse = jsonDecode(response.body);
        print(jsonResponse);
        if (response.statusCode == 200) {
          if (jsonResponse != null) {
            jsonResponse.forEach((jsonElement) {
              absenceList.add(Inscription.fromJson(jsonElement));
            });
          }

          emit(ResultatLoaded(absenceList));
        } else {
          print("Something error");
          emit(ResultatLoaded(absenceList));
        }
      }
    });
  }
}
