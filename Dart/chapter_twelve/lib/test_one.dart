// Predicting the order in which the tasks will run
// Correctly predicted !!

void main(List<String> args) async {
  print("Hello from synchronous 1");
  Future.microtask(() => print("Hello from microtask 1"));
  Future.microtask(() => print("Hello from microtask 2"));
  print("Hello from synchronous 2");
  Future.microtask(() => print("Hello from microtask 3"));
  print("Hello from synchronous 3");
  Future.delayed(
    Duration(seconds: 2),
  ).then((value) => print("Hello from delayed 2"));
  //
  final value = await Future.delayed(
    Duration(seconds: 2),
    () => "Hello from delayed 1",
  );
  //
  print(value);
  print("Hello from synchronous 4");
  Future.microtask(() => print("Hello from microtask 4"));
}