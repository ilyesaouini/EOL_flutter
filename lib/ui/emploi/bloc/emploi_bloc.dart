import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:copihass/config.dart';
import 'package:copihass/models/emploi.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'emploi_event.dart';
part 'emploi_state.dart';

class EmploiBloc extends Bloc<EmploiEvent, EmploiState> {
  EmploiBloc() : super(EmploiInitial()) {
    on<AddEmploi>((event, emit) async {
      var url = addpdf;
      var response = await http.post(Uri.parse(url));
    });
    on<GetEmploi>(
      (event, emit) async {
        var url = lastemploi;
        var response = await http.get(Uri.parse(url));
        debugPrint(response.body.toString());
        var jsonResponse = jsonDecode(response.body);
        print(jsonResponse);
        List<Emploi> listlastemploi = [];
        if (response.statusCode == 200) {
          if (jsonResponse != null) {
            jsonResponse.forEach((jsonElement) {
              listlastemploi.add(Emploi.fromJson(jsonElement));
              print("success load");
            });
            emit(EmploiLoaded(listlastemploi));
          } else {
            print("Something error");
            emit(EmploiError("error"));
          }
        }
      },
    );
  }
}
