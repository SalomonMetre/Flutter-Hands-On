void main(List<String> args) async {
  final stream = Stream.periodic(
    Duration(seconds: 1),
    (value) => 2*value,  
  );
  await for(final number in stream.take(5)){
    print(number);
  }
}