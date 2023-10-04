import 'dart:math';
import 'package:copihass/ui/account/Home.dart';
import 'package:copihass/ui/reclamation/pages/reclamation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../applogo.dart';

import 'bloc/authentication_bloc.dart';
import 'loginPage.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? role;
  // show the password or not
  bool _isObscure = true;
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
    showToastSuccess();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is RegistreSuccesState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Home(state.prefs)));
          showToastSuccess();
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
                      "CREER VOTRE COMPTE".text.size(22).yellow100.make(),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.mail),
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
                        obscureText: _isObscure,
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }),
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
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 201, 201, 201),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: const Color.fromARGB(255, 17, 17, 17),
                                width: 0.5)),
                        child: RadioListTile(
                          title: Text("etudiant"),
                          value: "student",
                          groupValue: role,
                          onChanged: (value) {
                            setState(() {
                              role = value.toString();
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 201, 201, 201),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: const Color.fromARGB(255, 17, 17, 17),
                                width: 0.5)),
                        child: RadioListTile(
                          title: Text("enseignant"),
                          value: "instructor",
                          groupValue: role,
                          onChanged: (value) {
                            setState(() {
                              role = value.toString();
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 201, 201, 201),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: const Color.fromARGB(255, 17, 17, 17),
                                width: 0.5)),
                        child: RadioListTile(
                          title: Text("administrateur"),
                          value: "admin",
                          groupValue: role,
                          onChanged: (value) {
                            setState(() {
                              role = value.toString();
                            });
                          },
                        ),
                      ),
                      HStack([
                        GestureDetector(
                          onTap: () => {registerUser()},
                          child: VxBox(
                                  child: "Enregistrer"
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
                          print("Se connecter");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInPage()));
                        },
                        child: HStack([
                          "Avez vous dèjà un compte?".text.make(),
                          " Se connecter".text.white.make()
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

void showToastSuccess() => Fluttertoast.showToast(
    msg: "Compte créer avec succéss",
    fontSize: 16,
    backgroundColor: Colors.grey.shade400,
    textColor: Colors.black,
    gravity: ToastGravity.BOTTOM);
