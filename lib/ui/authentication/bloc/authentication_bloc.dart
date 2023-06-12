import 'dart:convert';

import 'package:copihass/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:copihass/config.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import '../../../utils/utils.dart';
import '../../../models/user.dart';
import '../../account/Home.dart';
import '../loginPage.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

late SharedPreferences prefs;
final usermodel = new User();
void initSharedPref() async {
  prefs = await SharedPreferences.getInstance();
}

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) async {
      if (event is LoginEvent) {
        initSharedPref();
        var user = [];
        var reqBody = {
          "email": event.email,
          "password": event.password,
        };

        var response = await http.post(Uri.parse(login),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(reqBody));

        var jsonResponse = jsonDecode(response.body);
        debugPrint(jsonResponse['token'].toString());
        if (response.statusCode == 200) {
          var myToken = jsonResponse['token'];
          user = jsonResponse['user'];
          prefs.setString('token', myToken);
          prefs.setString("id", user[0]);
          usermodel.nom_prenom = user[1];
          usermodel.nom = user[2];
          usermodel.prenom = user[3];
          usermodel.email = user[4];
          usermodel.date_de_naissance = user[5];
          usermodel.image = "";
          usermodel.tel = user[1];
          prefs.setString("lastname", user[2]);
          prefs.setString("email", user[1]);
          prefs.setString("birthdate", user[5]);
          prefs.setString("image", "");
          emit(LoginSuccesState(usermodel));
        } else {
          print('Something went wrong');
        }
      } else if (event is RegistreEvent) {
        var user = [];
        initSharedPref();

        var regBody = {
          "email": event.email,
          "password": event.password,
          "role": event.role
        };

        var response = await http.patch(Uri.parse(registration),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(regBody));
        debugPrint(response.body.toString());
        var jsonResponse = jsonDecode(response.body);

        if (response.statusCode == 200) {
          var myToken = jsonResponse['token'];
          prefs.setString('token', myToken);
          
          user = jsonResponse['user'];
          usermodel.id = user[0];
          usermodel.nom_prenom = user[1];
          usermodel.nom = user[2];
          usermodel.email = user[4];
          usermodel.prenom = user[3];
          usermodel.date_de_naissance = user[5];
          usermodel.tel = user[7];

          // Navigator.push( context, MaterialPageRoute(builder: (context) => Home()));
          emit(RegistreSuccesState(usermodel));
        } else {
          print("SomeThing Went Wrong");
        }
      }
    });
  }
}
