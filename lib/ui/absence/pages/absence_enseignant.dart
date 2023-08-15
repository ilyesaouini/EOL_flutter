import 'package:copihass/config.dart';
import 'package:copihass/models/absence.dart';
import 'package:copihass/models/absencenew.Model.dart';
import 'package:copihass/models/plan_class_session.dart';
import 'package:copihass/ui/absence/pages/absence_details.dart';
import 'package:copihass/ui/absence/bloc/absence_bloc.dart';
import 'package:copihass/ui/absence/pages/addabsences_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/user.dart';
import '../../account/NavBar.dart';
import '../../authentication/loginPage.dart';
import 'classDetails.dart';

class AbsenceEnseignantPage extends StatefulWidget {
  final SharedPreferences prefs;
  const AbsenceEnseignantPage({required this.prefs, super.key});
  @override
  State<AbsenceEnseignantPage> createState() => _AbsenceEnseignantPageState();
}

class _AbsenceEnseignantPageState extends State<AbsenceEnseignantPage> {
  List<AbsenceNew> classList = [];
  User user = User();
  TextEditingController descriptionController = TextEditingController();
  @override
  void initState() {
    super.initState();
    user = User(
      id: widget.prefs.getString('id'),
      role: widget.prefs.getString('role'),
    );
    context.read<AbsenceBloc>().add(
          GetAbsenceByEnseignant(idEns: user.id),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AbsenceBloc, AbsenceState>(
      listener: (context, state) {
        if (state is AbsenceLoaded) {
          classList = state.responseList;
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
              child: state is AbsenceInitial || state is ClassLoading
                  ? AbsenceListLoader()
                  : ListView.builder(
                      itemCount: classList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                             Navigator.push(context, MaterialPageRoute(
                                 builder: (BuildContext context) {
                               return AddAbsenceDetails(absence: classList[index]);
                             }));
                          },
                          child: Container(
                            margin: const EdgeInsets.all(8.0),
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade600,
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
                                    "Classe: ${classList[index].code_cl}",
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Module: ${classList[index].code_module}",
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
