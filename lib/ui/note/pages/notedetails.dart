import 'package:copihass/config.dart';
import 'package:copihass/models/absence.dart';
import 'package:copihass/ui/absence/bloc/absence_bloc.dart';
import 'package:copihass/ui/note/bloc/note_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../models/note.dart';
import '../../reclamation/bloc/reclamation_bloc.dart';

class NoteDetails extends StatefulWidget {
  final Note note;
  const NoteDetails({super.key, required this.note});

  @override
  State<NoteDetails> createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {
  //util
  TextEditingController descriptionController = TextEditingController();
  late Note note;

  @override
  void initState() {
    note = widget.note;
    super.initState();
  }

  void reclamation() {
    if (descriptionController.text.isNotEmpty) {
      context.read<NoteBloc>().add(AddReclamationNoteEvent(
          descriptionController.text, note.module, note.etudiant));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(top: 64),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 236, 26, 26),
                Color.fromARGB(255, 88, 87, 86)
              ],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomCenter,
              stops: [0.0, 0.8],
              tileMode: TileMode.mirror),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Etudiant: ${note.etudiant}",
              ),
              const SizedBox(height: 10),
              Text(
                "Module: ${note.module}",
              ),
              const SizedBox(height: 10),
              note.abs_cc == "o"
                  ? Text(
                      "Note_cc: ${note.note_cc.toString()}",
                    )
                  : Text("Note_cc: __"),
              const SizedBox(height: 10),
              note.abs_tp == "o"
                  ? Text(
                      "Note: ${note.note_tp.toString()}",
                    )
                  : Text("Note_tp: __"),
              const SizedBox(height: 10),
              note.abs_examen == "o"
                  ? Text(
                      "Note: ${note.note_examen.toString()}",
                    )
                  : Text("Note_tp: __"),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showCupertinoDialog(
            context: context,
            barrierDismissible: true,
            builder: (context) {
              return AlertDialog(
                title: Text("Add reclamation"),
                content: Container(
                  child: TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "description",
                        hoverColor: Colors.red),
                  ),
                ),
                actionsAlignment: MainAxisAlignment.center,
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // Background color
                      ),
                      child: Text("Annuler")),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey, // Background color
                    ),
                    onPressed: () {
                      reclamation();
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Confirmer",
                    ),
                  )
                ],
              );
            },
          );
        },
        child: Icon(Icons.add_alert_sharp),
        backgroundColor: Colors.grey,
      ),
    );
  }
}
