import 'package:copihass/config.dart';
import 'package:copihass/models/absence.dart';
import 'package:copihass/ui/absence/pages/absence_details.dart';
import 'package:copihass/ui/absence/bloc/absence_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/absencenew.Model.dart';
import '../../account/NavBar.dart';
import '../../authentication/loginPage.dart';

class AbsencePage extends StatefulWidget {
  final SharedPreferences prefs;
  const AbsencePage({required this.prefs, super.key});
  @override
  State<AbsencePage> createState() => _AbsencePageState();
}

class _AbsencePageState extends State<AbsencePage> {
  List<AbsenceNew> absenceList = [];
  TextEditingController descriptionController = TextEditingController();
  @override
  void initState() {
    super.initState();
    context.read<AbsenceBloc>()
      ..add(
        GetAbsenceList(),
      );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AbsenceBloc, AbsenceState>(
      listener: (context, state) {
        if (state is AbsenceLoaded) {
          absenceList = state.responseList;
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
              child: state is AbsenceInitial || state is AbsenceLoading
                  ? AbsenceListLoader()
                  : ListView.builder(
                      itemCount: absenceList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return AbsenceDetails(
                                  absence: absenceList[index]);
                            }));
                          },
                          child: Container(
                            margin: const EdgeInsets.all(8.0),
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 201, 201, 201),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color:
                                        const Color.fromARGB(255, 17, 17, 17),
                                    width: 0.5)),
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Classe : ${absenceList[index].code_cl}",
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Code module: ${absenceList[index].code_module}",
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Module: ${absenceList[index].id_ens}",
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Date: ${absenceList[index].date_seance.toString()}",
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Annee : ${absenceList[index].annee_deb}",
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
        );
      },
    );
  }
}

class AbsenceListLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.red,
      ),
    );
  }
}
