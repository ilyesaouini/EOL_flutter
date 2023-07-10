part of 'resultat_bloc.dart';

@immutable
abstract class ResultatEvent {
   const ResultatEvent();

  @override
  List<Object> get props => [];
}

class GetResultatList extends ResultatEvent{}