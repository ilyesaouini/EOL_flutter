import 'dart:convert';

import 'package:copihass/config.dart';
import 'package:copihass/models/absence.dart';
import 'package:http/http.dart';

class AbsenceRepository {
  getAbsences() async {
    Response response = await get(Uri.parse(absenceurl));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body)['data'];
      return result.map(((e) => Absence.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
