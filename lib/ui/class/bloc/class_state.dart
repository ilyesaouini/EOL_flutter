part of 'class_bloc.dart';

abstract class ClassState extends Equatable {
  const ClassState();

  @override
  List<Object> get props => [];
}

class ClassInitial extends ClassState {}

class ClassLoading extends ClassState {}

class ClassLoaded extends ClassState {
  final List<Plan_Class_Session> classList;
  const ClassLoaded(this.classList);
}

class ClassError extends ClassState{
  final String? message;
  const ClassError(this.message);
}