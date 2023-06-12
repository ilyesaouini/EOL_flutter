part of 'absence_bloc.dart';

abstract class AbsenceEvent extends Equatable {
  const AbsenceEvent();

  @override
  List<Object> get props => [];
}

class GetAbsenceList extends AbsenceEvent{}