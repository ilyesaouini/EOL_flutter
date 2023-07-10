import 'package:copihass/models/reclamation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../account/NavBar.dart';
import '../account/bloc/account_bloc.dart';
import '../authentication/loginPage.dart';
import 'bloc/reclamation_bloc.dart';

class ReclamationPage extends StatefulWidget {
  final SharedPreferences prefs;
  const ReclamationPage({required this.prefs,super.key});

  @override
  State<ReclamationPage> createState() => _ReclamationPageState();
}

class _ReclamationPageState extends State<ReclamationPage> {
  List<Reclamation> reclamationList = [];
  @override
  void initState() {
    super.initState();
    context.read<ReclamationBloc>().add(GetReclamationList());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReclamationBloc, ReclamationState>(
      listener: (context, state) {
        if (state is ReclamationLoaded) {
          reclamationList = state.responseList;
        }
      },
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: state is ReclamationInitial || state is ReclamationLoading
              ? NoteListLoader()
              : ListView.builder(
                  itemCount: reclamationList.length,
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
                            "Description: ${reclamationList[index].description}",
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Reponse: ${reclamationList[index].reponse}",
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Module: ${reclamationList[index].module}",
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Enseignant: ${reclamationList[index].enseignant}",
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Re-reclamation: ${reclamationList[index].reclamation}",
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Status: ${reclamationList[index].status}",
                          ),
                          const SizedBox(height: 10),
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

class NoteListLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.red,
      ),
    );
  }
}
