import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:copihass/config.dart';
import 'package:http/http.dart' as http;
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/absence.dart';
import '../../../models/user.dart';

part 'absence_event.dart';
part 'absence_state.dart';

late SharedPreferences prefs;
final usermodel = new User();
//final absencemodel = new Absence();
void initSharedPref() async {
  prefs = await SharedPreferences.getInstance();
}

class AbsenceBloc extends Bloc<AbsenceEvent, AbsenceState> {
  AbsenceBloc() : super(AbsenceInitial()) {
    on<GetAbsenceList>((event, emit) async {
      if (event is GetAbsenceList) {
        initSharedPref();
        var absence = [];
        var response = await http.get(Uri.parse(absenceurl));
        print(response.body);
        var jsonResponse = jsonDecode(response.body);
        print(jsonResponse);
        if (response.statusCode == 200) {
          absence = jsonResponse['absence'];
          //        absencemodel.id_absence = absence[0];

          prefs.setString("id_absnece", absence[0].toString());
          //      emit(AbsenceLoaded(absencemodel));
        } else {
          print("Something error");
        }
      }
    });
  }
}
