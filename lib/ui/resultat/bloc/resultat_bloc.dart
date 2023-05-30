import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'resultat_event.dart';
part 'resultat_state.dart';

class ResultatBloc extends Bloc<ResultatEvent, ResultatState> {
  ResultatBloc() : super(ResultatInitial()) {
    on<ResultatEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
