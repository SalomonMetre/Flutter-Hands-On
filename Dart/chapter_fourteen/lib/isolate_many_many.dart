// here we illustrate how to use an isolate that takes multiple arguments
// and can send multiple messages as well

import 'dart:isolate';
import 'dart:math';

void doRandomCountingUpTo(Map<String, Object> arguments){ //List<Object> arguments) {
  final randGen = Random();
  final sendPort = arguments["sendPort"] as SendPort;
  final limit = arguments["limit"] as int;
  for (int i = 0; i < limit; i++) {
    sendPort.send(randGen.nextInt(10));
  }
  sendPort.send("Counting is over");
}

void main(List<String> args) async {
  int counter = 0;
  final receivePort = ReceivePort();
  final isolate = await Isolate.spawn(
      doRandomCountingUpTo, <String, Object>{"sendPort":receivePort.sendPort, "limit":5}); //[receivePort.sendPort, 5]);
  await for (final value in receivePort) {
    print(value);
    counter++;
    if (counter == 6) {
      receivePort.close();
      isolate.kill();
    }
  }
}
