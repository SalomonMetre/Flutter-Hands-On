import 'dart:isolate';
import 'dart:math';

void doVeryLongCounting(SendPort sendPort) async {
  final randGen = Random();
  sendPort.send("Counting has started");
  for (int i = 0; i < 10000000; i++) {
    await Future.delayed(Duration(seconds: 1));
    sendPort.send(randGen.nextInt(100));
  }
}
void main(List<String> args) async {
  final receivePort = ReceivePort();
  final isolate = await Isolate.spawn<SendPort>(
    doVeryLongCounting,
    receivePort.sendPort,
  );
  await for (final message in receivePort) {
    if (message == 5) {
      receivePort.close();
      isolate.kill();
    }
    print(message);
  }
}
