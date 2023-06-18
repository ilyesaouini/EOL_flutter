import 'dart:convert';
import 'dart:math';
import 'package:copihass/ui/account/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../applogo.dart';
import '../../config.dart';

import 'bloc/authentication_bloc.dart';
import 'loginPage.dart';
import 'package:http/http.dart' as http;

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? role;

  bool _isNotValidate = false;

  void registerUser() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      context.read<AuthenticationBloc>().add(
          RegistreEvent(emailController.text, passwordController.text, role));
    } else {
      setState(() {
        _isNotValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is RegistreSuccesState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Home(state.prefs)));
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CommonLogo(),
                      HeightBox(10),
                      "CREATE YOUR ACCOUNT".text.size(22).yellow100.make(),
                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            errorStyle: TextStyle(color: Colors.white),
                            errorText:
                                _isNotValidate ? "Enter Proper Info" : null,
                            hintText: "Email",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)))),
                      ).p4().px24(),
                      TextField(
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(Icons.copy),
                              onPressed: () {
                                final data = ClipboardData(
                                    text: passwordController.text);
                                Clipboard.setData(data);
                              },
                            ),
                            prefixIcon: IconButton(
                              icon: Icon(Icons.password),
                              onPressed: () {
                                String passGen = generatePassword();
                                passwordController.text = passGen;
                                setState(() {});
                              },
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            errorStyle: TextStyle(color: Colors.white),
                            errorText:
                                _isNotValidate ? "Enter Proper Info" : null,
                            hintText: "Password",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)))),
                      ).p4().px24(),
                      RadioListTile(
                        title: Text("student"),
                        value: "student",
                        groupValue: role,
                        onChanged: (value) {
                          setState(() {
                            role = value.toString();
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text("instructor"),
                        value: "instructor",
                        groupValue: role,
                        onChanged: (value) {
                          setState(() {
                            role = value.toString();
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text("admin"),
                        value: "admin",
                        groupValue: role,
                        onChanged: (value) {
                          setState(() {
                            role = value.toString();
                          });
                        },
                      ),
                      HStack([
                        GestureDetector(
                          onTap: () => {registerUser()},
                          child: VxBox(
                                  child: "Register"
                                      .text
                                      .white
                                      .makeCentered()
                                      .p16())
                              .gray300
                              .roundedLg
                              .make()
                              .px16()
                              .py16(),
                        ),
                      ]),
                      GestureDetector(
                        onTap: () {
                          print("Sign In");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInPage()));
                        },
                        child: HStack([
                          "Already Registered?".text.make(),
                          " Sign In".text.white.make()
                        ]).centered(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

String generatePassword() {
  String upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  String lower = 'abcdefghijklmnopqrstuvwxyz';
  String numbers = '1234567890';
  String symbols = '!@#\$%^&*()<>,./';

  String password = '';

  int passLength = 20;

  String seed = upper + lower + numbers + symbols;

  List<String> list = seed.split('').toList();

  Random rand = Random();

  for (int i = 0; i < passLength; i++) {
    int index = rand.nextInt(list.length);
    password += list[index];
  }
  return password;
}
