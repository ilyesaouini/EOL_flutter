part of 'reclamation_bloc.dart';

@immutable
abstract class ReclamationEvent {
  const ReclamationEvent();

  @override
  List<Object> get props => [];

}
class GetReclamationList extends ReclamationEvent{}