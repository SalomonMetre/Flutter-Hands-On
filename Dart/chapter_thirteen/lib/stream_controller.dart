import 'dart:async';

void main(List<String> args) {
  final streamController = StreamController<String>();
  final stream = streamController.stream;
  final sink = streamController.sink;
  stream.listen(
    (value) => print(value),
    onError: (Object error) => print(error),
    onDone: () => print("Done"),
  );
  sink.add("Salomon");
  sink.add("Joseph");
  sink.add("Benedicte");
  sink.addError(Exception("Error"));
  sink.add("Marie-Reine");
  sink.close();
}
