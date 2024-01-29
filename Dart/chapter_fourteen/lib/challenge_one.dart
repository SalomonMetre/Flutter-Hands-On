import 'dart:io';
import 'dart:isolate';

void fibonacci(List<Object?> arguments) {
  final n = arguments[1] as int;
  final sendPort = arguments[0] as SendPort;
  if (n == 1 || n == 2) Isolate.exit(sendPort, 1);
  var a = 1, b = 1, c = 2, counter = 3;
  while (counter < n) {
    a = b;
    b = c;
    c = a + b;
    counter++;
  }
  Isolate.exit(sendPort, c);
}

void main(List<String> args) async {
  final receivePort = ReceivePort();
  print("Enter rank of your fibonacci number : ");
  final userValue = int.tryParse(stdin.readLineSync()!);
  await Isolate.spawn<List<Object?>>(
      fibonacci, [receivePort.sendPort, userValue]);
  receivePort.listen((message) {
    print("Message : $message");
    if (message is int) receivePort.close();
  });
}
