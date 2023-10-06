import 'package:copihass/models/autorisation.dart';
import 'package:copihass/ui/resultat/bloc/resultat_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultatAdminPage extends StatefulWidget {
  final SharedPreferences prefs;
  const ResultatAdminPage({required this.prefs, super.key});

  @override
  State<ResultatAdminPage> createState() => _ResultatAdminPageState();
}

class _ResultatAdminPageState extends State<ResultatAdminPage> {
  List<Autorisation> autorisationList = [];

  void initState() {
    super.initState();
    context.read<ResultatBloc>().add(GetAutorisationList());
  }

  void autoriser() {
    if (autorisationList[0].ischeckednote == false) {
      autorisationList[0].etat_note = 0;
    } else {
      autorisationList[0].etat_note = 1;
    }
    if (autorisationList[0].ischeckedresultat == false) {
      autorisationList[0].etat_resultat = 0;
    } else {
      autorisationList[0].etat_resultat = 1;
    }
    context.read<ResultatBloc>().add(AddAutorisation(
        autorisationList[0].etat_note, autorisationList[0].etat_resultat));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResultatBloc, ResultatState>(
      listener: (context, state) {
        if (state is AutorisationLoaded) {
          autorisationList = state.responseList;
        }
      },
      builder: (context, state) {
        return Container(
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
          child: state is ResultatInitial || state is AUtorisationLoading
              ? ResultatListLoader()
              : ListView.builder(
                  itemCount: autorisationList.length,
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 201, 201, 201),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color:
                                          const Color.fromARGB(255, 17, 17, 17),
                                      width: 0.5)),
                              child: Row(
                                children: [
                                  Text("Etat note: "),
                                  Checkbox(
                                    checkColor: Colors.black,
                                    focusColor: Colors.black,
                                    hoverColor: Colors.black,
                                    activeColor: Colors.red,
                                    value:
                                        autorisationList[index].ischeckednote,
                                    onChanged: (bool? value) {
                                      autorisationList[index].ischeckednote =
                                          !autorisationList[index]
                                              .ischeckednote;

                                      setState(() {});
                                    },
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 201, 201, 201),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color:
                                          const Color.fromARGB(255, 17, 17, 17),
                                      width: 0.5)),
                              child: Row(
                                children: [
                                  Text("Etat resultat: "),
                                  Checkbox(
                                    checkColor: Colors.black,
                                    focusColor: Colors.black,
                                    hoverColor: Colors.black,
                                    activeColor: Colors.red,
                                    value: autorisationList[index]
                                        .ischeckedresultat,
                                    onChanged: (bool? value) {
                                      autorisationList[index]
                                              .ischeckedresultat =
                                          !autorisationList[index]
                                              .ischeckedresultat;
                                      setState(() {});
                                    },
                                  )
                                ],
                              ),
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.grey, // Background color
                                ),
                                onPressed: () {
                                  autoriser();
                                },
                                child: Text("Autorisé"))
                          ],
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}

class ResultatListLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.red,
      ),
    );
  }
}
