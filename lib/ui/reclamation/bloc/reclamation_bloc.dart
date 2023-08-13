import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:copihass/config.dart';
import 'package:copihass/models/reclamation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'reclamation_event.dart';
part 'reclamation_state.dart';

class ReclamationBloc extends Bloc<ReclamationEvent, ReclamationState> {
  ReclamationBloc() : super(ReclamationInitial()) {
    
    on<GetReclamationList>((event, emit) async {
        emit(ReclamationLoading());
        List<Reclamation> reclamationList = [];
        var url = "${reclamationurl}";
        var response = await http.get(Uri.parse(url));
        print(response.request!.url.toString());
        debugPrint(response.body.toString());
        var jsonResponse = jsonDecode(response.body);
        print(jsonResponse);
        if (response.statusCode == 200) {
          if (jsonResponse != null) {
            jsonResponse.forEach((jsonElement) {
              reclamationList.add(Reclamation.fromJson(jsonElement));
            });
          }

          emit(ReclamationLoaded(reclamationList));
        } else {
          print("Something error");
          emit(ReclamationLoaded(reclamationList));
        }
      
    });
    on<AddReclamationSimpleEvent>((event, emit) async {
        var reqBody = {"etudiant": event.id, "description": event.description};

        var response = await http.post(Uri.parse(addsimplereclamationurl),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(reqBody));
        if (response.statusCode == 200) {
          emit(AddReclamationSuccesState());
        }
    });
    on<ReponseReclamationEvent>((event, emit) async {
            var reqBody = {
              "id_reclamation": event.id,
              "reponse": event.reponse,
              "status": "done"
            };
            var response = await http.patch(Uri.parse(reponsereclamationurl),
                headers: {"Content-Type": "application/json"},
                body: jsonEncode(reqBody));
            debugPrint(response.body.toString());
            print(response.body);
            if (response.statusCode == 200) {
              emit(ReponseReclamationSuccesState());
            }
        });

  }
}
