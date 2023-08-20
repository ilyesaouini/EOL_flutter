import 'dart:convert';

import 'package:copihass/config.dart';
import 'package:copihass/locator.dart';
import 'package:copihass/models/plan_class_session.dart';
import 'package:copihass/models/user.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../models/note.Model.dart';
import '../../../models/note.dart';

part 'note_event.dart';
part 'note_state.dart';


NoteNew notemodel = new NoteNew();
User? user = new User();



class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(NoteInitial()) {
    on<GetNoteList>((event, emit) async {
      emit(NoteLoading());

      List<NoteNew> noteList = [];
      var url = "${listnote}";
      var response = await http.get(Uri.parse(url));
      print(response.request!.url.toString());
      debugPrint(response.body.toString());
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      if (response.statusCode == 200) {
        print("ssssssss");
        if (jsonResponse != null) {
          jsonResponse.forEach((jsonElement) {
            noteList.add(NoteNew.fromJson(jsonElement));
          });
        }

        emit(NoteLoaded(noteList));
      } else {
        print("Something error");
        emit(NoteLoaded(noteList));
      }
    });
    on<AddReclamationNoteEvent>(
      (event, emit) async {
        var url = "${addreclamationurl}?role=etudiant";
        var response = await http.post(Uri.parse(url), body: {
          'description': event.description,
          'module': event.module,
          'etudiant': event.etudiant
        });
      },
    );

    on<GetEtudiantNotes>(
      (event, emit) async {
        emit(NotesEtduiantLoading());
        String? id_etudiant = user?.id.toString();
        var url = "${listnote}";
        var response = await http.get(Uri.parse(url + id_etudiant!));
        debugPrint(response.body.toString());
        var jsonResponse = jsonDecode(response.body);
        print(jsonResponse);
        List<NoteNew> notes = [];
        if (response.statusCode == 200) {
          if (jsonResponse != null) {
            jsonResponse.forEach((jsonElement) {
              notes.add(NoteNew.fromJson(jsonElement));
              print("succes load");
            });
            emit(NoteEtudiantLoaded(notes));
          }
        } else {
          print("SOmething error");
          emit(NoteError("error"));
          emit(NoteEtudiantLoaded(notes));
        }
      },
    );
    on<GetPanierList>((event, emit) async {
      emit(PanierLoading());
      String? id_ens = locator.get<SharedPreferences>().getString('id');
      var url = "${classenseigant}";
      var response = await http.get(Uri.parse(url + id_ens.toString()));
      debugPrint(response.body.toString());
      var jsonResponse = jsonDecode(response.body);
      List<Plan_Class_Session> panier = [];

      if (jsonResponse["Plan_Class_Session"] != null) {
        jsonResponse["Plan_Class_Session"].forEach((jsonElement) {
          panier.add(Plan_Class_Session.fromJson(jsonElement));
          print("success load panier");
        });
        emit(PanierLoaded(panier));
      } else {
        print("Something error");
        emit(PanierErrorState("error"));
        emit(PanierLoaded(panier));
      }
    });
  }
}
