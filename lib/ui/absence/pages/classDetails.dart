import 'package:copihass/models/plan_class_session.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClassDetails extends StatefulWidget {
  final Plan_Class_Session classe;
  const ClassDetails({super.key, required this.classe});

  @override
  State<ClassDetails> createState() => _ClassDetailsState();
}

class _ClassDetailsState extends State<ClassDetails> {
  //util
  TextEditingController descriptionController = TextEditingController();
  late Plan_Class_Session classe;

  @override
  void initState() {
    classe = widget.classe;
    super.initState();
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
              Text(classe.code_cl ?? "Null"),
              SizedBox(
                height: 10,
              ),
              Text(classe.code_module ?? "Null"),
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
                title: Text("Ajouter reclamation"),
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
