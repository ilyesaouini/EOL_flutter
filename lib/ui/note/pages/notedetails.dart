
import 'package:copihass/ui/note/bloc/note_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';


import '../../../models/note.Model.dart';


class NoteDetails extends StatefulWidget {
  final NoteNew note;
  const NoteDetails({super.key, required this.note});

  @override
  State<NoteDetails> createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {
  //util
  TextEditingController descriptionController = TextEditingController();
  late NoteNew note;

  @override
  void initState() {
    note = widget.note;
    super.initState();
  }

  void reclamation() {
    if (descriptionController.text.isNotEmpty) {
      context.read<NoteBloc>().add(AddReclamationNoteEvent(
          descriptionController.text,
          note.code_module,
          note.id_et,
          note.id_ens));
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
                "Etudiant: ${note.id_et}",
              ),
              const SizedBox(height: 10),
              Text(
                "Module: ${note.code_module}",
              ),
              const SizedBox(height: 10),
              note.absent_cc != "o"
                  ? Text(
                      "Note_cc: ${note.note_cc.toString()}",
                    )
                  : Text("Note_cc: __"),
              const SizedBox(height: 10),
              note.absent_tp != "o"
                  ? Text(
                      "Note: ${note.note_tp.toString()}",
                    )
                  : Text("Note_tp: __"),
              const SizedBox(height: 10),
              note.absent_exam != "o"
                  ? Text(
                      "Note: ${note.note_exam.toString()}",
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
                      showToastSuccess();
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

void showToastSuccess() => Fluttertoast.showToast(
    msg: "Reclamation ajouté",
    fontSize: 16,
    backgroundColor: Colors.grey.shade400,
    textColor: Colors.black,
    gravity: ToastGravity.BOTTOM);
