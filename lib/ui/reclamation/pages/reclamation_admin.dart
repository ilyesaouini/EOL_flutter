import 'package:copihass/models/reclamation.dart';
import 'package:copihass/ui/reclamation/pages/reclamationdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/user.dart';

import '../bloc/reclamation_bloc.dart';

class ReclamationAdminPage extends StatefulWidget {
  final SharedPreferences prefs;
  const ReclamationAdminPage({required this.prefs, super.key});

  @override
  State<ReclamationAdminPage> createState() => _ReclamationAdminPageState();
}

class _ReclamationAdminPageState extends State<ReclamationAdminPage> {
  User user = User();

  TextEditingController descriptionController = TextEditingController();
  List<Reclamation> reclamationList = [];
  @override
  void initState() {
    super.initState();
    user = User(
      id: widget.prefs.getString('id'),
    );
    context.read<ReclamationBloc>().add(GetReclamationList());
    context
        .read<ReclamationBloc>()
        .add(AddReclamationSimpleEvent(user.id, descriptionController.text));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReclamationBloc, ReclamationState>(
      listener: (context, state) {
        if (state is ReclamationLoaded) {
          reclamationList = state.responseList;
          // print('id reclamation = ${reclamationList[1].id_reclamation}');
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
              child: state is ReclamationInitial || state is ReclamationLoading
                  ? ReclamationListLoader()
                  : RefreshIndicator(
                      onRefresh: () async {
                        context
                            .read<ReclamationBloc>()
                            .add(GetReclamationList());
                      },
                      child: ListView.builder(
                        itemCount: reclamationList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Description: ${reclamationList[index].description}",
                                  ),
                                  const SizedBox(height: 10),
                                  (reclamationList[index].reponse == null)
                                      ? Text(
                                          "Reponse: __",
                                        )
                                      : Text(
                                          "Reponse: ${reclamationList[index].reponse}"),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Module: ${reclamationList[index].module}",
                                  ),
                                  const SizedBox(height: 10),
                                  (reclamationList[index].enseignant == null)
                                      ? Text(
                                          "Enseignant: __",
                                        )
                                      : Text(
                                          "Enseignant:${reclamationList[index].enseignant}"),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Status: ${reclamationList[index].status}",
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ),
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
