import 'package:copihass/config.dart';
import 'package:copihass/models/absence.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AbsenceDetails extends StatefulWidget {
  final int _id;
  const AbsenceDetails(this._id, {super.key});

  @override
  State<AbsenceDetails> createState() => _AbsenceDetailsState();
}

class _AbsenceDetailsState extends State<AbsenceDetails> {
  //util

  Absence absence = new Absence();
//Get
  Future<bool> getAbsence() async {
    http.Response response =
        await http.get(Uri.parse(absencebyidurl + widget._id.toString()));
    print(response.body);
    absence = Absence.fromJson(response.body);

    return true;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAbsence();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
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
      
    );
  

  }
}
