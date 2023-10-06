part of 'resultat_bloc.dart';

@immutable
abstract class ResultatEvent {
  const ResultatEvent();

  @override
  List<Object> get props => [];
}

class GetResultatList extends ResultatEvent {}

class AddAutorisation extends ResultatEvent {
  final num? etat_note;
  final num? etat_resultat;
   AddAutorisation(this.etat_note, this.etat_resultat);
}
class GetAutorisationList extends ResultatEvent {}
