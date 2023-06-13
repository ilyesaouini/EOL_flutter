part of 'absence1_bloc.dart';


@immutable
abstract class Absence1State  {
 
}

abstract class Absence1ActionState extends Absence1State{}

class Absence1Initial extends Absence1State {}

class AbsencesFetchingLoadingState extends Absence1State {}

class AbsencesFetchingErrorState extends Absence1State {}

class AbsencesFetchingSuccessState extends Absence1State {
  final List<Absence> absences;
  AbsencesFetchingSuccessState({
    required this.absences,
  });
}
