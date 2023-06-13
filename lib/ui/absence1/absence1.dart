import 'package:copihass/ui/absence1/bloc/absence1_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AbsPage extends StatefulWidget {
  const AbsPage({super.key});

  @override
  State<AbsPage> createState() => _AbsPageState();
}

class _AbsPageState extends State<AbsPage> {
  final Absence1Bloc absence1bloc = Absence1Bloc();

  @override
  void initState() {
    absence1bloc.add(AbsencesInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Abs')),
      body: BlocConsumer<Absence1Bloc, Absence1State>(
        bloc: absence1bloc,
        listenWhen: (previous, current) => current is Absence1ActionState,
        buildWhen: (previous, current) => current is! Absence1ActionState,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case AbsencesFetchingSuccessState:
              final succesState = state as AbsencesFetchingSuccessState;

              return Container(
                  child: ListView.builder(
                itemCount: succesState.absences.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: [
                        Text(succesState.absences[index].id_absence.toString())
                      ],
                    ),
                  );
                },
              ));
            default:
              return const SizedBox();
          }
          return Container();
        },
      ),
    );
  }
}
