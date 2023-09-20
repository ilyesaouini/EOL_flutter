import 'package:copihass/models/reclamation.dart';
import 'package:copihass/ui/absence/bloc/absence_bloc.dart';
import 'package:copihass/ui/reclamation/bloc/reclamation_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
      print("reponse is ${responeController}");
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
          child: Container(
            margin: const EdgeInsets.only(bottom: 350, top: 100),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.grey.shade600,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: const Color.fromARGB(255, 17, 17, 17), width: 0.5)),
            height: 10,
            width: 20,
            child: Center(
                child: Column(children: [
              SizedBox(
                height: 10,
              ),
              Text("Description: ${reclamation.description}"),
              SizedBox(
                height: 10,
              ),
              (reclamation.reponse == null)
                  ? Text(
                      "Reponse: ${reclamation.reponse}",
                    )
                  : Text("__"),
              SizedBox(
                height: 10,
              ),
              Text("Module: ${reclamation.module}"),
              SizedBox(
                height: 10,
              ),
              Text("Status: ${reclamation.status} "),
            ])),
          )),
    );
  }
}

void showToastSuccess() => Fluttertoast.showToast(
    msg: "Add reponse successfuly",
    fontSize: 16,
    backgroundColor: Colors.grey.shade400,
    textColor: Colors.black,
    gravity: ToastGravity.BOTTOM);
