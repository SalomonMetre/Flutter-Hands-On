import 'dart:isolate';

void doVeryLongCounting(SendPort sendPort) {
  int counter = 0;
  for (int i = 0; i < 1000000000; i++) {
    counter++;
  }
  final message = "Long count : $counter";
  Isolate.exit(sendPort, message);
}

void main(List<String> args) async {
  final receivePort = ReceivePort();
  await Isolate.spawn<SendPort>(
    doVeryLongCounting,
    receivePort.sendPort,
  );
  final message = await receivePort.first;
  print(message);
}
