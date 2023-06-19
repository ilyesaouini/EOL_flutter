import 'dart:convert';

import 'package:copihass/config.dart';
import 'package:copihass/models/note.dart';
import 'package:http/http.dart';

class NoteRepository{

   getAbsences() async {
    Response response = await get(Uri.parse(noteurl));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body)['data'];
      return result.map(((e) => Note.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}