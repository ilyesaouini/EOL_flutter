import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'emploi_event.dart';
part 'emploi_state.dart';

class EmploiBloc extends Bloc<EmploiEvent, EmploiState> {
  EmploiBloc() : super(EmploiInitial()) {
    on<EmploiEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
