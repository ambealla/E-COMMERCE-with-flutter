import 'package:equatable/equatable.dart';

abstract class CounterState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialState extends CounterState {}

class Beaute extends CounterState {}

class sport extends CounterState {}

class vetement extends CounterState {}
class all extends CounterState {}

class electronique extends CounterState {}


class game extends CounterState {}
