import 'package:copihass/models/reclamation.dart';
import 'package:copihass/ui/absence/bloc/absence_bloc.dart';
import 'package:copihass/ui/reclamation/bloc/reclamation_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/user.dart';

class ReclamationDetails extends StatefulWidget {
  final Reclamation reclamation;

  const ReclamationDetails({super.key, required this.reclamation});

  @override
  State<ReclamationDetails> createState() => _ReclamationDetailsState();
}

class _ReclamationDetailsState extends State<ReclamationDetails> {
  //util
  TextEditingController responeController = TextEditingController();
  final _controller = InputDecoration();
  late Reclamation reclamation;

  @override
  void initState() {
    reclamation = widget.reclamation;

    super.initState();
  }

  reponseReclamation(String idrec) {
    if (responeController.text.isNotEmpty) {
      context
          .read<ReclamationBloc>()
          .add(ReponseReclamationEvent(idrec, responeController.text, "done"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(top: 24),
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
              child: Column(children: [
            SizedBox(
              height: 10,
            ),
            Text(reclamation.description ?? "Null"),
            SizedBox(
              height: 10,
            ),
            Text(reclamation.reponse ?? "Null"),
            SizedBox(
              height: 10,
            ),
            Text(reclamation.module ?? "Null"),
            SizedBox(
              height: 10,
            ),
            Text(reclamation.enseignant ?? "Null"),
            SizedBox(
              height: 10,
            ),
            Text(reclamation.status ?? "Null"),
          ]))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showCupertinoDialog(
            context: context,
            barrierDismissible: true,
            builder: (context) {
              return AlertDialog(
                title: Text("Add reponse"),
                content: Container(
                  child: TextField(
                    controller: responeController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "reponse",
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
                      reponseReclamation(reclamation.id_reclamation.toString());
                      Navigator.pop(context);
                      _controller;
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
