import 'dart:convert';
import 'dart:typed_data';

import 'package:copihass/models/emploi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Affichage extends StatefulWidget {
  final Emploi emploi;
  final Uint8List base64;
  const Affichage({required this.emploi, required this.base64, super.key});

  @override
  State<Affichage> createState() => _AffichageState();
}

class _AffichageState extends State<Affichage> {
  late Emploi emp;
  var _base64pdf;
  void convert() {
    _base64pdf = base64Decode(emp.emploi!);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
