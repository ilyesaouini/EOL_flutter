import 'dart:io';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddEmploiPage extends StatefulWidget {
  const AddEmploiPage({super.key});

  @override
  State<AddEmploiPage> createState() => _AddEmploiPageState();
}

class _AddEmploiPageState extends State<AddEmploiPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
          child: ElevatedButton(
        onPressed: () {
          UploadPdf();
        },
        child: Text("Ajouter un emploi"),
      )),
    ));
  }
}

Future UploadPdf() async {
  var dio = Dio();
  //FilePickerResult? result = await FilePicker.platform.pickFiles();
/*
  if (result != null) {
    var myfile = file(result.files.single.path ?? "");
    String filename = myfile.path.split('/').last;
    String filePath = myfile.path;
    FormData data = FormData.fromMap({
      'x-api-key': 'apikey',
      'file': await MultipartFile.fromFile(filePath, filename: filename)
    });
  }
  */
}
