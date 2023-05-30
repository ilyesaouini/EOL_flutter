import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'reclamation_event.dart';
part 'reclamation_state.dart';

class ReclamationBloc extends Bloc<ReclamationEvent, ReclamationState> {
  ReclamationBloc() : super(ReclamationInitial()) {
    on<ReclamationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
