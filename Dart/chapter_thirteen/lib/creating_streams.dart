void main(List<String> args) async {
  // method one
  // var myStream = Stream.empty();
  // await for (final event in myStream) {
  //   print(event);
  // }

  // myStream = Stream.error("Error");
  // await for (final event in myStream) {
  //   print(event);
  // }

  // final newStream = Stream<String>.fromFuture(
  //   Future.delayed(
  //       const Duration(seconds: 2), () => "String result from future!"),
  // );
  // await for (final event in newStream) {
  //   print(event);
  // }

  final stream = Stream<int>.fromFutures([
    Future.delayed(const Duration(seconds: 1), () => 1),
    Future.delayed(const Duration(seconds: 5), () => 5),
    Future.delayed(const Duration(seconds: 3), () => 2),
  ]);
  await for (final value in stream) {
    print("Value : $value");
  }
}
