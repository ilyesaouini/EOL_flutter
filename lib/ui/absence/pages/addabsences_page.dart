import 'package:copihass/config.dart';
import 'package:copihass/models/absence.dart';
import 'package:copihass/models/absencenew.Model.dart';
import 'package:copihass/ui/absence/bloc/absence_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 0,
        titleSpacing: 0,
        backgroundColor: Color.fromARGB(255, 236, 26, 26).withOpacity(0.9),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color.fromARGB(255, 236, 26, 26),
        ),
        title: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(top: 0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 236, 26, 26),
                  Color.fromARGB(255, 88, 87, 86)
                ],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                stops: [0.0, 0.8],
                tileMode: TileMode.mirror),
          ),
          child: Container(
            height: 64,
            margin: const EdgeInsets.only(bottom: 0, top: 0),
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center ,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Classe ${absence.code_cl} ",
                ),
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
      body: Column(
        children: [
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