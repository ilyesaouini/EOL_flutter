import 'package:copihass/models/absence.dart';
import 'package:copihass/ui/absence/bloc/absence_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../account/NavBar.dart';
import '../authentication/loginPage.dart';

class absencePage extends StatefulWidget {
  final Absence? absence;
  const absencePage({this.absence, super.key});

  @override
  State<absencePage> createState() => _absencePageState();
}

class _absencePageState extends State<absencePage> {
  final AbsenceBloc _absenceBloc = AbsenceBloc();

  @override
  void initState() {
    _absenceBloc.add(GetAbsenceList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 236, 26, 26),
        title: Text('Absences'),
        actions: [
          IconButton(
              onPressed: () {
                prefs.remove("token");
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: ((context) => SignInPage())),
                    (route) => false);
              },
              icon: Icon(Icons.logout_outlined))
        ],
      ),
      body: _buildListABsence(),
    );
  }
}

Widget _buildListABsence() {
  return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => AbsenceBloc(),
        child: BlocListener<AbsenceBloc, AbsenceState>(
          listener: (context, state) {
            if (state is AbsenceError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message!)),
              );
            }
          },
          child: BlocBuilder<AbsenceBloc, AbsenceState>(
            builder: (context, state) {
              if (state is AbsenceInitial) {
                return _buildLoading();
              } else if (state is AbsenceLoading) {
                return _buildLoading();
              } else if (state is AbsenceLoaded) {
                return _buildCard(context, state.absenceModel);
              } else if (state is AbsenceError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ));
}

Widget _buildCard(BuildContext context, Absence absence) {
  return ListView.builder(
    itemCount: absence.id_absence,
    itemBuilder: (context, index) {
      return Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.grey.shade600,
            borderRadius: BorderRadius.circular(10),
            border:
                Border.all(color: Color.fromARGB(255, 17, 17, 17), width: 0.5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Absence: ${absence.id_absence}",
            ),
            const SizedBox(height: 10),
          ],
        ),
      );
    },
  );
}

Widget _buildLoading() => const Center(
      child: CircularProgressIndicator(
        color: Colors.red,
      ),
    );
