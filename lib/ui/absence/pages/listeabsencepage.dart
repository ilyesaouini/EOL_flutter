import 'package:copihass/models/absencenew.Model.dart';
import 'package:copihass/ui/absence/pages/absence_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/absence_bloc.dart';

class ListAbsence extends StatefulWidget {
  final String? code_cl;
  final String? code_module;
  final String? id_ens;
  const ListAbsence({super.key, this.code_cl, this.code_module, this.id_ens});

  @override
  State<ListAbsence> createState() => _ListAbsenceState();
}

class _ListAbsenceState extends State<ListAbsence> {
  List<AbsenceNew> liste = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AbsenceBloc>().add(AbsenceList(widget.code_cl.toString(),
        widget.code_module.toString(), widget.id_ens.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AbsenceBloc, AbsenceState>(
      listener: (context, state) {
        if (state is AbsenceLoaded) {
          liste = state.responseList;
        }
      },
      builder: (context, state) {
        return Scaffold(
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
                    itemCount: liste.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return AbsenceDetails(absence: liste[index]);
                          }));
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 201, 201, 201),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: const Color.fromARGB(255, 17, 17, 17),
                                  width: 0.5)),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Id_etudiant : ${liste[index].id_et}",
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Code module: ${liste[index].code_module}",
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "numéro séance: ${liste[index].num_seance}",
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Date séance: ${liste[index].date_seance.toString()}",
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
