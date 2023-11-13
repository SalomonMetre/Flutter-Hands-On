import 'dart:isolate';

class Work {
  Future<int> doSomething() async {
    print("doing some work...");
    await Future.delayed(const Duration(seconds: 1));
    return 42;
  }

  Future<int> doSomethingElse() async {
    print("doing something else...");
    await Future.delayed(const Duration(seconds: 1));
    return 24;
  }
}

/// Creating an entry point
Future<void> _entryPoint(SendPort sendToEarthPort) async {
  final receiveOnMarsPort = ReceivePort();
  sendToEarthPort.send(receiveOnMarsPort.sendPort);
  final work = Work();
  receiveOnMarsPort.listen((Object? messageFromEarth) async {
    await Future.delayed(const Duration(seconds: 1));
    print("Message from Earth : $messageFromEarth");

    if (messageFromEarth == "Hey from Earth") {
      sendToEarthPort.send("Hey from Mars");
    } else if (messageFromEarth == "Can you help?") {
      sendToEarthPort.send("Sure!");
    } else if (messageFromEarth == "doSomething") {
      final result = await work.doSomething();
      sendToEarthPort.send({
        "method": "doSomething",
        "result": result,
      });
    } else if (messageFromEarth == "doSomethingElse") {
      final resultSomethingElse = await work.doSomethingElse();
      sendToEarthPort.send({
        "method": "doSomethingElse",
        "result": resultSomethingElse,
      });
      sendToEarthPort.send("Done!");
    }
  });
}

class Earth {
  final _receiveOnEarthPort = ReceivePort();
  SendPort? _sendToMarsPort;
  Isolate? _marsIsolate;

  Future<void> _contactMars() async {
    if (_marsIsolate != null) return;
    _marsIsolate = await Isolate.spawn<SendPort>(
      _entryPoint,
      _receiveOnEarthPort.sendPort,
    );
    _receiveOnEarthPort.listen((Object? messageFromMars) async {
      await Future.delayed(const Duration(seconds: 1));
      print("Message from Mars : $messageFromMars");

      if (messageFromMars is SendPort) {
        _sendToMarsPort = messageFromMars;
        _sendToMarsPort?.send("Hey from Earth");
      } else if (messageFromMars == "Hey from Mars") {
        _sendToMarsPort?.send("Can you help?");
      } else if (messageFromMars == "Sure!") {
        _sendToMarsPort?.send("doSomething");
        _sendToMarsPort?.send("doSomethingElse");
      } else if (messageFromMars is Map) {
        final method = messageFromMars["method"] as String;
        final result = messageFromMars["result"] as int;
        print("The result of method $method is $result");
      } else if (messageFromMars == "Done!") {
        print("Shutting down the child isolate");
        dispose();
      }
    });
  }

  void dispose() {
    _receiveOnEarthPort.close();
    _marsIsolate?.kill();
    _marsIsolate = null;
  }
}

void main(List<String> args) async {
  final earth = Earth();
  await earth._contactMars();
}
