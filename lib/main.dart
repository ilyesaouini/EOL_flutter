import 'package:copihass/locator.dart';
import 'package:copihass/ui/absence/bloc/absence_bloc.dart';
import 'package:copihass/ui/account/Home.dart';
import 'package:copihass/ui/account/bloc/account_bloc.dart';

import 'package:copihass/ui/authentication/bloc/authentication_bloc.dart';
import 'package:copihass/ui/authentication/loginPage.dart';
import 'package:copihass/ui/class/bloc/class_bloc.dart';
import 'package:copihass/ui/note/bloc/note_bloc.dart';
import 'package:copihass/ui/reclamation/bloc/reclamation_bloc.dart';
import 'package:copihass/ui/resultat/bloc/resultat_bloc.dart';
import 'package:copihass/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.globalKey = GlobalKey<NavigatorState>();
  initLocator();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(MyApp(
      prefs: prefs,
      token: prefs.getString('token'),
      key: Constants.globalKey,
      user: User(
        id: prefs.getString('id'),
        nom_prenom: prefs.getString('nom_prenom'),
        nom: prefs.getString('nom'),
        prenom: prefs.getString('prenom'),
        email: prefs.getString('email'),
        image: prefs.getString('image'),
        role: prefs.getString('role'),
      )));
}

class MyApp extends StatefulWidget {
  final prefs;
  final token;
  final User user;
  const MyApp({
    @required this.prefs,
    @required this.token,
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(create: (_) => AuthenticationBloc()),
        BlocProvider<AccountBloc>(
          create: (_) => AccountBloc(),
        ),
        BlocProvider<AbsenceBloc>(
          create: (_) => AbsenceBloc(),
        ),
        BlocProvider<NoteBloc>(
          create: (_) => NoteBloc(),
        ),
        BlocProvider<ReclamationBloc>(
          create: (_) => ReclamationBloc(),
        ),
        BlocProvider<ResultatBloc>(
          create: (_) => ResultatBloc(),
        ),
        BlocProvider<ClassBloc>(
          create: (_) => ClassBloc(),
        )
      ],
      child: MaterialApp(
          title: 'ESPRIT',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.black,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: (widget.token != null &&
                  JwtDecoder.isExpired(widget.token) == false)
              ? Home(widget.prefs)
              : SignInPage()),
    );
  }
}
