import 'dart:io';

import 'package:copihass/ui/emploi/bloc/emploi_bloc.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEmploiPage extends StatefulWidget {
  const AddEmploiPage({super.key});

  @override
  State<AddEmploiPage> createState() => _AddEmploiPageState();
}

class _AddEmploiPageState extends State<AddEmploiPage> {
  FilePickerResult? result;
  String? _fileName;
  PlatformFile? pickedfile;
  bool isLoading = false;
  File? fileToDisplay;

  void addemploi(File file) {
    context.read<EmploiBloc>().add(AddEmploi(file));
  }

  Future<void> pickFile() async {
    try {
      setState(() {
        isLoading = true;
      });
      result = await FilePicker.platform
          .pickFiles(allowCompression: false, type: FileType.any);
      if (result != null) {
        _fileName = result!.files.first.name;
        pickedfile = result!.files.first;
        fileToDisplay = File(pickedfile!.path.toString());
        print("File name $_fileName");
        print("File path " + pickedfile!.path.toString());
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: isLoading
                  ? CircularProgressIndicator()
                  : TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(16.0),
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        pickFile();
                      },
                      child: Text("Ajouter fichier")),
            ),
            if (pickedfile != null)
              Center(
                child: SizedBox(
                    height: 50,
                    width: 200,
                    child: Text(result!.files.first.name)),
              ),
            ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Stack(children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color.fromARGB(255, 161, 50, 13),
                            Color.fromARGB(255, 210, 111, 25),
                            Color.fromARGB(255, 245, 108, 66),
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(8.0),
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        if (result != null) {
                          _fileName = result!.files.first.name;
                          pickedfile = result!.files.first;
                          fileToDisplay = File(pickedfile!.path.toString());
                          print("File name $_fileName");
                          print("File path " + pickedfile!.path.toString());
                          addemploi(fileToDisplay!);
                        }
                      },
                      child: Text("Submit")),
                ]))
          ],
        ),
      ),
    ));
  }
}
