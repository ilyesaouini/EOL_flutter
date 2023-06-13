import 'dart:convert';
import 'dart:developer';

import 'package:copihass/config.dart';
import 'package:copihass/models/absence.dart';
import 'package:http/http.dart' as http;

class AbsRepo {
  static Future<List<Absence>> fetchAbsence() async {
    var client = http.Client();

    List<Absence> absences = [];
    try {
      var response = await http.get(Uri.parse(absenceurl));
      List result = jsonDecode(response.body);

      for (int i = 0; i < result.length; i++) {
        Absence absence = Absence.fromMap(result[i] as Map<String, dynamic>);
        absences.add(absence);
      }
      return absences;
    } catch (e) {
      print('object');
      log(e.toString());
      return [];
    }
  }
}
