

import 'package:copihass/ui/account/Home.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:copihass/ui/authentication/bloc/authentication_bloc.dart';

import 'package:copihass/ui/authentication/registration.dart';
import 'package:copihass/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../applogo.dart';


class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // show the password or not
  bool _isObscure = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? role;
  bool _isNotValidate = false;
  late SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSharedPref();
/*
    emailController.text = "mohamedilyess.aouini@esprit.tn";
    passwordController.text = "123456";
 */
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  void loginUser() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      context
          .read<AuthenticationBloc>()
          .add(LoginEvent(emailController.text, passwordController.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is LoginSuccesState) {
          showToastSuccess();
          Utils.openPageAndClearStack(Home(state.sharedPreferences), context);
        } else {
          showToastError();
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CommonLogo(),
                      const HeightBox(10),
                      "Se connecter".text.size(22).yellow100.make(),
                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.mail),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Email",
                            errorText:
                                _isNotValidate ? "Enter Proper Info" : null,
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)))),
                      ).p4().px24(),
                      TextField(
                        obscureText: _isObscure,
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Password",
                            errorText:
                                _isNotValidate ? "Enter Proper Info" : null,
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)))),
                      ).p4().px24(),
                      GestureDetector(
                        onTap: () {
                          loginUser();
                          //showToastSuccess();
                        },
                        child: HStack([
                          VxBox(child: "LogIn".text.white.makeCentered().p16())
                              .gray300
                              .roundedLg
                              .make(),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Registration()));
              },
              child: Container(
                  height: 25,
                  color: Colors.redAccent,
                  child: Center(
                      child: "Créer nouveau compte..! Inscription"
                          .text
                          .white
                          .makeCentered())),
            ),
          ),
        );
      },
    );
  }

  void showToastSuccess() => Fluttertoast.showToast(
      msg: "Login success",
      fontSize: 16,
      backgroundColor: Colors.grey.shade400,
      textColor: Colors.black,
      gravity: ToastGravity.BOTTOM);

  void showToastError() => Fluttertoast.showToast(
      msg: "Check mail and password please",
      fontSize: 16,
      backgroundColor: Colors.grey.shade400,
      textColor: Colors.black,
      gravity: ToastGravity.BOTTOM);
}
