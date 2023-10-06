import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:copihass/models/autorisation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../config.dart';
import '../../../locator.dart';
import '../../../models/inscription.dart';
import '../../../models/user.dart';

part 'resultat_event.dart';
part 'resultat_state.dart';

late SharedPreferences prefs;
final usermodel = new User();
Inscription absencemodel = new Inscription();

class ResultatBloc extends Bloc<ResultatEvent, ResultatState> {
  ResultatBloc() : super(ResultatInitial()) {
    on<GetResultatList>((event, emit) async {
      emit(ResultatLoading());

      String? id_etudiant = locator.get<SharedPreferences>().getString('id');

      List<Inscription> absenceList = [];
      var url = "${inscriptionurl}";
      var response = await http.get(Uri.parse(url + id_etudiant.toString()));
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
    });

    on<AddAutorisation>((event, emit) async {
      var reqBody = {
        "etat_note": event.etat_note,
        "etat_resultat": event.etat_resultat
      };
      var response = await http.patch(Uri.parse(addautorisation),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(reqBody));
      debugPrint(response.toString());
      print(response.body);
      if (response.statusCode == 200) {
        emit(AutorisationSuccesState());
      }
    });
    on<GetAutorisationList>(
      (event, emit) async {
        List<Autorisation> listAutorisation = [];
        var url = "${autorisation}";
        var response = await http.get(Uri.parse(url));
        print(response.request!.url.toString());
        debugPrint(response.body.toString());
        var jsonResponse = jsonDecode(response.body);
        print(jsonResponse);
        if (response.statusCode == 200) {
          if (jsonResponse != null) {
            jsonResponse.forEach((jsonElement) {
              listAutorisation.add(Autorisation.fromJson(jsonElement));
            });
          }
          emit(AutorisationLoaded(listAutorisation));
        } else {
          print("Something error");
          emit(AutorisationLoaded(listAutorisation));
        }
      },
    );
  }
}
