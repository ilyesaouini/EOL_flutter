import 'dart:convert';

import 'package:copihass/config.dart';
import 'package:copihass/models/reclamation.dart';
import 'package:http/http.dart';

class ReclamationRepository{

   getAbsences() async {
    Response response = await get(Uri.parse(reclamationurl));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body)['data'];
      return result.map(((e) => Reclamation.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}