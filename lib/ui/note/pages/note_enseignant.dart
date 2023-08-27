import 'package:copihass/models/plan_class_session.dart';
import 'package:copihass/ui/note/bloc/note_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/note.Model.dart';
import '../../../models/note.dart';
import '../../../models/user.dart';
import 'notedetails.dart';

class NoteEnseignantPage extends StatefulWidget {
  final SharedPreferences prefs;
  const NoteEnseignantPage({required this.prefs, super.key});

  @override
  State<NoteEnseignantPage> createState() => _NoteEnseignantPageState();
}

class _NoteEnseignantPageState extends State<NoteEnseignantPage> {
  List<Plan_Class_Session> noteList = [];
  User user = User();

  @override
  void initState() {
    user = User(
      id: widget.prefs.getString('id'),
      role: widget.prefs.getString('role'),
    );
    super.initState();
    context.read<NoteBloc>().add(GetNoteList());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteBloc, NoteState>(
      listener: (context, state) {
        if (state is PanierLoaded) {
          noteList = state.responseList;
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
            child: state is NoteInitial || state is PanierLoading
                ? NoteListLoader()
                : RefreshIndicator(
                    onRefresh: () async {
    context.read<NoteBloc>().add(GetNoteList());

                    },
                    child: ListView.builder(
                      itemCount: noteList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            /* Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return NoteDetails(note: noteList[index]);
                            }));
                            */
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Etudiant: ${noteList[index].code_cl}",
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Module: ${noteList[index].code_module}",
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          )),
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
