import 'dart:convert';
import 'dart:io';
import 'package:copihass/ui/absence/absence_page.dart';
import 'package:copihass/ui/absence/bloc/absence_bloc.dart';
import 'package:copihass/ui/account/NavBar.dart';
import 'package:copihass/ui/account/profile_page.dart';
import 'package:copihass/ui/emploi/emploi.dart';
import 'package:copihass/ui/note/bloc/note_bloc.dart';
import 'package:copihass/ui/note/note.dart';
import 'package:copihass/ui/reclamation/bloc/reclamation_bloc.dart';
import 'package:copihass/ui/reclamation/reclamation.dart';
import 'package:copihass/ui/resultat/bloc/resultat_bloc.dart';
import 'package:copihass/ui/resultat/resultat.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:copihass/ui/authentication/loginPage.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user.dart';

import 'bloc/account_bloc.dart';
import 'components/profile_menu.dart';

class Home extends StatefulWidget {
  final SharedPreferences prefs;
  const Home(this.prefs, {super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedItemPosition = 0;
  List<Widget> bodyWidgetsList = [];

  @override
  void initState() {
    bodyWidgetsList = [
      ProfilePage(prefs: widget.prefs),
      NotePage(prefs: widget.prefs),
      AbsencePage(prefs: widget.prefs),
      ResultatPage(prefs: widget.prefs),
      EmploiPage(),
      ReclamationPage(prefs: widget.prefs),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: BlocConsumer<AccountBloc, AccountState>(
        listener: (context, state) {
          if (state is OnDrawerIemSelectedState) {
            selectedItemPosition = state.selectedPosition;
          }
        },
        builder: (context, state) {
          return Scaffold(
            key: _scaffoldKey,
            drawer: DrawerWidget(
                selectedItemPosition: selectedItemPosition,
                scaffoldKey: _scaffoldKey),
            appBar: AppBar(
                backgroundColor: Color.fromARGB(255, 236, 26, 26),
                title: Text(
                  "ESPRIT",
                ),
                actions: <Widget>[
                  IconButton(
                      onPressed: () {
                        widget.prefs.remove("token");
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => SignInPage())),
                            (route) => false);
                      },
                      icon: Icon(Icons.logout_outlined))
                ]),
            body: Container(
              width: width,
              alignment: Alignment.topCenter,
              color: Colors.white,
              child: bodyWidgetsList[selectedItemPosition],
            ),
          );
        },
      ),
    );
  }

}