import 'package:copihass/models/reclamation.dart';
import 'package:copihass/ui/reclamation/widgets/dialog_box.dart';
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
  const ReclamationPage({required this.prefs, super.key});

  @override
  State<ReclamationPage> createState() => _ReclamationPageState();
}

class _ReclamationPageState extends State<ReclamationPage> {
  TextEditingController descriptionController = TextEditingController();
  List<Reclamation> reclamationList = [];
  @override
  void initState() {
    super.initState();
    context.read<ReclamationBloc>().add(GetReclamationList());
    context.read<ReclamationBloc>().add(AddReclamationSimpleEvent(
        widget.prefs.get("id"), descriptionController.text));
  }

  addSimpleReclamation() {
    if (descriptionController.text.isNotEmpty) {
      context.read<ReclamationBloc>().add(AddReclamationSimpleEvent(
          widget.prefs.get("id"), descriptionController.text));
    }
  }

  // create a new task
  createNewReclamation() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: descriptionController,
          onSave: addSimpleReclamation(),
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
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
        return Scaffold(
          body: Container(
            color: Colors.white,
            child: state is ReclamationInitial || state is ReclamationLoading
                ? ReclamationListLoader()
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
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () => showDialog(
                    context: context,
                    builder: (context) {
                      return DialogBox(
                        controller: descriptionController,
                        onSave: addSimpleReclamation(),
                        onCancel: () => Navigator.of(context).pop(),
                      );
                    },
                  ),
              child: Icon(
                Icons.add_alert_outlined,
                color: Colors.red,
              )),
        );
      },
    );
  }
}

class ReclamationListLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.red,
      ),
    );
  }
}
