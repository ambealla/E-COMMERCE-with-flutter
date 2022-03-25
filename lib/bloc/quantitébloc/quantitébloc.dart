import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

enum QuantiteEvent { initial ,increment,decrement }




abstract class QuantiteState extends Equatable {
}
class InitialStat extends QuantiteState {
 final int quantity;
  InitialStat({required this.quantity});

  @override
  List<Object?> get props => [];
}

class Increment extends QuantiteState {
  int quantity;
Increment({required this.quantity});
@override
List<Object?> get props =>[quantity];
}

class Decrement extends QuantiteState {
  int quantity;
 Decrement({required this.quantity});
  @override

  List<Object?> get props =>[quantity];
}





class Quantitebloc extends Bloc<QuantiteEvent, QuantiteState>{
  Quantitebloc(initialState) : super(initialState);
 int quantite=0;
  @override
  Stream<QuantiteState> mapEventToState(QuantiteEvent event) async*{
    switch (event) {
      case QuantiteEvent.initial :
        yield InitialStat(quantity:quantite);

        break;
      case QuantiteEvent.increment:
        yield Increment(quantity:quantite++);
        print("hrloooooo");
        break;
      case QuantiteEvent.decrement:
        yield Decrement(quantity:quantite--);
        break;
  }

}}