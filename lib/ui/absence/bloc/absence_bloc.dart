import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'absence_event.dart';
part 'absence_state.dart';

class AbsenceBloc extends Bloc<AbsenceEvent, AbsenceState> {
  AbsenceBloc() : super(AbsenceInitial()) {
    on<AbsenceEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
