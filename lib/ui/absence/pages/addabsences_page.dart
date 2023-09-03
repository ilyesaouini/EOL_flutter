import 'package:copihass/config.dart';

import 'package:copihass/models/plan_class_session.dart';
import 'package:copihass/models/user.dart';
import 'package:copihass/ui/absence/bloc/absence_bloc.dart';
import 'package:copihass/ui/absence/pages/absence_admin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_button/group_button.dart';

class AddAbsenceDetails extends StatefulWidget {
  final Plan_Class_Session class_session;
  const AddAbsenceDetails({super.key, required this.class_session});

  @override
  State<AddAbsenceDetails> createState() => _AddAbsenceDetailsState();
}

class _AddAbsenceDetailsState extends State<AddAbsenceDetails> {
  //util
  TextEditingController descriptionController = TextEditingController();
  late Plan_Class_Session absence;
  List<User> listEtudiant = [];
  int _indexgroup = 0;
  @override
  void initState() {
    absence = widget.class_session;
    super.initState();
    context
        .read<AbsenceBloc>()
        .add(GetListEtudiant(code_cl: widget.class_session.code_cl.toString()));
  }

  void addAbsence(String? id) {
    context.read<AbsenceBloc>().add(AddAbsence(
        '193JMT0325',
        absence.code_cl,
        absence.code_module,
        absence.annee_deb,
        _indexgroup,
        DateTime.now().toString(),
        DateTime.now().toString(),
        absence.id_ens));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AbsenceBloc, AbsenceState>(
      listener: (context, state) {
        if (state is EtduiantLoaded) {
          listEtudiant = state.responseList;
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leadingWidth: 0,
            titleSpacing: 0,
            backgroundColor: Color.fromARGB(255, 236, 26, 26).withOpacity(0.9),
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Color.fromARGB(255, 236, 26, 26),
            ),
            title: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.only(top: 0),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 236, 26, 26),
                      Color.fromARGB(255, 88, 87, 86)
                    ],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    stops: [0.0, 0.8],
                    tileMode: TileMode.mirror),
              ),
              child: Container(
                height: 64,
                margin: const EdgeInsets.only(bottom: 0, top: 0),
                padding: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Classe ${absence.code_cl} ",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Module: ${absence.code_module}"),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        for (var i = 0; i < listetudiant.length; i++) {}
                      },
                      child: Text('Select All'),
                    )
                  ],
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Seance:  '),
                    GroupButton(
                      options: GroupButtonOptions(selectedColor: Colors.red),
                      onSelected: (value, index, isSelected) => {
                        if (index == 0)
                          {
                            _indexgroup = index + 1,
                            print("index groupe" + _indexgroup.toString())
                          }
                        else if (index == 1)
                          {
                            _indexgroup = index + 1,
                            print("index groupe" + _indexgroup.toString())
                          }
                        else if (index == 2)
                          {
                            _indexgroup = index + 1,
                            print("index groupe" + _indexgroup.toString())
                          }
                        else if (index == 3)
                          {
                            _indexgroup = index + 1,
                            print("index groupe" + _indexgroup.toString())
                          }
                      },
                      buttons: ['9:00', '10:45', '14:00', '15:45'],
                    ),
                  ],
                ),
                Container(
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
                    child: state is AbsenceInitial || state is EtdiantLoading
                        ? AbsenceListLoader()
                        : ListView.builder(
                            itemCount: listEtudiant.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.all(8.0),
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade600,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 17, 17, 17),
                                        width: 0.5)),
                                child: Container(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Column(
                                          children: [
                                            Text(
                                                "id_etudiant : ${listEtudiant[index].id}"),
                                            const SizedBox(height: 10),
                                            Text(
                                                "nom/prénom : ${listEtudiant[index].nom_prenom}"),
                                            const SizedBox(height: 10),
                                          ],
                                        ),
                                        CheckboxExample()
                                      ]),
                                ),
                              );
                            },
                          )),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              for (var i = 0; i < listEtudiant.length; i++) {
                addAbsence(listEtudiant[i].id);
              }
            },
            backgroundColor: Colors.grey,
            child: Text("Submit"),
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

class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.grey;
      }
      return Colors.red;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
