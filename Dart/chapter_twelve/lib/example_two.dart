void main(List<String> args) async {
  // using futures with async/await
  print("Before the future");
  final value = await Future<int>.delayed(
    Duration(seconds: 1, microseconds: 500),
    () => 42,
  );
  print(value);
  print("After the future");
}