import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:copihass/ui/absence1/repos/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/absence.dart';

part 'absence1_event.dart';
part 'absence1_state.dart';

class Absence1Bloc extends Bloc<Absence1Event, Absence1State> {
  Absence1Bloc() : super(Absence1Initial()) {
    on<AbsencesInitialFetchEvent>(absencesInitialFetchEvent);
  }
}

FutureOr<void> absencesInitialFetchEvent(
  AbsencesInitialFetchEvent event,Emitter<Absence1State> emit) async{
    emit(AbsencesFetchingLoadingState());
    List<Absence> absences = await AbsRepo.fetchAbsence();
    emit(AbsencesFetchingSuccessState(absences: absences));
  }
