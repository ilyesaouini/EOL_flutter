import 'package:copihass/models/inscription.dart';
import 'package:copihass/ui/resultat/bloc/resultat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultatPage extends StatefulWidget {
  final SharedPreferences prefs;
  const ResultatPage({required this.prefs, super.key});

  @override
  State<ResultatPage> createState() => _ResultatPageState();
}

class _ResultatPageState extends State<ResultatPage> {
  List<Inscription> inscriptionList = [];

  @override
  void initState() {
    super.initState();
    context.read<ResultatBloc>().add(GetResultatList());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResultatBloc, ResultatState>(
      listener: (context, state) {
        if (state is ResultatLoaded) {
          inscriptionList = state.responseList;
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
          child: state is ResultatInitial || state is ResultatLoading
              ? ResultatListLoader()
              : ListView.builder(
                  itemCount: inscriptionList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade600,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: const Color.fromARGB(255, 17, 17, 17),
                              width: 0.5)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Etudiant: ${inscriptionList[index].etudiant}",
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Annee: ${inscriptionList[index].annee}",
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Moyenne generele: ${inscriptionList[index].moy_generale.toString()}",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Moyenne semestre1: ${inscriptionList[index].moy_semestre1.toString()}",
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Decision: ${inscriptionList[index].decision}",
                          ),
                        ],
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
