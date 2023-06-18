import 'package:copihass/models/absence.dart';
import 'package:copihass/ui/absence/bloc/absence_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../account/NavBar.dart';
import '../authentication/loginPage.dart';

class AbsencePage extends StatefulWidget {
  @override
  State<AbsencePage> createState() => _AbsencePageState();
}

class _AbsencePageState extends State<AbsencePage> {
  List<Absence> absenceList = [];

  @override
  void initState() {
    super.initState();
    context.read<AbsenceBloc>().add(GetAbsenceList());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AbsenceBloc, AbsenceState>(
      listener: (context, state) {
        if (state is AbsenceLoaded) {
          absenceList = state.responseList;
        }
      },
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: state is AbsenceInitial || state is AbsenceLoading
                ? AbsenceListLoader()
                : ListView.builder(
                    itemCount: absenceList.length,
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
                              "Absence: ${absenceList[index].etudiant}",
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      );
                    },
                  ),
        )
        ;
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
