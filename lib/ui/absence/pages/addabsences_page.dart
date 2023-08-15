import 'package:copihass/config.dart';
import 'package:copihass/models/absence.dart';
import 'package:copihass/models/absencenew.Model.dart';
import 'package:copihass/ui/absence/bloc/absence_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../reclamation/bloc/reclamation_bloc.dart';

class AddAbsenceDetails extends StatefulWidget {
  final AbsenceNew absence;
  const AddAbsenceDetails({super.key, required this.absence});

  @override
  State<AddAbsenceDetails> createState() => _AddAbsenceDetailsState();
}

class _AddAbsenceDetailsState extends State<AddAbsenceDetails> {
  //util
  TextEditingController descriptionController = TextEditingController();
  late AbsenceNew absence;

  @override
  void initState() {
    absence = widget.absence;
    super.initState();
  }

  void reclamation() {
    if (descriptionController.text.isNotEmpty) {
      context.read<AbsenceBloc>().add(AddReclamationAbsenceEvent(
          descriptionController.text, absence.code_cl, absence.id_et));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
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
              child: Container(
                margin: const EdgeInsets.only(bottom: 500, top: 40),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 201, 201, 201),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color.fromARGB(255, 17, 17, 17),
                        width: 0.5)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text("Classe ${absence.code_cl} "),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Module: ${absence.code_module}"),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Text("ssss"),
          )
        ],
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
