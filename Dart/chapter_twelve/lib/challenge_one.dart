import 'dart:async';
import 'dart:math';

void main(List<String> args) async {
  final randomGen = Random();
  final completer = Completer<int>();
  if(randomGen.nextInt(2) == 0){
    completer.complete(42);
  }else{
    completer.completeError(ArgumentError("Error"));
  }
  print(await completer.future);
}