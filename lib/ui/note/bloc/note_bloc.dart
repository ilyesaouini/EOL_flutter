import 'dart:convert';

import 'package:copihass/config.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../models/note.dart';

part 'note_event.dart';
part 'note_state.dart';

late SharedPreferences prefs;

Note notemodel = new Note();
void initSharedPref() async {
  prefs = await SharedPreferences.getInstance();
}

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(NoteInitial()) {
    on<GetNoteList>((event, emit) async {
      emit(NoteLoading());

      List<Note> noteList = [];
      var url = "${noteurl}?role=etudiant";
      var response = await http.get(Uri.parse(url));
      print(response.request!.url.toString());
      debugPrint(response.body.toString());
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      if (response.statusCode == 200) {
        if (jsonResponse != null) {
          jsonResponse.forEach((jsonElement) {
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
