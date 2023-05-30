import 'package:copihass/ui/account/Home.dart';
import 'package:copihass/ui/account/bloc/account_bloc.dart';

import 'package:copihass/ui/authentication/bloc/authentication_bloc.dart';
import 'package:copihass/ui/authentication/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(
      token: prefs.getString('token'),
      user: User(
        id: prefs.getString('id'),
        nom_prenom: prefs.getString('nom_prenom'),
        nom: prefs.getString('nom'),
        prenom: prefs.getString('prenom'),
        email: prefs.getString('email'),
        image: prefs.getString('image'),
      )));
}

class MyApp extends StatelessWidget {
  final token;
  final User user;
  const MyApp({
    @required this.token,
    required this.user,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(create: (_) => AuthenticationBloc()),
        BlocProvider<AccountBloc>(create: (_) => AccountBloc()),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.black,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: (token != null && JwtDecoder.isExpired(token) == false)
              ? Home(user)
              : SignInPage()),
    );
  }
}
