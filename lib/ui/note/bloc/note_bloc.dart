import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:copihass/config.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../models/note.dart';
import '../../../models/user.dart';

part 'note_event.dart';
part 'note_state.dart';

late SharedPreferences prefs;
final usermodel = new User();

Note notemodel = new Note();

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(NoteInitial()) {
    on<GetNoteList>((event, emit) async {
      List<Note> noteList = [];
      var url = "${noteurl}?role=etudiant";
      var response = await http.get(Uri.parse(url));
      print(response.request!.url.toString());
      debugPrint(response.body.toString());
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      if (response.statusCode == 200) {
        if (jsonResponse["absence"] != null) {
          jsonResponse["absence"].forEach((jsonElement) {
            noteList.add(Note.fromJson(jsonElement));
          });
        }

        emit(NoteLoaded(noteList));
      } else {
        print("Something error");
        emit(NoteLoaded(noteList));
      }
    });
  }

 
}
