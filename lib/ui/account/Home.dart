
import 'package:copihass/models/role.dart';
import 'package:copihass/ui/absence/pages/absence_admin.dart';
import 'package:copihass/ui/absence/pages/absence_page.dart';

import 'package:copihass/ui/account/NavBar.dart';
import 'package:copihass/ui/account/profile_page.dart';
import 'package:copihass/ui/emploi/pages/addemploi.dart';
import 'package:copihass/ui/emploi/pages/emploi.dart';

import 'package:copihass/ui/note/pages/note.dart';

import 'package:copihass/ui/reclamation/pages/reclamation.dart';

import 'package:copihass/ui/resultat/bloc/pages/resultat.dart';
import 'package:copihass/ui/resultat/bloc/pages/resultatadmin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:copihass/ui/authentication/loginPage.dart';
import 'package:flutter/material.dart';


import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user.dart';

import '../absence/pages/absence_enseignant.dart';
import '../note/pages/note_enseignant.dart';
import '../reclamation/pages/reclamation_admin.dart';
import '../reclamation/pages/reclamation_enseignant.dart';
import 'bloc/account_bloc.dart';
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
  User user = User();
  Role role = Role();
  @override
  void initState() {
    user = User(
      id: widget.prefs.getString('id'),
      role: widget.prefs.getString('role'),
    );
    role = Role(
      role: widget.prefs.getString('role'),
    );
    print("awaha el role : " + role.role.toString());
    if (role.role == "01") {
      print("role is " + user.role.toString());
      bodyWidgetsList = [
        ProfilePage(prefs: widget.prefs),
        NotePage(prefs: widget.prefs),
        AbsencePage(prefs: widget.prefs),
        ResultatPage(prefs: widget.prefs),
        EmploiPage(prefs: widget.prefs),
        ReclamationPage(prefs: widget.prefs),
      ];
    } else if (role.role == "02") {
      print("role is " + user.role.toString());
      bodyWidgetsList = [
        ProfilePage(prefs: widget.prefs),
        NoteEnseignantPage(prefs: widget.prefs),
        AbsenceEnseignantPage(prefs: widget.prefs),
        ResultatPage(prefs: widget.prefs),
        EmploiPage(prefs: widget.prefs),
        ReclamationEnseignantPage(prefs: widget.prefs),
      ];
    } else {
      print("role is " + user.role.toString());
      bodyWidgetsList = [
        ProfilePage(prefs: widget.prefs),
        NotePage(prefs: widget.prefs),
        AbsenceAdminPage(prefs: widget.prefs),
        ResultatAdminPage(prefs: widget.prefs),
        AddEmploiPage(),
        ReclamationAdminPage(prefs: widget.prefs),
      ];
    }
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
