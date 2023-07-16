import 'package:copihass/config.dart';
import 'package:copihass/models/absence.dart';
import 'package:copihass/ui/absence/bloc/absence_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../reclamation/bloc/reclamation_bloc.dart';

class AbsenceDetails extends StatefulWidget {
  final Absence absence;
  const AbsenceDetails({super.key, required this.absence});

  @override
  State<AbsenceDetails> createState() => _AbsenceDetailsState();
}

class _AbsenceDetailsState extends State<AbsenceDetails> {
  //util
  TextEditingController descriptionController = TextEditingController();
  late Absence absence;

  @override
  void initState() {
    absence = widget.absence;
    super.initState();
  }

  void reclamation() {
    if (descriptionController.text.isNotEmpty) {
      context
          .read<AbsenceBloc>()
          .add(AddReclamationAbsence("description", "module", "etudiant"));
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
            children: [
              SizedBox(
                height: 10,
              ),
              Text(absence.date_absence ?? "Null"),
              SizedBox(
                height: 10,
              ),
              Text(absence.module ?? "Null"),
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
                  height: 256,
                  color: Colors.blue,
                ),
                actionsAlignment: MainAxisAlignment.center,
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Annuler")),
                  ElevatedButton(onPressed: () {}, child: Text("Confirmer"))
                ],
              );
            },
          );
        },
      ),
    );
  }
}
