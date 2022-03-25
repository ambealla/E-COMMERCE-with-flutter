import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'counter_state.dart';



part 'Incre.dart';

class Counter_Bloc extends Bloc<IncreamentEvent, CounterState> {

  int counter = 0;

  Counter_Bloc( CounterState initialState) : super(initialState);

  @override
  Stream<CounterState> mapEventToState(IncreamentEvent event) async* {
    switch (event) {
      case IncreamentEvent.Beaute:
        yield Beaute();
        break;
      case IncreamentEvent.sport:
        yield sport();
        break;
      case IncreamentEvent.vetement:
        yield vetement();
        break;
      case IncreamentEvent.all:
        yield all();
        break;
      case IncreamentEvent.electronique:
        yield electronique();
        break;
      case IncreamentEvent.initial:
        yield all();
        break;
      case IncreamentEvent.game:
        yield game();
        break;
    }
    if (event is InitialState){
      yield all();

    }

  }
}
