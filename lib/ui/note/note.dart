import 'package:copihass/ui/note/bloc/note_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/note.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  List<Note> noteList = [];

  @override
  void initState() {
    super.initState();
    context.read<NoteBloc>().add(GetNoteList());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteBloc, NoteState>(
      listener: (context, state) {
        if (state is NoteLoaded) {
          noteList = state.responseList;
        }
      },
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: state is NoteInitial || state is NoteLoading
              ? NoteListLoader()
              : ListView.builder(
                  itemCount: noteList.length,
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
                            "Absence: ${noteList[index].etudiant}",
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
